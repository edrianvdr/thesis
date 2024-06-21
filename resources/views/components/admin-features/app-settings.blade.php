<div class="overflow-x-auto mt-4">
    <h1 class="text-2xl font-bold mb-4 text-center">App Settings</h1>

    @if (session('success'))
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4 mx-auto max-w-4xl" role="alert">
            <strong class="font-bold">{{ session('success') }}</strong>
        </div>
    @endif

    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 max-w-4xl mx-auto">
        <div class="bg-white overflow-hidden shadow rounded-lg p-4">
            <h2 class="text-lg text-white bg-blue-800 py-2 leading-6 font-medium text-gray-900 mb-4 text-center">Update App Name</h2>
            <form action="{{ route('updateName') }}" method="POST" class="mb-6">
                @csrf
                <div class="mb-4">
                    <label for="app_name" class="sr-only block text-sm font-medium text-gray-700">Update App Name</label>
                    <input type="text" name="app_name" id="app_name" value="{{ old('app_name', $settings->app_name) }}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md text-sm">
                </div>
                <div class="text-center">
                    <x-button-primary value="Update App Name" />
                </div>
            </form>
        </div>

        <div class="bg-white overflow-hidden shadow rounded-lg p-4">
            <h2 class="text-xl text-white bg-blue-800 py-2 px-4 font-semibold mb-4 text-center">Update Logo</h2>
            <form action="{{ route('updateLogo') }}" method="POST" enctype="multipart/form-data" class="mb-6">
                @csrf
                <div class="mb-4">
                    <label for="app_logo" class="block text-sm font-medium text-gray-700">App Logo</label>
                    <input type="file" name="app_logo" id="app_logo" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
                    @if ($settings->app_logo)
                        <div class="mt-2">
                            <img src="{{ asset('storage/' . $settings->app_logo) }}" alt="App Logo" class="h-48 mx-auto">
                        </div>
                    @endif
                </div>
                <div class="text-center">
                    <x-button-primary value="Update App Logo" />
                </div>
            </form>
        </div>
    </div>
</div>
