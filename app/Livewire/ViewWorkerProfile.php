<?php

namespace App\Livewire;

use Livewire\Component;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Models\Category;
use App\Models\Service;
use App\Models\User;
use App\Models\UserProfile;
use App\Models\WorkerProfile;
use App\Models\SpecificService;
use App\Models\Booking;

class ViewWorkerProfile extends Component
{
    public $userId;
    public $workerProfileId;
    public $user;
    public $worker;
    public $userProfile;
    public $workerProfile;
    public $availableDays;
    public $specificServices;
    public $selectedSpecificService;
    public $reviews;

    public function mount($userId, $workerProfileId)
    {
        $this->userId = $userId;
        $this->workerProfileId = $workerProfileId;

        $this->user = Auth::user();
        $this->worker = User::findOrFail($userId);

        // Worker's details - user_profiles
        $this->userProfile = UserProfile::where('user_id', $userId)->first();

        // Worker's details - worker_profiles
        $this->workerProfile = WorkerProfile::where('id', $workerProfileId)->first();

        // Working Days
        $workingDaysArray = explode(',', $this->workerProfile->working_days);
        $daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
        $this->availableDays = [];

        foreach ($workingDaysArray as $index => $isAvailable) {
            if ($isAvailable == 1) {
                $this->availableDays[] = $daysOfWeek[$index];
            }
        }

        // Specific services
        $this->specificServices = SpecificService::where('worker_id', $workerProfileId)->get();

        // Reviews
        $this->reviews = Booking::where('worker_id', $workerProfileId)
            ->whereNotNull('rating')
            ->orderBy('completed_datetime', 'desc')
            ->get();
    }

    public $selected_specific_service_id;

    public function selectSpecificService($specificServiceId)
    {
        $this->selectedSpecificService = SpecificService::find($specificServiceId);
        $this->selected_specific_service_id = $this->selectedSpecificService->id;
    }

    public function isSelected($specificServiceId)
    {
        return $this->selected_specific_service_id == $specificServiceId;
    }

    public function render()
    {
        return view('livewire.view-worker-profile');
    }
}
