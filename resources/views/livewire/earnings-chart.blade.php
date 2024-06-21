<div>
    <h2 class="text-xl font-semibold mb-2">Monthly Earnings Chart</h2>
    <div wire:ignore>
        <canvas id="earningsChart" style="height: 400px; width: 100%;"></canvas>
    </div>
</div>

@push('scripts')
    <script>
        document.addEventListener('livewire:load', function () {
            Livewire.on('renderChart', function (data) {
                renderChart(data.months, data.earningsData);
            });

            function renderChart(months, earningsData) {
                var ctx = document.getElementById('earningsChart').getContext('2d');

                var chart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: months,
                        datasets: [{
                            label: 'Total Earnings',
                            data: earningsData,
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1,
                            tension: 0.4,
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    callback: function (value) {
                                        return '$' + value.toLocaleString();
                                    }
                                }
                            }
                        }
                    }
                });
            }
        });
    </script>
@endpush
