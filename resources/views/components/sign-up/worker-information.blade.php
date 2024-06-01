<h2 class="text-black text-3xl font-semibold font-['Open Sans']">Worker Information</h2>

<div class="grid grid-cols-2 gap-4 my-4">
    <x-sign-up.select
        name="category"
        label="Category"
        required="true"
        wireChange="loadServices"
    >
        <option value="" selected>Select Category</option>
        @foreach($categories as $category)
            <option value="{{ $category->id }}">{{ $category->category }}</option>
        @endforeach
    </x-sign-up.select>
    <x-sign-up.select
        name="service"
        label="Service"
        required="true"
        wireChange=""
    >
        <option value="" selected>Select Service</option>
        @foreach($services as $service)
            <option value="{{ $service->id }}">{{ $service->service }}</option>
        @endforeach
    </x-sign-up.select>
</div>

<div class="grid grid-cols-3 gap-4 my-4">
    @include('components.sign-up.input', [
        'type' => 'text',
        'name' => 'specific_service',
        'label' => 'Specific Service Name',
        'required' => true
    ])
    @include('components.sign-up.input', [
        'type' => 'number',
        'name' => 'price',
        'label' => 'Labor Rate',
        'required' => true
    ])
    @include('components.sign-up.input', [
        'type' => 'number',
        'name' => 'duration',
        'label' => 'Duration',
        'required' => true
    ])
</div>

<div class="grid grid-cols-1 gap-4 my-4">
    <div>
        <label for="description">Description</label>
        <textarea rows=5 name="description" id="description" aria-label="Description" aria-required="true" required class="rounded w-full py-2 px-3" wire:model="description"></textarea>
    </div>
</div>

<div class="grid grid-cols-1 gap-4 my-4">
    <div>
        <label for="working_days">Working Days</label>
        <div class="flex flex-wrap gap-4">
            <div>
                <input type="checkbox" id="sunday" name="sunday" value="sunday" wire:model="working_days.sunday">
                <label for="sunday">Sunday</label>
            </div>
            <div>
                <input type="checkbox" id="monday" name="monday" value="monday" wire:model="working_days.monday">
                <label for="monday">Monday</label>
            </div>
            <div>
                <input type="checkbox" id="tuesday" name="tuesday" value="tuesday" wire:model="working_days.tuesday">
                <label for="tuesday">Tuesday</label>
            </div>
            <div>
                <input type="checkbox" id="wednesday" name="wednesday" value="wednesday" wire:model="working_days.wednesday">
                <label for="wednesday">Wednesday</label>
            </div>
            <div>
                <input type="checkbox" id="thursday" name="thursday" value="thursday" wire:model="working_days.thursday">
                <label for="thursday">Thursday</label>
            </div>
            <div>
                <input type="checkbox" id="friday" name="friday" value="friday" wire:model="working_days.friday">
                <label for="friday">Friday</label>
            </div>
            <div>
                <input type="checkbox" id="saturday" name="saturday" value="saturday" wire:model="working_days.saturday">
                <label for="saturday">Saturday</label>
            </div>
        </div>
    </div>
</div>

<div class="grid grid-cols-2 gap-4 my-4">
    @include('components.sign-up.input', [
        'type' => 'time',
        'name' => 'start_time',
        'label' => 'Start Time',
        'required' => true
    ])
    @include('components.sign-up.input', [
        'type' => 'time',
        'name' => 'end_time',
        'label' => 'End Time',
        'required' => true
    ])
</div>

<div class="grid grid-cols-1 gap-4 my-4">
    <div>
        <label for="valid_id">Upload a Picture of Valid ID</label>
        <input type="file" accept="image/*" name="valid_id" id="valid_id" aria-label="Upload Valid ID" class="rounded w-full py-2 px-3" wire:model="valid_id">
    </div>
</div>

<div class="grid grid-cols-1 gap-4 my-4">
    <div>
        <label for="resume">Upload Resume</label>
        <input type="file" accept=".pdf,.doc,.docx" name="resume" id="resume" aria-label="Upload Resume" class="rounded w-full py-2 px-3" wire:model="resume">
    </div>
</div>
