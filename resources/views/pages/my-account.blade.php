@extends('layout')

@section('content')

@include('partials.home-navbar')

<main class="max-w-6xl mx-auto px-4 my-4">
    <h1 class="text-3xl font-bold mb-4">My Account</h1>

    @if (session('success'))
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
            <strong class="font-bold">{{ session('success') }}</strong>
        </div>
    @endif

    <div class="flex space-x-8">
        <aside class="w-1/4 bg-white p-4 shadow-md rounded-lg">
            <ul class="space-y-2">
                <li>
                    <a href="{{ route('my.account', ['feature' => 1]) }}" class="block px-4 py-2 text-gray-700 hover:bg-gray-200 rounded">
                        Change Profile Picture
                    </a>
                </li>
                <li>
                    <a href="{{ route('my.account', ['feature' => 2]) }}" class="block px-4 py-2 text-gray-700 hover:bg-gray-200 rounded">
                        Change Password
                    </a>
                </li>
                <li>
                    <a href="{{ route('my.account', ['feature' => 3]) }}" class="block px-4 py-2 text-gray-700 hover:bg-gray-200 rounded">
                        Pay Commission
                    </a>
                </li>
                <li>
                    <a href="{{ route('my.account', ['feature' => 4]) }}" class="block px-4 py-2 text-gray-700 hover:bg-gray-200 rounded">
                        Add New Specific Service
                    </a>
                </li>

                <li>
                    <a href="{{ route('logout') }}" class="block px-4 py-2 text-gray-700 hover:bg-gray-200 rounded">
                        Logout
                    </a>
                </li>
            </ul>
        </aside>

        <section class="w-3/4 bg-white p-6 shadow-md rounded-lg">
            @if ($feature == 1)
                @include('pages.my-account-change-profile-picture')
            @elseif ($feature == 2)
                @include('pages.my-account-change-password')
            @elseif ($feature == 3)
                @include('pages.my-account-pay-commission')
            @elseif ($feature == 4)
                @include('pages.my-account-add-new-specific-service')
            @endif
        </section>
    </div>
</main>

@include('partials.footer')

@endsection
