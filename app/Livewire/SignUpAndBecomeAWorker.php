<?php

namespace App\Livewire;

use Livewire\Component;

use App\Models\Gender;
use App\Models\MaritalStatus;
use App\Models\Region;
use App\Models\Province;
use App\Models\City;
use App\Models\Category;
use App\Models\Service;

use App\Models\User;
use App\Models\UserProfile;
use App\Models\WorkerProfile;
use App\Models\SpecificService;


use Illuminate\Support\Facades\Hash;
use Livewire\WithFileUploads;

class SignUpAndBecomeAWorker extends Component
{
    use WithFileUploads;

    public function render()
    {
        return view('livewire.sign-up-and-become-a-worker');
    }

    public $genders;
    public $marital_statuses;
    public $regions;
    public $provinces;
    public $cities;
    public $categories;
    public $services;

    public $category;
    public $service;

    // Load services options based on selected category
    public function loadServices()
    {
        $this->services = Service::where('category_id', $this->category)->get();
    }

    public function mount()
    {
        $this->genders = Gender::all();
        $this->marital_statuses = MaritalStatus::all();
        $this->regions = Region::all();
        $this->provinces = collect();
        $this->cities = collect();
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

    // Load province options when region changes
    public function loadProvinces()
    {
        $this->provinces = Province::where('region_id', $this->region)->get();
    }

    // Load city options when province changes
    public function loadCities()
    {
        $this->cities = City::where('province_id', $this->province)->get();
    }

    // Wire model binding
    public $profile_picture;
    public $path;
    public $first_name;
    public $middle_name;
    public $last_name;
    public $suffix;
    public $birthdate;
    public $gender;
    public $marital_status;

    public $home_address;
    public $region;
    public $province;
    public $city;
    public $email_address;
    public $mobile_number;

    public $username;
    public $password;
    public $confirm_password;

    public $valid_id;
    public $selfie_with_valid_id;

    // Wir model binding
    public $specific_service;
    public $price;
    public $duration;
    public $description;
    public $working_days = [];
    public $start_time;
    public $end_time;
    public $worker_valid_id;
    public $resume;
    public $working_days_string;

    public function sign_up()
    {
        // Validate the incoming data
        $validatedData = $this->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'birthdate' => 'required',
            'gender' => 'required',
            'marital_status' => 'required',
            'home_address' => 'required',
            'region' => 'required',
            'province' => 'required',
            'city' => 'required',
            'email_address' => ['required', 'email'],
            'mobile_number' => ['required', 'regex:/^9\d{9}$/'],

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
            'first_name.required' => 'First Name is required',
            'last_name.required' => 'Last Name is required',
            'birthdate.required' => 'Birthdate is required',
            'gender.required' => 'Gender is required',
            'marital_status.required' => 'Marital Status is required',
            'home_address.required' => 'Home Address is required',
            'region.required' => 'Region is required',
            'province.required' => 'Province is required',
            'city.required' => 'City is required',
            'email_address.required' => 'Primary E-mail is required',
            'email_address.email' => 'Primary E-mail must be a valid email address',
            'mobile_number.required' => 'Mobile Number is required',
            'mobile_number.regex' => 'Mobile Number must start with "9" and follow the format "9xxxxxxxxx"',

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

        // Insert into users table
        $user = User::create([
            'username' => $this->username,
            'password' => Hash::make($this->password),
        ]);

        // Get the ID of the just created user
        $user_id = $user->id;

        // Profile picture
        $path = "profile_pictures/Default Profile Picture.png";
        if ($this->profile_picture) {
            $path = $this->profile_picture->store('profile_pictures', 'public');
        }

        // Account Verification
        $validIdPath = NULL;
        if ($this->valid_id) {
            $validIdPath = $this->valid_id->store('valid_ids', 'public');
        }
        $selfieWithValidIdPath = NULL;
        if ($this->selfie_with_valid_id) {
            $selfieWithValidIdPath = $this->selfie_with_valid_id->store('selfie_with_valid_ids', 'public');
        }

        // Insert into user_profiles table
        $user->profile()->create([
            'user_id' => $user_id,
            'first_name' => $this->first_name,
            'middle_name' => $this->middle_name,
            'last_name' => $this->last_name,
            'suffix' => $this->suffix,
            'birthdate' => $this->birthdate,
            'gender_id' => $this->gender,
            'marital_status_id' => $this->marital_status,
            'email_address' => $this->email_address,
            'mobile_number' => $this->mobile_number,
            'profile_picture' => $path,
            'role_id' => 3,
            'valid_id' => $validIdPath,
            'selfie_with_valid_id' => $selfieWithValidIdPath,
            'submitted_at' => now(),
            'is_verified' => 0,
        ]);

        // Insert into addresses table
        $user->address()->create([
            'user_id' => $user_id,
            'region_id' => $this->region,
            'province_id' => $this->province,
            'city_id' => $this->city,
            'home_address' => $this->home_address,
        ]);

        $working_days_string = implode(',', array_map(function ($day) {
            return $day ? '1' : '0';
        }, $this->working_days));

        // Insert into worker_profiles
        $workerProfile = $user->workerprofile()->create([
            'user_id' => $user_id,
            'category_id' => $this->category,
            'service_id' => $this->service,
            'working_days' => $working_days_string,
            'start_time' => $this->start_time,
            'end_time' => $this->end_time,
            'status' => 1,
        ]);

        // Insert into specific_services table
        $workerProfile->specificService()->create([
            'worker_id' => $workerProfile->id,
            'specific_service' => $this->specific_service,
            'description' => $this->description,
            'price' => $this->price,
            'duration' => $this->duration,
        ]);


        return redirect('/');
    }

}
