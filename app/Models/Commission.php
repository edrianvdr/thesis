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

}
