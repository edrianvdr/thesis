<?php

namespace App\Livewire;

use Livewire\Component;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Models\AppSetting;
use App\Models\UserProfile;
use App\Models\User;
use App\Models\WorkerProfile;
use App\Models\WorkerProfileView;
use App\Models\Booking;
use App\Models\SpecificService;


use App\Models\Category;
use App\Models\Service;

class HomePage extends Component
{
    public $settings;
    public $app_name;
    public $app_logo;
    // Search and Filter
    public $is_searching = 0;
    public $search;
    public $category;
    public $service;
    public $categories;
    public $services;

    // For displaying workers
    public $random_value;
    public $workers;
    public $same_city_workers;
    public $same_region_workers;
    public $mostViewedCategory;

    // MVC = Most Viewed Category
    public $mvc_same_city_workers;
    public $mvc_same_province_workers;
    public $mvc_same_region_workers;

    // Specific Service
    public $specific_service;

    public function mount()
    {
        $this->settings = AppSetting::firstOrFail();
        $this->app_name = $this->settings->app_name;
        $this->app_logo = $this->settings->app_logo;
        // Category and Service
        $this->categories = Category::all();
        $this->services = collect();

        $this->random_value = rand(1, 2); // Random value to determine sorting criteria

        // Recommend workers under the user's most viewed category
        $this->mostViewedCategory = WorkerProfile::getMostViewedCategory();
        if ($this->mostViewedCategory == "") {
            // If user hasn't viewed any worker's profile yet, display all workers
            if ($this->random_value == 1) {
                $this->mostViewedCategory = "Most Rated";
                $this->workers = WorkerProfile::allWorkersByRatings();

                $this->setPricesForWorkers($this->workers);

            } else if ($this->random_value == 2) {
                $this->mostViewedCategory = "Most Completed Bookings";
                $this->workers = WorkerProfile::allWorkersByCompletedBookings();

                $this->setPricesForWorkers($this->workers);
            }
        } else {
            if ($this->random_value == 1) {
                $this->mvc_same_city_workers = WorkerProfile::underMostViewedCategoryInSameCityByRatings();
                $this->mvc_same_province_workers = WorkerProfile::underMostViewedCategoryInSameProvinceByRatings();
                $this->mvc_same_region_workers = WorkerProfile::underMostViewedCategoryInSameRegionByRatings();

                $this->workers = $this->mvc_same_city_workers
                    ->concat($this->mvc_same_province_workers)
                    ->concat($this->mvc_same_region_workers);

                $this->setPricesForWorkers($this->workers);
            } else if ($this->random_value == 2) {
                $this->mvc_same_city_workers = WorkerProfile::underMostViewedCategoryInSameCityByCompletedBookings();
                $this->mvc_same_province_workers = WorkerProfile::underMostViewedCategoryInSameProvinceByCompletedBookings();
                $this->mvc_same_region_workers = WorkerProfile::underMostViewedCategoryInSameRegionByCompletedBookings();

                $this->workers = $this->mvc_same_city_workers
                    ->concat($this->mvc_same_province_workers)
                    ->concat($this->mvc_same_region_workers);

                $this->setPricesForWorkers($this->workers);
            }
        }

        // Workers in Same City
        $this->same_city_workers = WorkerProfile::inSameCityAsLoggedInUserByRating();
        $this->setPricesForWorkers($this->same_city_workers);

        // Workers in Same Region except same city
        $this->same_region_workers = WorkerProfile::inSameRegionAsLoggedInUserByRating();
        $this->setPricesForWorkers($this->same_region_workers);
    }

    // Method to set lowest and highest prices for workers
    private function setPricesForWorkers($workers)
    {
        if ($workers instanceof \Illuminate\Support\Collection) {
            $workers->each(function ($worker) {
                $specificServices = SpecificService::where('worker_id', $worker->id)->get();
                $prices = $specificServices->pluck('price')->toArray();
                $lowestPrice = count($prices) > 0 ? min($prices) : 0;
                $highestPrice = count($prices) > 0 ? max($prices) : 0;
                $worker->lowest_price = $lowestPrice;
                $worker->highest_price = $highestPrice;
            });
        } elseif (is_array($workers)) {
            foreach ($workers as &$worker) {
                $specificServices = SpecificService::where('worker_id', $worker['id'])->get();
                $prices = $specificServices->pluck('price')->toArray();
                $lowestPrice = count($prices) > 0 ? min($prices) : 0;
                $highestPrice = count($prices) > 0 ? max($prices) : 0;
                $worker['lowest_price'] = $lowestPrice;
                $worker['highest_price'] = $highestPrice;
            }
        }
    }


    // Filter by Category
    public function filterByCategory()
    {
        $this->services = Service::where('category_id', $this->category)->get();

        $this->is_searching = 1;

        $query = WorkerProfile::query();

        if (!empty($this->category)) {
            $query->where('category_id', $this->category);
            $category = Category::find($this->category);
            $this->mostViewedCategory = $category ? $category->category : null;
        }

        if (!empty($this->search)) {
            $searchTerms = explode(' ', $this->search);

            $query->whereHas('user.userProfile', function ($subquery) use ($searchTerms) {
                $subquery->where(function ($q) use ($searchTerms) {
                    foreach ($searchTerms as $term) {
                        $q->where('first_name', 'like', '%' . $term . '%')
                            ->orWhere('middle_name', 'like', '%' . $term . '%')
                            ->orWhere('last_name', 'like', '%' . $term . '%');
                    }
                });
            });
        }

        // Workers with Ratings
        $this->workers = $query->with(['user.userProfile', 'address', 'bookings' => function ($query) {
            $query->where('status', 'Completed'); // Filter bookings by completed status
        }])->get();

        // Calculate average rating and completed bookings count for each worker
        $this->workers->each(function ($worker) {
            $bookings = $worker->bookings;

            if ($bookings->isNotEmpty()) {
                $worker->average_rating = $bookings->avg('rating');
                $worker->completed_count = $bookings->count();
            } else {
                $worker->average_rating = 0; // Set rating to 0 if there are no bookings
                $worker->completed_count = 0; // Set count to 0 if there are no bookings
            }
        });

        // Sort workers by average rating in descending order
        $this->workers = $this->workers->sortByDesc('average_rating')->values();

        $this->setPricesForWorkers($this->workers);
    }


    // Filter by Service
    public function filterByService()
    {
        $query = WorkerProfile::query();

        if (!empty($this->service)) {
            $query->where('service_id', $this->service);

            $service = Service::find($this->service);
            $this->mostViewedCategory = $service ? $service->category->category . " > " . $service->service : null;

            $this->workers = $query->get();
            $this->setPricesForWorkers($this->workers);
        } else if (!empty($this->category)) {
            $query->where('category_id', $this->category);

            $category = Category::find($this->category);
            $this->mostViewedCategory = $category ? $category->category : null;

            $this->workers = $query->get();
            $this->setPricesForWorkers($this->workers);
        }

        if (!empty($this->search)) {
            $searchTerms = explode(' ', $this->search);

            $query->whereHas('user.userProfile', function ($subquery) use ($searchTerms) {
                $subquery->where(function ($q) use ($searchTerms) {
                    foreach ($searchTerms as $term) {
                        $q->where('first_name', 'like', '%' . $term . '%')
                            ->orWhere('middle_name', 'like', '%' . $term . '%')
                            ->orWhere('last_name', 'like', '%' . $term . '%');
                    }
                });
            });

            $this->workers = $query->get();
            $this->setPricesForWorkers($this->workers);
        }
    }

    public function searchWorker()
    {
        $this->is_searching = 1;

        $query = WorkerProfile::query();

        if (!empty($this->search)) {
            $searchTerms = explode(' ', $this->search);

            $query->whereHas('user.userProfile', function ($subquery) use ($searchTerms) {
                $subquery->where(function ($q) use ($searchTerms) {
                    foreach ($searchTerms as $term) {
                        $q->where('first_name', 'like', '%' . $term . '%')
                            ->orWhere('middle_name', 'like', '%' . $term . '%')
                            ->orWhere('last_name', 'like', '%' . $term . '%');
                    }
                });
            });

            $this->workers = $query->with(['user.userProfile', 'address', 'bookings' => function ($query) {
                $query->where('status', 'Completed'); // Filter bookings by completed status
            }])->get();

            // Calculate average rating and completed bookings count for each worker
            $this->workers->each(function ($worker) {
                $bookings = $worker->bookings;

                if ($bookings->isNotEmpty()) {
                    $worker->average_rating = $bookings->avg('rating');
                    $worker->completed_count = $bookings->count();
                } else {
                    $worker->average_rating = 0; // Set rating to 0 if there are no bookings
                    $worker->completed_count = 0; // Set count to 0 if there are no bookings
                }
            });

            $this->setPricesForWorkers($this->workers);
        }
    }


    public function render()
    {
    return view('livewire.home-page');
    }
}
