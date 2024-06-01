<?php

namespace App\Livewire;

use Livewire\Component;

use App\Models\Region;
use App\Models\Province;
use App\Models\City;
use App\Models\Category;
use App\Models\Service;

use App\Models\User;
use App\Models\UserProfile;
use App\Models\WorkerProfile;
use App\Models\SpecificService;


use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Livewire\WithFileUploads;

class SignUpWorker extends Component
{

    // For initial load
    public $categories;
    public $services;

    public $category;
    public $service;

    // Load services options based on selected category
    public function loadServices()
    {
        $this->services = Service::where('category_id', $this->category)->get();
    }

    // For logged in user
    public $userId;
    public $userProfile;

    public function mount()
    {
        // For category and service select tags
        $this->categories = Category::all();
        $this->services = collect();

        // Initialize the working_days array with default values
        $this->working_days = [
            'sunday' => false,
            'monday' => false,
            'tuesday' => false,
            'wednesday' => false,
            'thursday' => false,
            'friday' => false,
            'saturday' => false,
        ];
    }

    public function render()
    {
        // Retrieve the authenticated user using the user_id
        $user = Auth::user();

        // Retrieve the user's details, perform any other logic as needed
        return view('livewire.sign-up-worker', [
            'user' => $user,
            'userProfile' => $this->userProfile,
        ]);
    }

    // Wir model binding
    public $specific_service;
    public $price;
    public $duration;
    public $description;
    public $working_days = [];
    public $start_time;
    public $end_time;
    public $valid_id;
    public $resume;
    public $working_days_string;


    public function sign_up_as_a_worker()
    {
        // Validate the incoming data
        $validatedData = $this->validate([
            'category' => 'required',
            'service' => 'required',
            'specific_service' => 'required',
            'price' => 'required',
            'duration' => 'required',
            'description' => 'required',
            'working_days' => 'required',
            'start_time' => 'required',
            'end_time' => 'required',
        ], [
            'category.required' => 'Category is required',
            'service.required' => 'Service is required',
            'specific_service.required' => 'Description is required',
            'price.required' => 'Description is required',
            'duration.required' => 'Description is required',
            'description.required' => 'Description is required',
            'working_days.required' => 'Working days is required',
            'start_time.required' => 'Start time is required',
            'end_time.required' => 'End time is required',
        ]);

        $user = Auth::user();

        $working_days_string = implode(',', array_map(function ($day) {
            return $day ? '1' : '0';
        }, $this->working_days));

        // Insert into worker_profiles
        $user->workerprofile()->create([
            'user_id' => $user->id,
            'category_id' => $this->category,
            'service_id' => $this->service,
            'working_days' => $working_days_string,
            'start_time' => $this->start_time,
            'end_time' => $this->end_time,
            'valid_id' => $this->valid_id,
            'resume' => $this->resume,
            'status' => 1,
        ]);

        // Insert into specific_services table
        $user->workerprofile->specificService()->create([
            'worker_id' => $user->workerprofile->id,
            'specific_service' => $this->specific_service,
            'description' => $this->description,
            'price' => $this->price,
            'duration' => $this->duration,
        ]);

        // Update the role_id to 3 in the user_profiles table
        $user->profile()->update(['role_id' => 3]);

        return redirect('/home');
    }
}
