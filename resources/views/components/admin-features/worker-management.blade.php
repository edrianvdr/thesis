<div class="overflow-x-auto">
    <h1 class="text-2xl font-bold mb-4">Worker Management</h1>
    <h1>{{ $eligibleWorkersCount }}</h1>

    <table class="table-auto border-collapse border border-gray-300">
        <thead>
            <tr class="bg-gray-200">
                <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Name</th>
                <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Category</th>
                <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Service</th>
                <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Pricing</th>
                <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Completed Bookings</th>
                <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Commission</th>
                <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Verified Payment</th>
                <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Status</th>
                <th class="px-6 py-3 border-b border-gray-300 text-left text-sm leading-4 font-medium text-gray-700">Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($workers  as $worker)
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
                        ₱
                        @if ($worker->lowest_price == $worker->highest_price)
                            {{ $worker->lowest_price }}
                        @else
                            {{ $worker->lowest_price }} - {{ $worker->highest_price }}
                        @endif
                    </td>
                    <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-300">
                        {{ $worker->completed_bookings }}
                    </td>
                    <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-300">
                        ₱{{ $worker->commissionToPay() }}
                    </td>
                    <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-300">
                        ₱{{ $worker->verified_payment }}
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
