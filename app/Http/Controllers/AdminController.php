<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

use App\Models\UserProfile;
use App\Models\User;
use App\Models\WorkerProfile;
use App\Models\WorkerProfileView;
use App\Models\Commission;

use App\Models\Booking;

class AdminController extends Controller
{
    public function index()
    {
        $workers = WorkerProfile::with(['user', 'category', 'service'])
            ->withCount(['bookings as completed_bookings' => function ($query) {
                $query->where('status', 'Completed');
            }])
            ->get();

        $eligibleWorkers = WorkerProfile::whereHas('bookings', function ($query) {
            $query->where('status', 'Completed');
        })->get();


        foreach ($workers as $worker) {
            $worker->commission = round($worker->pricing * $worker->completed_bookings * 0.1, 2);
        }

        return view('pages.admin-home', [
                'workers' => $workers,
                'eligibleWorkers' => $eligibleWorkers
            ]);
    }

    public function deactivateWorker($id)
    {
        $worker = WorkerProfile::find($id);
        $worker->status = 0;
        $worker->save();

        return redirect()->back();
    }

    public function reactivateWorker($id)
    {
        $worker = WorkerProfile::find($id);
        $worker->status = 1;
        $worker->save();

        return redirect()->back();
    }

    public function requestCommissionPaymentAll()
    {
        // Get all workers whose commission is not equal to 0
        $eligibleWorkers = WorkerProfile::whereHas('bookings', function ($query) {
            $query->where('status', 'Completed');
        })->get();

        foreach ($eligibleWorkers as $worker) {
            // Calculate completed bookings count for the worker
            $completedBookingsCount = Booking::where('worker_id', $worker->id)
                ->where('status', 'Completed')
                ->count();

            if ($completedBookingsCount > 0) {
                // Perform any necessary calculations for the commission
                $commission = round($worker->pricing * $completedBookingsCount * 0.1, 2);

                // Insert commission request
                Commission::create([
                    'requested_at' => Carbon::now(),
                    'worker_id' => $worker->id,
                    'amount' => $commission,
                    'is_paid' => 0,
                    'is_verified' => 0,
                ]);
            }
        }

        return redirect()->back()->with('success', 'Commission requests inserted successfully for all eligible workers.');
    }


}
