<nav class="bg-blue-800 p-4">
    <div class="container mx-auto flex justify-between items-center">
        <div class="text-white text-xl font-bold">
            <a
                href="{{ route('home') }}"
                {{-- class="flex items-center text-white text-xl font-bold px-2 border border-blue-800 focus:border-white focus:outline-none" --}}
                class="flex items-center bg-white text-blue-800 text-xl font-bold py-1 px-4 focus:outline-none"
                accesskey="h"
                >
                <img class="h-8 mr-2" src="{{ asset('storage/' . $settings->app_logo) }}" alt="{{ $settings->app_name }} logo">
                {{ $settings->app_name }}
            </a>
        </div>
        <div>
            <ul class="flex flex-col p-4 md:p-0 mt-4 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-blue-800">
                <li>
                    <a
                        href="{{ route('home') }}"
                        class="block py-2 px-3 text-white bg-blue-800 rounded hover:bg-white hover:text-blue-800 focus:bg-white focus:text-blue-800 focus:outline-none"
                        accesskey="h"
                        >
                        Home
                    </a>
                </li>
                <li>
                    <a
                        href="{{ route('my_bookings', [
                            'sort' => 'booking_id',
                            'my_bookings_as_role' => 'as Client'
                        ]) }}"
                        class="block py-2 px-3 text-white bg-blue-800 rounded hover:bg-white hover:text-blue-800 focus:bg-white focus:text-blue-800 focus:outline-none"
                        accesskey="b"
                        >
                        My Bookings
                    </a>
                </li>
                @if(Auth::user()->userProfile->role_id == 2)
                    <li>
                        <a href="{{ route('sign_up_worker') }}" class="inline-flex items-center py-2 px-3 text-white bg-blue-800 rounded hover:bg-white hover:text-blue-800 focus:bg-white focus:text-blue-800 focus:outline-none">Become a Worker</a>
                    </li>
                @endif
                <li class="flex items-center">
                    <a
                        href="{{ route('my.account', ['feature' => 1]) }}"
                        class="inline-flex items-center py-2 px-3 text-white bg-blue-800 rounded hover:bg-white hover:text-blue-800 focus:bg-white focus:text-blue-800 focus:outline-none"
                        accesskey="a"
                        >
                        <img class="h-8 w-8 rounded-full mr-2" src="{{ asset('storage/' . (Auth::user()->userProfile->profile_picture ?? 'profile_pictures/Default Profile Picture.png')) }}" alt="Profile Picture">
                        {{ Auth::user()->userProfile->first_name }} {{ Auth::user()->userProfile->last_name }}
                    </a>
                </li>
              </ul>
        </div>
    </div>
</nav>
