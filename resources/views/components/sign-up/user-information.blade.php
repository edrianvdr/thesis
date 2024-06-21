<h2 class="text-black text-3xl font-semibold font-['Open Sans']">Personal Information</h2>

<div class="grid grid-cols-1 gap-4 my-4">
    <div>
        <label for="profile_picture">Profile Picture</label>
        <input type="file" accept="image/*" name="profile_picture" id="profile_picture" aria-label="Profile Picture" class="rounded w-full py-2 px-2" wire:model="profile_picture">
    </div>
</div>

<div class="grid grid-cols-3 gap-4 my-4">
    @include('components.sign-up.input', [
        'type' => 'text',
        'name' => 'first_name',
        'label' => 'First Name',
        'required' => true
    ])
    @include('components.sign-up.input', [
        'type' => 'text',
        'name' => 'middle_name',
        'label' => 'Middle Name',
        'required' => false
    ])
    @include('components.sign-up.input', [
        'type' => 'text',
        'name' => 'last_name',
        'label' => 'Last Name',
        'required' => true
    ])
</div>

<div class="grid grid-cols-3 gap-4 my-4">
    <x-sign-up.select
        name="suffix"
        label="Suffix"
        required=""
        wireChange=""
    >
        <option value="">Select Suffix</option>
        <option value="Jr.">Jr.</option>
        <option value="Sr.">Sr.</option>
        <option value="II">II</option>
        <option value="III">III</option>
        <option value="IV">IV</option>
        <option value="V">V</option>
        <option value="">Not Applicable</option>
    </x-sign-up.select>

    @include('components.sign-up.input', [
        'type' => 'date',
        'name' => 'birthdate',
        'label' => 'Birthdate',
        'required' => true
    ])
    <x-sign-up.select
        name="gender"
        label="Gender"
        required="true"
        wireChange=""
    >
        <option value="">Select Gender</option>
        @foreach($genders as $gender)
            <option value="{{ $gender->id }}">{{ $gender->gender }}</option>
        @endforeach
    </x-sign-up.select>
</div>

<div class="grid grid-cols-3 gap-4 my-4">
    <x-sign-up.select
        name="marital_status"
        label="Marital Status"
        required="true"
        wireChange=""
    >
        <option value="">Select Marital Status</option>
        @foreach($marital_statuses as $marital_status)
            <option value="{{ $marital_status->id }}">{{ $marital_status->marital_status }}</option>
        @endforeach
    </x-sign-up.select>
</div>

<h2 class="text-black text-3xl font-semibold font-['Open Sans']">Contact Information</h2>
<div class="grid grid-cols-1 gap-4 my-4">
    @include('components.sign-up.input', [
        'type' => 'text',
        'name' => 'home_address',
        'label' => 'Home Address (House No. / Street / Barangay)',
        'required' => true
    ])
</div>

<div class="grid grid-cols-3 gap-4 my-4">
    <x-sign-up.select
        name="region"
        label="Region"
        required="true"
        wireChange="loadProvinces"
    >
        <option value="" selected>Select Region</option>
        @foreach($regions as $region)
            <option value="{{ $region->id }}">{{ $region->region }}</option>
        @endforeach
    </x-sign-up.select>
    <x-sign-up.select
        name="province"
        label="Province"
        required="true"
        wireChange="loadCities"
    >
        <option value="" selected>Select Province</option>
        @foreach($provinces as $province)
            <option value="{{ $province->id }}">{{ $province->province }}</option>
        @endforeach
    </x-sign-up.select>
    <x-sign-up.select
        name="city"
        label="City"
        required="true"
        wireChange=""
    >
        <option value="" selected>Select City</option>
        @foreach($cities as $city)
            <option value="{{ $city->id }}">{{ $city->city }}</option>
        @endforeach
    </x-sign-up.select>
</div>

<div class="grid grid-cols-2 gap-4 my-4">
    @include('components.sign-up.input', [
        'type' => 'email',
        'name' => 'email_address',
        'label' => 'Email Address',
        'required' => true
    ])
    @include('components.sign-up.input', [
        'type' => 'number',
        'name' => 'mobile_number',
        'label' => 'Mobile Number',
        'required' => true
    ])
</div>

<h2 class="text-black text-3xl font-semibold font-['Open Sans']">Login Information</h2>
<div class="grid grid-cols-1 gap-4 my-4">
    @include('components.sign-up.input', [
        'type' => 'text',
        'name' => 'username',
        'label' => 'Username',
        'required' => true
    ])
    @include('components.sign-up.input', [
        'type' => 'password',
        'name' => 'password',
        'label' => 'Password',
        'required' => true
    ])
    @include('components.sign-up.input', [
        'type' => 'password',
        'name' => 'confirm_password',
        'label' => 'Confirm Password',
        'required' => true
    ])
</div>

<h2 class="text-black text-3xl font-semibold font-['Open Sans']">Account Verification</h2>
<div class="my-2">
    <label for="valid_id" class="block text-sm font-medium text-gray-700">Upload a valid government ID</label>
    <input type="file" accept="image/*" name="valid_id" id="valid_id" aria-label="Valid ID" wire:model="valid_id" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
</div>
<div class="my-2">
    <label for="selfie_with_valid_id" class="block text-sm font-medium text-gray-700">Upload a selfie holding your government ID</label>
    <input type="file" accept="image/*" name="selfie_with_valid_id" id="selfie_with_valid_id" aria-label="Selfie with Valid ID" wire:model="selfie_with_valid_id" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
</div>
