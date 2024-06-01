<div class="flex items-center my-4">
    <form action="{{ route('admin.requestCommissionPaymentAll') }}" method="POST">
        @csrf
        <button type="submit" class="text-white bg-blue-500 hover:bg-blue-600 py-2 px-4 rounded-md focus:outline-none focus:shadow-outline">
            Request Payment for All Eligible Workers
        </button>
    </form>

    <p class="text-gray-700 ml-4">
        *This requests the workers to pay their respective commissions.
    </p>
</div>
