<h2 class="text-2xl font-bold mb-4">Account Verification</h2>
<p class="mb-2">
    Verify your account to be able to book services.
</p>

@if ($profile->is_verified == 2)
    <p class="mb-2 bg-red-200 py-4 pl-2">
        Previous account verification submission has been rejected.
    </p>
@endif

@if ($profile->is_verified == 1)
    <div class="mb-4">
        <p class="font-medium">Your account is now verified!</p>
        <div class="mb-2">
            <p>Valid ID:</p>
            <img src="{{ asset('storage/' . $profile->valid_id) }}" alt="Valid ID" class="w-full h-auto object-contain max-w-xs">
        </div>
        <div class="mb-2">
            <p>Selfie with Valid ID:</p>
            <img src="{{ asset('storage/' . $profile->selfie_with_valid_id) }}" alt="Selfie with Valid ID" class="w-full h-auto object-contain max-w-xs">
        </div>
        <div>
            <p>Submitted At: {{ $profile->submitted_at->format('M d, Y h:i A') }}</p>
            <p>Verified At: {{ $profile->verified_at->format('M d, Y h:i A') }}</p>
        </div>
    </div>

@elseif ($profile->is_verified != 1)
    <div class="mb-4">
        <p class="font-medium">Current Verification Documents:</p>
        @if($profile->valid_id)
            <div class="mb-2">
                <p>Valid ID:</p>
                <img src="{{ asset('storage/' . $profile->valid_id) }}" alt="Valid ID" class="w-full h-auto object-contain max-w-xs">
            </div>
        @endif
        @if($profile->selfie_with_valid_id)
            <div class="mb-2">
                <p>Selfie with Valid ID:</p>
                <img src="{{ asset('storage/' . $profile->selfie_with_valid_id) }}" alt="Selfie with Valid ID" class="w-full h-auto object-contain max-w-xs">
            </div>
        @endif
        @if($profile->submitted_at)
            <div>
                <p>Submitted At: {{ $profile->submitted_at->format('M d, Y h:i A') }}</p>
            </div>
        @endif
    </div>

    <form
        action="{{ route('upload.account_verification') }}"
        method="POST"
        enctype="multipart/form-data"
        onsubmit="return confirm('Are you sure you want to update your account details?');"
        >
        @csrf

        <!-- Government ID Upload -->
        <div class="mb-4">
            <label for="valid_id" class="block text-sm font-medium text-gray-700">Upload a valid government ID</label>
            <input type="file" accept="image/*" name="valid_id" id="valid_id" aria-label="Valid ID" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
        </div>

        <!-- Selfie Holding Government ID Upload -->
        <div class="mb-4">
            <label for="selfie_with_valid_id" class="block text-sm font-medium text-gray-700">Upload a selfie holding your government ID</label>
            <input type="file" accept="image/*" name="selfie_with_valid_id" id="selfie_with_valid_id" aria-label="Selfie with Valid ID" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
        </div>

        <button
            class="bg-blue-800 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mt-4"
            type="submit"
        >
            Submit
        </button>
        </form>

@endif
