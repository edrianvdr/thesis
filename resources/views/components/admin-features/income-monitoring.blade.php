<div class="overflow-x-auto mt-4">
    <h1 class="text-2xl font-bold mb-4 text-center">Income Monitoring</h1>

    <div class="flex flex-col sm:flex-row gap-4 max-w-4xl mx-auto">
        <div class="flex-1 bg-white overflow-hidden shadow rounded-lg p-4">
            <div class="text-center">
                <h3 class="text-lg text-white bg-blue-800  py-2 leading-6 font-medium text-gray-900">Total Earnings</h3>
                <p class="text-4xl py-2 font-extrabold text-gray-900">₱{{ number_format($totalEarnings->total_earnings, 2) }}</p>
            </div>
        </div>

        <div class="mt-4 sm:mt-0 flex-1 bg-white rounded-lg shadow-md">
            <div class="p-4">
                <h2 class="text-xl text-white bg-blue-800 py-2 px-4 font-semibold mb-2">Monthly Earnings</h2>
                <table class="min-w-full bg-white">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="py-3 px-6 text-left">Month</th>
                            <th class="py-3 px-6 text-left">Earnings</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        @foreach ($earnings as $earning)
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ $earning->month_name }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ number_format($earning->total_earnings, 2) }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
