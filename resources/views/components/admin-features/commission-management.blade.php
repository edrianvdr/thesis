<div class="overflow-x-auto">
    <h1 class="text-2xl font-bold mb-4">Commission Management</h1>

    @if (session('success'))
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
            <strong class="font-bold">{{ session('success') }}</strong>
        </div>
    @endif

    @include('components.admin-features.request-pay-commission')

    <table class="min-w-full bg-white">
        <thead>
            <tr class="bg-gray-100 text-gray-600 uppercase text-sm leading-normal">
                <th class="py-3 px-6 text-left">ID</th>
                <th class="py-3 px-6 text-left">Worker ID</th>
                <th class="py-3 px-6 text-left">Amount</th>
                <th class="py-3 px-6 text-left">Is Paid</th>
                <th class="py-3 px-6 text-left">Paid At</th>
                <th class="py-3 px-6 text-left">Is Verified</th>
                <th class="py-3 px-6 text-left">Verified At</th>
                <th class="py-3 px-6 text-left">Proof of Payment</th>
                <th class="py-3 px-6 text-left">Status</th>
                <th class="py-3 px-6 text-left">Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($commissions as $commission)
            <tr class="border-b border-gray-200 hover:bg-gray-100">
                <td class="py-3 px-6 text-left whitespace-nowrap">{{ $commission->id }}</td>
                <td class="py-3 px-6 text-left">
                    {{ $commission->worker->user->userProfile->first_name }} {{ $commission->worker->user->userProfile->last_name }}
                </td>
                <td class="py-3 px-6 text-left">{{ $commission->amount }}</td>
                <td class="py-3 px-6 text-left">
                    @if ($commission->is_paid == 1)
                        Paid
                    @elseif ($commission->is_paid == 0)
                        Unpaid
                    @endif
                </td>
                <td class="py-3 px-6 text-left">
                    @if ($commission->is_paid == 1)
                        {{ $commission->paid_at ? \Carbon\Carbon::parse($commission->paid_at)->format('F d, Y h:i A') : '' }}
                    @else
                        N/A
                    @endif
                </td>
                <td class="py-3 px-6 text-left">
                    @if ($commission->is_paid == 1)
                        @if ($commission->is_verified == 0)
                            Not yet verified
                        @elseif ($commission->is_verified == 1)
                            Verified
                        @elseif ($commission->is_verified == 2)
                            Rejected
                        @endif
                    @else
                        N/A
                    @endif
                </td>
                <td class="py-3 px-6 text-left">
                    @if ($commission->is_paid == 1)
                        @if ($commission->is_verified != 0)
                            {{ $commission->verified_at ? \Carbon\Carbon::parse($commission->verified_at)->format('F d, Y h:i A') : '' }}
                        @else
                            N/A
                        @endif
                    @else
                        N/A
                    @endif
                </td>
                <td class="py-3 px-6 text-center">
                    @if ($commission->is_paid == 1)
                        @if ($commission->proof_of_payment)
                            <a href="{{ asset('storage/' . $commission->proof_of_payment) }}"
                                target="_blank"
                                class="text-blue-600 hover:text-blue-900">
                                View Proof
                            </a>

                            @if ($commission->is_verified == 0)
                                <form action="{{ route('admin.verifyCommission', ['id' => $commission->id]) }}" method="POST" class="inline-block">
                                    @csrf
                                    <button type="submit" class="text-white bg-blue-800 hover:bg-blue-600 py-1 px-3 rounded-md focus:outline-none focus:shadow-outline">
                                        Verify
                                    </button>
                                </form>
                                <form action="{{ route('admin.rejectCommission', ['id' => $commission->id]) }}" method="POST" class="inline-block">
                                    @csrf
                                    <button type="submit" class="text-white bg-red-500 hover:bg-red-600 py-1 px-3 rounded-md focus:outline-none focus:shadow-outline">
                                        Reject
                                    </button>
                                </form>
                            @elseif ($commission->is_verified == 1)
                                Verified
                            @elseif ($commission->is_verified == 2)
                                Rejected
                            @endif
                        @else
                            No Proof Uploaded
                        @endif
                    @else
                        N/A
                    @endif
                </td>
                <td class="py-3 px-6 text-left">

                    @if ($commission->worker->status == 1)
                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                            Active
                        </span>
                    @else
                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-100 text-red-800">
                            Deactivated
                        </span>
                    @endif
                </td>
                <td class="py-3 px-6 text-left">
                    @if ($commission->worker->status == 1)
                        <form action="{{ route('admin.deactivateWorker', ['id' => $commission->worker->id]) }}" method="POST">
                            @csrf
                            <button type="submit" class="text-white bg-red-500 hover:bg-red-600 py-1 px-3 rounded-md focus:outline-none focus:shadow-outline">
                                Deactivate
                            </button>
                        </form>
                    @elseif ($commission->worker->status == 0)
                        <form action="{{ route('admin.reactivateWorker', ['id' => $commission->worker->id]) }}" method="POST">
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
