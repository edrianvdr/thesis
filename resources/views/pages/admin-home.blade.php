@extends('layout')

@section('content')

@include('partials.home-navbar')

<div class="container mx-auto px-4 py-8">
    <h2 class="text-2xl font-bold mb-4">Worker Management</h2>

    @if (session('success'))
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mt-4" role="alert">
            <strong class="font-bold">{{ session('success') }}</strong>
        </div>
    @endif

    <div class="flex justify-center mb-4">
        <div class="flex-1 max-w-xs bg-white overflow-hidden shadow rounded-lg mx-2">
            <div class="px-4 py-5 sm:px-6 text-center">
                <h3 class="text-lg leading-6 font-medium text-gray-900">TOTAL</h3>
            </div>
            <div class="text-center">
                <p class="text-4xl font-extrabold text-gray-900">{{ $workers->count() }}</p>
            </div>
        </div>
        <div class="flex-1 max-w-xs bg-green-100 overflow-hidden shadow rounded-lg mx-2">
            <div class="px-4 py-5 sm:px-6 text-center">
                <h3 class="text-lg leading-6 font-medium text-green-800">ACTIVE</h3>
            </div>
            <div class="text-center">
                <p class="text-4xl font-extrabold text-green-800">{{ $workers->where('status', 1)->count() }}</p>
            </div>
        </div>
        <div class="flex-1 max-w-xs bg-red-100 overflow-hidden shadow rounded-lg mx-2">
            <div class="px-4 py-5 sm:px-6 text-center">
                <h3 class="text-lg leading-6 font-medium text-red-800">DEACTIVATED</h3>
            </div>
            <div class="text-center">
                <p class="text-4xl font-extrabold text-red-800">{{ $workers->where('status', 0)->count() }}</p>
            </div>
        </div>
        <div class="flex-1 max-w-xs bg-blue-100 overflow-hidden shadow rounded-lg mx-2">
            <div class="px-4 py-5 sm:px-6 text-center">
                <h3 class="text-lg leading-6 font-medium text-blue-800">ELIGIBLE</h3>
            </div>
            <div class="text-center">
                <p class="text-4xl font-extrabold text-blue-800">{{ $eligibleWorkers->count() }}</p>
            </div>
        </div>

    </div>

    <div class="flex justify-center mb-4">
        <table class="table-auto border-collapse border border-gray-300">
            <thead>
                <tr class="bg-gray-200">
                    <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Name</th>
                    <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Category</th>
                    <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Service</th>
                    <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Pricing</th>
                    <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Completed Bookings</th>
                    <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Commission</th>
                    <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Status</th>
                    <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($workers as $worker)
                    <tr class="{{ $loop->even ? 'bg-white' : 'bg-gray-100' }}">
                        <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-300">
                            {{ $worker->user->userProfile->first_name }} {{ $worker->user->userProfile->last_name }}
                        </td>
                        <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-300">
                            {{ $worker->category->category }}
                        </td>
                        <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-300">
                            {{ $worker->service->service }}
                        </td>
                        <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-300">
                            ₱{{ $worker->pricing }}
                        </td>
                        <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-300">
                            {{ $worker->completed_bookings }}
                        </td>
                        <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-300">
                            ₱{{ round($worker->pricing * $worker->completed_bookings * 0.1, 2) }}
                        </td>
                        <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-300">
                            @if ($worker->status == 1)
                                <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                                    Active
                                </span>
                            @else
                                <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-100 text-red-800">
                                    Deactivated
                                </span>
                            @endif
                        </td>
                        <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-300">
                            @if ($worker->status == 1)
                                <form action="{{ route('admin.deactivateWorker', ['id' => $worker->id]) }}" method="POST">
                                    @csrf
                                    <button type="submit" class="text-white bg-red-500 hover:bg-red-600 py-1 px-3 rounded-md focus:outline-none focus:shadow-outline">
                                        Deactivate
                                    </button>
                                </form>
                            @elseif ($worker->status == 0)
                                <form action="{{ route('admin.reactivateWorker', ['id' => $worker->id]) }}" method="POST">
                                    @csrf
                                    <button type="submit" class="text-white bg-green-500 hover:bg-green-600 py-1 px-3 rounded-md focus:outline-none focus:shadow-outline">
                                        Reactivate
                                    </button>
                                </form>
                            @endif
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

<div class="flex justify-center mt-4">
    <form action="{{ route('admin.requestCommissionPaymentAll') }}" method="POST">
        @csrf
        <button type="submit" class="text-white bg-blue-500 hover:bg-blue-600 py-2 px-4 rounded-md focus:outline-none focus:shadow-outline">
            Request Commission Payment for All Eligible Workers
        </button>
    </form>
</div>


@include('partials.footer')

@endsection
