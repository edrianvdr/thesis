<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SpecificService extends Model
{
    use HasFactory;

    protected $table = 'specific_services';

    protected $fillable = [
        'worker_id',
        'specific_service',
        'description',
        'price',
        'duration'
    ];

    public $timestamps = false;

    public function worker()
    {
        return $this->belongsTo(WorkerProfile::class, 'worker_id');
    }

}
