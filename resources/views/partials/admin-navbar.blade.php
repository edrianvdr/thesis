<nav class="bg-blue-800 text-white w-64 min-h-screen flex-shrink-0">
    <div class="p-4">
        <a href="{{ route('admin.home', ['feature' => 1]) }}"
            class="flex items-center bg-white text-blue-800 text-xl font-bold mb-4 py-2 hover:bg-gray-300 transition duration-200 focus:bg-blue-700 focus:outline-none" accesskey="h">
            <img class="h-8 mr-2" src="{{ asset('storage/' . $settings->app_logo) }}" alt="{{ $settings->app_name }} logo">
            {{ $settings->app_name }}
        </a>
        <ul class="space-y-4">
                <a href="{{ route('admin.home', ['feature' => 1]) }}"
                    class="block py-2 px-4 text-white hover:bg-blue-700 rounded transition duration-200 focus:bg-blue-700 focus:outline-none">
                    {{-- {{ Auth::user()->userProfile->first_name }} {{ Auth::user()->userProfile->last_name }} --}}
                    Home
                </a>
            </li>
            <li>
                <a href="{{ route('admin.home', ['feature' => 2]) }}"
                    class="block py-2 px-4 text-white hover:bg-blue-700 rounded transition duration-200 focus:bg-blue-700 focus:outline-none">
                    Account Verification
                </a>
            </li>
            <li>
                <a href="{{ route('admin.home', ['feature' => 3]) }}"
                    class="block py-2 px-4 text-white hover:bg-blue-700 rounded transition duration-200 focus:bg-blue-700 focus:outline-none">
                    Commission Management
                </a>
            </li>
            <li>
                <a href="{{ route('admin.home', ['feature' => 4]) }}"
                    class="block py-2 px-4 text-white hover:bg-blue-700 rounded transition duration-200 focus:bg-blue-700 focus:outline-none">
                    Worker Management
                </a>
            </li>
            <li>
                <a href="{{ route('admin.home', ['feature' => 5]) }}"
                    class="block py-2 px-4 text-white hover:bg-blue-700 rounded transition duration-200 focus:bg-blue-700 focus:outline-none">
                    Income Monitoring
                </a>
            </li>
            <li>
                <a href="{{ route('admin.home', ['feature' => 6]) }}"
                    class="block py-2 px-4 text-white hover:bg-blue-700 rounded transition duration-200 focus:bg-blue-700 focus:outline-none">
                    App Settings
                </a>
            </li>
            <li>
                <a href="{{ route('logout') }}"
                    class="block py-2 px-4 text-white hover:bg-blue-700 rounded transition duration-200 focus:bg-blue-700 focus:outline-none"
                    accesskey="l"
                    >
                    Logout
                </a>
            </li>
        </ul>
    </div>
</nav>
