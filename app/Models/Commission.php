<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Commission extends Model
{
    use HasFactory;

    protected $table = 'commissions';

    protected $fillable = [
        'requested_at',
        'worker_id',
        'amount',
        'is_paid',
        'paid_at',
        'proof_of_payment',
        'is_verified',
        'verified_at',
    ];

    public $timestamps = false;

    public function worker()
    {
        return $this->belongsTo(WorkerProfile::class, 'worker_id');
    }

    // Query
    public static function getTotalEarningsByMonth()
    {
        return self::selectRaw('SUM(amount) as total_earnings, DATE_FORMAT(verified_at, "%M") as month_name')
            ->where('is_verified', 1)
            ->groupByRaw('DATE_FORMAT(verified_at, "%M")')
            ->orderByRaw('MONTH(verified_at)')
            ->get();
    }

    public static function getTotalEarnings()
    {
        return self::selectRaw('SUM(amount) as total_earnings')
            ->where('is_verified', 1)
            ->first();
    }



}
