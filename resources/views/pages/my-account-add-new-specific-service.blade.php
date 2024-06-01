<h2 class="text-2xl font-bold mb-4">Add New Specific Service</h2>

@if (session('success'))
    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
        <strong class="font-bold">{{ session('success') }}</strong>
    </div>
@endif

<!-- Table displaying the logged-in user's specific services -->
<div class="bg-white p-6 shadow-md rounded-lg mb-6">
    <h3 class="text-xl font-bold mb-4">Your Specific Services</h3>
    @if($specificServices->isEmpty())
        <p>No specific services found.</p>
    @else
        <table class="min-w-full leading-normal">
            <thead>
                <tr>
                    <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Service
                    </th>
                    <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Description
                    </th>
                    <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Price
                    </th>
                    <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Duration (minutes)
                    </th>
                </tr>
            </thead>
            <tbody>
                @foreach($specificServices as $specificService)
                    <tr>
                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                            {{ $specificService->specific_service }}
                        </td>
                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                            {{ $specificService->description }}
                        </td>
                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                            ₱{{ $specificService->price }}
                        </td>
                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                            {{ $specificService->duration }}
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endif
</div>

<div class="bg-white p-6 shadow-md rounded-lg">
    <form
        action="{{ route('add.new_specific_service') }}"
        method="POST"
        class="space-y-4"
        enctype="multipart/form-data"
        onsubmit="return confirm('Are you sure you want to add this specific service?');"
    >
        @csrf

        <input type="hidden" name="worker_id" value="{{ Auth::user()->workerProfile->id }}">

        <div class="flex flex-col space-y-4">
            <div>
                <label for="specific_service" class="block text-sm font-medium text-gray-700">Specific Service</label>
                <input type="text" name="specific_service" id="specific_service" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm" required>
            </div>

            <div>
                <label for="description" class="block text-sm font-medium text-gray-700">Description</label>
                <textarea name="description" id="description" rows="3" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"></textarea>
            </div>

            <div>
                <label for="price" class="block text-sm font-medium text-gray-700">Price</label>
                <input type="number" name="price" id="price" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm" step="0.01" min="0" required>
            </div>

            <div>
                <label for="duration" class="block text-sm font-medium text-gray-700">Duration (in minutes)</label>
                <input type="number" name="duration" id="duration" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm" min="0" required>
            </div>
        </div>

        <button
            type="submit"
            class="bg-blue-800 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mt-4"
        >
            Add Specific Service
        </button>
    </form>
</div>
