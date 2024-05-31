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

    public function mount($userId, $workerProfileId)
    {
        $this->userId = $userId;
        $this->workerProfileId = $workerProfileId;

        $this->user = Auth::user();
        $this->worker = User::findOrFail($userId);

        // Fetch the worker's details from user_profiles table
        $this->userProfile = UserProfile::where('user_id', $userId)->first();

        // Fetch the worker's details from worker_profiles table
        $this->workerProfile = WorkerProfile::where('id', $workerProfileId)->first();

        // Assuming the working_days column contains a string like "1,1,1,0,0,0,0"
        $workingDaysArray = explode(',', $this->workerProfile->working_days);
        $daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
        $this->availableDays = [];

        foreach ($workingDaysArray as $index => $isAvailable) {
            if ($isAvailable == 1) {
                $this->availableDays[] = $daysOfWeek[$index];
            }
        }

        // Fetch specific services for the worker
        $this->specificServices = SpecificService::where('worker_id', $workerProfileId)->get();
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
