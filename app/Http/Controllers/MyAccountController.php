<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

use App\Models\AppSetting;
use App\Models\UserProfile;
use App\Models\User;
use App\Models\WorkerProfile;
use App\Models\WorkerProfileView;
use App\Models\Booking;
use App\Models\Commission;
use App\Models\SpecificService;

use Illuminate\Support\Facades\Hash;

class MyAccountController extends Controller
{
    public function index(Request $request)
    {
        $settings = AppSetting::first();
        $feature = $request->query('feature');
        $profile = Auth::user()->profile;

        // Admin & Client
        if (Auth::user()->userProfile->role_id != 3)
        {
            return view('pages.my-account', [
                'settings' => $settings,
                'feature' => $feature,
                'profile' => $profile
            ]);
        }
        // Worker
        else if (Auth::user()->userProfile->role_id == 3)
        {
            $workerProfile = Auth::user()->workerProfile;

            if ($workerProfile) {
                $commissions = Commission::where('worker_id', $workerProfile->id)->get();
            } else {
                $commissions = [];
            }

            $specificServices = Auth::user()->workerProfile->specificServices;

            return view('pages.my-account', [
                'settings' => $settings,
                'feature' => $feature,
                'commissions' => $commissions,
                'specificServices' => $specificServices,
                'profile' => $profile
            ]);
        }
    }

    // [1] Update Profile
    public function updateProfilePicture(Request $request)
    {
        // Validate the request
        $request->validate([
            'profile_picture' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        // Get the logged-in user
        $user = Auth::user();
        $profile = $user->profile;

        // Handle the profile picture upload
        if ($request->hasFile('profile_picture')) {
            // Store the file and get its path
            $path = $request->file('profile_picture')->store('profile_pictures', 'public');

            // Update the profile_picture field in the user_profiles table
            $profile->profile_picture = $path;
            $profile->save();
        }

        // Redirect back to the previous page
        return redirect()->back()->with('success', 'You\'ve successfully updated your account details!');
    }

    // [2] Update Passowrd
    public function updatePassword(Request $request)
    {
        $request->validate([
            'current_password' => 'required',
            'password' => 'required|string|min:6|confirmed',
        ]);

        $user = Auth::user();

        if (!Hash::check($request->current_password, $user->password)) {
            return back()->withErrors(['current_password' => 'Current password does not match.']);
        }

        $user->password = Hash::make($request->password);
        $user->save();

        return back()->with('success', 'Password successfully updated.');
    }

    // [3] Account Verification
    public function verifyAccount(Request $request)
    {
        // Validate the request
        $request->validate([
            'valid_id' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
            'selfie_with_valid_id' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        // Get the logged-in user
        $user = Auth::user();
        $profile = $user->profile;

        // Handle the valid ID upload
        if ($request->hasFile('valid_id')) {
            // Store the file and get its path
            $validIdPath = $request->file('valid_id')->store('valid_ids', 'public');

            // Update the valid_id field in the user_profiles table
            $profile->valid_id = $validIdPath;
        }

        // Handle the selfie with valid ID upload
        if ($request->hasFile('selfie_with_valid_id')) {
            // Store the file and get its path
            $selfieWithValidIdPath = $request->file('selfie_with_valid_id')->store('selfie_with_valid_ids', 'public');

            // Update the selfie_with_valid_id field in the user_profiles table
            $profile->selfie_with_valid_id = $selfieWithValidIdPath;
        }

        // Save the profile if any changes were made
        if ($profile->isDirty()) {
            $profile->submitted_at = now();
            $profile->is_verified = 0;
            $profile->save();
        }

        // Redirect back to the previous page
        return back()->with('success', 'Account verification will be reviewed within 24 hours.');
    }

    // [4] Pay Commission
    public function uploadProofOfPayment(Request $request)
    {
        foreach ($request->allFiles() as $key => $file) {
            if (strpos($key, 'proof_of_payment_') === 0) {
                $commissionId = str_replace('proof_of_payment_', '', $key);
                $commission = Commission::find($commissionId);
                $path = $file->store('proof_of_payments', 'public');

                // Save the path or handle the file as needed
                $commission->is_paid = 1;
                $commission->paid_at = Carbon::now();;
                $commission->proof_of_payment = $path;
                $commission->save();
            }
        }

        return back()->with('success', 'Proof of payment uploaded successfully.');
    }

    // [5] Add New Specific Service
    public function addNewSpecificService(Request $request)
    {
        // Validate the request data
        $request->validate([
            'specific_service' => 'required|string|max:255',
            'description' => 'nullable|string',
            'price' => 'required|numeric|min:0',
            'duration' => 'required|integer|min:0',
        ]);

        // Create the specific service
        SpecificService::create([
            'worker_id' => Auth::user()->workerProfile->id,
            'specific_service' => $request->specific_service,
            'description' => $request->description,
            'price' => $request->price,
            'duration' => $request->duration,
        ]);

        return redirect()->route('my.account', ['feature' => 4])->with('success', 'Specific service added successfully.');
    }



}
