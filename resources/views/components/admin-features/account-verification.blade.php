<div class="overflow-x-auto mt-4">
    <h1 class="text-2xl font-bold mb-4 text-center">Account Verification</h1>

    @if (session('success'))
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4 max-w-4xl mx-auto text-center" role="alert">
            <strong class="font-bold">{{ session('success') }}</strong>
        </div>
    @endif

    <div class="max-w-4xl mx-auto">
        <div class="overflow-hidden border-b border-gray-200 sm:rounded-lg">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                        <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Submitted Files</th>
                        <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Action</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @foreach ($unverifiedUsers as $user)
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap text-center">
                                <div class="flex items-center justify-center">
                                    <div class="flex-shrink-0 h-10 w-10">
                                        <img class="h-10 w-10 rounded-full" src="{{ $user->profile_picture ? asset('storage/' . $user->profile_picture) : 'https://via.placeholder.com/50' }}" alt="">
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-sm font-medium text-gray-900">{{ $user->first_name }} {{ $user->last_name }}</div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-center">
                                <div class="text-sm text-gray-900">
                                    <a href="#" class="view-files text-blue-600 hover:underline" data-valid-id="{{ $user->valid_id ? asset('storage/' . $user->valid_id) : '' }}" data-selfie-id="{{ $user->selfie_with_valid_id ? asset('storage/' . $user->selfie_with_valid_id) : '' }}">View</a>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-center">
                                <div class="flex gap-2 justify-center">
                                    <form action="{{ route('verifyAccountVerification', ['id' => $user->id]) }}" method="POST">
                                        @csrf

                                        <button type="submit" class="text-white bg-blue-800 hover:bg-blue-600 py-1 px-3 rounded-md focus:outline-none focus:shadow-outline">
                                            Verify
                                        </button>
                                    </form>
                                    <form action="{{ route('rejectAccountVerification', ['id' => $user->id]) }}" method="POST">
                                        @csrf
                                        <button type="submit" class="text-white bg-red-500 hover:bg-red-600 py-1 px-3 rounded-md focus:outline-none focus:shadow-outline">
                                            Reject
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="mt-4 max-w-4xl mx-auto">
    <h2 class="text-lg font-medium text-gray-900 mb-4 text-center">Submitted Files Preview</h2>
    <div class="flex justify-center mb-4">
        <div class="max-w-xs">
            <label class="block text-sm font-medium text-gray-700">Valid ID</label>
            <img src="" alt="Valid ID" class="w-full h-48 object-contain mt-1" id="valid-id-img">
        </div>
        <div class="max-w-xs ml-4">
            <label class="block text-sm font-medium text-gray-700">Selfie with Valid ID</label>
            <img src="" alt="Selfie with Valid ID" class="w-full h-48 object-contain mt-1" id="selfie-img">
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        let viewLinks = document.querySelectorAll('.view-files');
        let validIdImg = document.getElementById('valid-id-img');
        let selfieImg = document.getElementById('selfie-img');

        viewLinks.forEach(function(link) {
            link.addEventListener('click', function(event) {
                event.preventDefault();

                let validIdPath = this.getAttribute('data-valid-id');
                let selfieIdPath = this.getAttribute('data-selfie-id');

                validIdImg.src = validIdPath ? validIdPath : 'https://via.placeholder.com/300';
                selfieImg.src = selfieIdPath ? selfieIdPath : 'https://via.placeholder.com/300';
            });
        });
    });
</script>
