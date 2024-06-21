<nav class="bg-blue-800 p-4">
    <div class="container mx-auto flex justify-center items-center">
        <div class="text-white text-xl font-bold">
            <a
                href="/"
                class="flex items-center bg-white text-blue-800 text-xl font-bold py-1 px-4 focus:outline-none"
                >
                <img class="h-8 mr-2" src="{{ asset('storage/' . $settings->app_logo) }}" alt="{{ $settings->app_name }} logo">
                {{ $settings->app_name }}
            </a>
        </div>
        {{-- <div>
            <a href="#" class="text-white hover:text-blue-300">Login</a>
            <a href="{{ route('sign_up') }}" class="text-white hover:text-blue-300">Sign Up</a>
        </div> --}}
    </div>
</nav>
