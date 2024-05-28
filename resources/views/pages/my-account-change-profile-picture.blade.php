<h2 class="text-2xl font-bold mb-4">Change Profile Picture</h2>

<form
    action="{{ route('update.profile') }}"
    method="POST"
    enctype="multipart/form-data"
    onsubmit="return confirm('Are you sure you want to update your account details?');"
>
    @csrf

    <div class="flex items-center mb-4">
        @if (Auth::user()->userProfile->profile_picture)
            <img src="{{ asset('storage/' . Auth::user()->userProfile->profile_picture) }}" alt="Profile Picture" class="rounded-full h-20 w-20 mr-4">
        @else
            <div class="rounded-full h-20 w-20 bg-gray-200 flex items-center justify-center text-gray-400">
                <svg class="h-10 w-10" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                </svg>
            </div>
        @endif
    </div>

    <div>
        <label for="profile_picture" class="block text-sm font-medium text-gray-700">Profile Picture</label>
        <input type="file" accept="image/*" name="profile_picture" id="profile_picture" aria-label="Profile Picture" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
    </div>

    <button
        class="bg-blue-800 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mt-4"
        type="submit"
    >
        Save
    </button>
</form>
