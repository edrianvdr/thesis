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
