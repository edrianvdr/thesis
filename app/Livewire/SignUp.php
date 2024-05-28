<?php

namespace App\Livewire;

use Livewire\Component;

use App\Models\Gender;
use App\Models\MaritalStatus;
use App\Models\Region;
use App\Models\Province;
use App\Models\City;

use App\Models\User;
use App\Models\UserProfile;

use Illuminate\Support\Facades\Hash;
use Livewire\WithFileUploads;

class SignUp extends Component
{
    use WithFileUploads;

    public function render()
    {
        return view('livewire.sign-up');
    }

    public $genders;
    public $marital_statuses;
    public $regions;
    public $provinces;
    public $cities;

    public function mount()
    {
        $this->genders = Gender::all();
        $this->marital_statuses = MaritalStatus::all();
        $this->regions = Region::all();
        $this->provinces = collect();
        $this->cities = collect();
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
            'role_id' => 2,
        ]);

        // Insert into addresses table
        $user->address()->create([
            'user_id' => $user_id,
            'region_id' => $this->region,
            'province_id' => $this->province,
            'city_id' => $this->city,
            'home_address' => $this->home_address,
        ]);

        return redirect('/');
    }
}
