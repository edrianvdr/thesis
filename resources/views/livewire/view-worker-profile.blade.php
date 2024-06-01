<div class="max-w-4xl mx-auto mt-8 px-4">
    <h1 class="text-3xl font-bold mb-4">{{ $userProfile->first_name }} {{ $userProfile->last_name }}'s Profile</h1>

    <div class="bg-white shadow-md rounded-md p-6 mt-4 grid grid-cols-1 md:grid-cols-2 gap-4">
        <div class="col-span-1">
            <img
                class="w-full h-80 object-cover object-center rounded-md"
                src="{{ asset('storage/' . $userProfile->profile_picture) }}"
                alt="{{ $userProfile->first_name }} {{ $userProfile->last_name }}'s Profile Picture"
            >
        </div>
        <div class="col-span-1">
            <div>
                <p class="text-gray-700 text-lg mb-2">
                    <span class="font-semibold">Category:</span> {{ $workerProfile->category->category }}
                </p>
                <p class="text-gray-700 text-lg mb-2">
                    <span class="font-semibold">Service:</span> {{ $workerProfile->service->service }}
                </p>
                <p class="text-gray-700 text-lg mb-2">
                    <span class="font-semibold">Working Day/s:</span>
                    @if(!empty($availableDays))
                        {{ implode(', ', $availableDays) }}
                    @else
                        Not available on any day.
                    @endif
                </p>
                <p class="text-gray-700 text-lg mb-2">
                    <span class="font-semibold">Time Availability:</span>
                    {{ DateTime::createFromFormat('H:i:s', $workerProfile->start_time)->format('g:i A') }}
                    to
                    {{ DateTime::createFromFormat('H:i:s', $workerProfile->end_time)->format('g:i A') }}
                </p>
            </div>

            <div class="mt-4">
                <h2 class="text-xl font-bold mb-2">Specific Services</h2>
                <ul>
                    @foreach($specificServices as $specificService)
                        <label
                            role="radio"
                            tabindex="0"
                            class="inline-flex items-center cursor-pointer rounded-md border-2 p-3 mb-2 focus:outline-none
                                @if ($selected_specific_service_id == $specificService->id)
                                    bg-blue-100 border-blue-800
                                @else
                                    bg-white border-gray-300 hover:border-gray-500 focus:border-gray-500
                                @endif"
                            wire:click="selectSpecificService({{ $specificService->id }})"
                        >
                            <input
                                type="radio"
                                name="specific_service"
                                class="hidden"
                                value="{{ $specificService->id }}"
                                @if ($selected_specific_service_id == $specificService->id) checked @endif
                            >
                            <span class="ml-2">{{ $specificService->specific_service }}</span>
                        </label>
                    @endforeach


                </ul>
            </div>

            <div class="mt-4">
                <div wire:loading.remove wire:target="selectSpecificService">
                    @if ($selectedSpecificService)
                        <p class="text-gray-700 mb-2"><span class="font-semibold">Description:</span> {{ $selectedSpecificService->description }}</p>
                        <p class="text-gray-700 mb-2">{{ $selectedSpecificService->duration }} minutes</p>
                        <p class="text-2xl font-bold text-blue-900">₱{{ $selectedSpecificService->price }}</p>
                    @endif
                </div>
                <div wire:loading wire:target="selectSpecificService" class="text-gray-700 animate-pulse">
                    Loading...
                </div>
            </div>
        </div>
    </div>

    <div class="bg-white shadow-md rounded-md p-6 mt-8">
        <h2 class="text-2xl font-bold mb-4">Book a Service</h2>

        @if (session('success'))
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                <strong class="font-bold">{{ session('success') }}</strong>
            </div>
        @endif

        <form action="/book" method="POST">
            @csrf
            {{-- Hidden fields to pass on controller --}}
            <input type="hidden" name="user_id" value="{{ Auth::id() }}">
            <input type="hidden" name="worker_id" value="{{ $workerProfile->id }}">
            <input type="hidden" name="specific_service_id" value="{{ $selected_specific_service_id }}">

            <div class="mb-4">
                <label for="booking_date" class="block text-sm font-medium text-gray-700">Booking Date</label>
                <input type="date" name="booking_date" id="booking_date" aria-label="Booking Date" aria-required="true" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
            </div>
            <div class="mb-4">
                <label for="booking_time" class="block text-sm font-medium text-gray-700">Booking Time</label>
                <input type="time" name="booking_time" id="booking_time" aria-label="Booking Time" aria-required="true" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
            </div>
            <div class="mb-4">
                <label for="booking_notes" class="block text-sm font-medium text-gray-700">Notes</label>
                <textarea rows="5" name="booking_notes" id="booking_notes" aria-label="Notes" aria-required="true" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"></textarea>
            </div>

            <button type="submit" class="w-full bg-blue-600 text-white py-2 px-4 rounded-md shadow-sm hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                Book a Service
            </button>
        </form>
    </div>
</div>
