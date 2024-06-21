<?php

namespace App\Livewire;

use App\Models\Commission;
use Livewire\Component;

class EarningsChart extends Component
{
    public $earnings;

    public function render()
    {
        $this->earnings = Commission::getTotalEarningsByMonth();

        return view('livewire.earnings-chart', [
            'earnings' => $this->earnings,
        ]);
    }

    public function getChartData()
    {
        $earnings = Commission::getTotalEarningsByMonth();
        $months = $earnings->pluck('month_name')->toArray();
        $earningsData = $earnings->pluck('total_earnings')->toArray();

        return [
            'months' => $months,
            'earningsData' => $earningsData,
        ];
    }


}
