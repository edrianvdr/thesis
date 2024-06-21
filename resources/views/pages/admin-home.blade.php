@extends('layout')

@section('content')
<div class="flex">
    @include('partials.admin-navbar')

    <main class="bg-white flex-1 p-4">
        @if ($feature == 1)
            <div class="container mx-auto">
                <h1 class="text-2xl font-bold mb-4">Dashboard</h1>

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                    <div class="bg-white p-6 rounded-lg shadow-md">
                        <h2 class="text-lg font-semibold mb-4">Overview</h2>
                        <p class="text-gray-700">
                            Welcome to the admin dashboard.
                        </p>
                    </div>
                    <div class="bg-white p-6 rounded-lg shadow-md">
                        <h2 class="text-lg font-semibold mb-4">Account Verification</h2>
                        <p class="text-gray-700">
                            Verify the accounts of the users from their uploaded ID and selfie.
                        </p>
                    </div>
                    <div class="bg-white p-6 rounded-lg shadow-md">
                        <h2 class="text-lg font-semibold mb-4">Commission Management</h2>
                        <p class="text-gray-700">
                            Manage the progress of the workers' commission payments here.
                        </p>
                    </div>
                    <div class="bg-white p-6 rounded-lg shadow-md">
                        <h2 class="text-lg font-semibold mb-4">Worker Management</h2>
                        <p class="text-gray-700">
                            Reactivate and deactivate workers here.
                        </p>
                    </div>
                    <div class="bg-white p-6 rounded-lg shadow-md">
                        <h2 class="text-lg font-semibold mb-4">Income Monitoring</h2>
                        <p class="text-gray-700">
                            Monitor the total and monthly income within the system.
                        </p>
                    </div>
                    <div class="bg-white p-6 rounded-lg shadow-md">
                        <h2 class="text-lg font-semibold mb-4">App Settings</h2>
                        <p class="text-gray-700">
                            Update the app's name and logo.
                        </p>
                    </div>
                </div>
            </div>
        @elseif ($feature == 2)
            @include('components.admin-features.account-verification')
        @elseif ($feature == 3)
            @include('components.admin-features.commission-management')
        @elseif ($feature == 4)
            @include('components.admin-features.worker-management')
        @elseif ($feature == 5)
            @include('components.admin-features.income-monitoring')
        @elseif ($feature == 6)
            @include('components.admin-features.app-settings')
        @endif




    </main>
</div>

@include('partials.footer')
@endsection
