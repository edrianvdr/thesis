<h2 class="text-2xl font-bold mb-4">Pay Commission</h2>

@if ($commissions->isEmpty())
    <p>No commissions found.</p>
@else
    <table class="min-w-full bg-white">
        <thead>
            <tr>
                <th class="py-2">Amount</th>
                <th class="py-2">Is Paid</th>
                <th class="py-2">Paid At</th>
                <th class="py-2">Is Verified</th>
                <th class="py-2">Verified At</th>
                <th class="py-2">Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($commissions as $commission)
                <tr>
                    <td class="py-2">₱{{ $commission->amount }}</td>
                    <td class="py-2">{{ $commission->is_paid ? 'Yes' : 'No' }}</td>
                    <td class="py-2">{{ $commission->paid_at }}</td>
                    <td class="py-2">{{ $commission->is_verified ? 'Yes' : 'No' }}</td>
                    <td class="py-2">{{ $commission->verified_at }}</td>
                    <td class="py-2">
                        <form
                            action="{{ route('upload.proof_of_payment') }}"
                            method="POST"
                            enctype="multipart/form-data"
                        >
                            @csrf

                            <input type="hidden" name="commission_id" value="{{ $commission->id }}">
                            <input type="file" name="proof_of_payment_{{ $commission->id }}" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 focus:outline-none">
                            <button type="submit" class="mt-2 w-full bg-blue-600 text-white py-2 px-4 rounded-md shadow-sm hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                Upload Proof of Payment
                            </button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endif
