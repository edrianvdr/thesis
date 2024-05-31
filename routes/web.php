<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\MyBookingsController;
use App\Http\Controllers\SignUpController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\MyAccountController;

// Landing page
Route::get('/', [AuthController::class, 'index']);
// Go to Sign Up
Route::get('/sign-up', [AuthController::class, 'sign_up'])->name('sign_up');
// Go to Sign Up and Become a Worker
Route::get('/sign-up-and-become-a-worker', [AuthController::class, 'signUpAndBecomeAWorker'])->name('sign_up_and_become_a_worker');

// Login
Route::post('/login', [AuthController::class, 'login']);
// Logout
Route::get('/logout', [AuthController::class, 'logout'])->name('logout');

// [1] Admin
Route::get('/admin/home', [AdminController::class, 'index'])->name('admin.home');
// Deactivate Worker
Route::post('/admin/deactivate-worker/{id}', [AdminController::class, 'deactivateWorker'])->name('admin.deactivateWorker');
// Reactivate Worker
Route::post('/admin/reactivate-worker/{id}', [AdminController::class, 'reactivateWorker'])->name('admin.reactivateWorker');
// Request Commission Payment
Route::post('/admin/request-commission-payment-all', [AdminController::class, 'requestCommissionPaymentAll'])->name('admin.requestCommissionPaymentAll');


// Home page - landing page after Login
Route::get('/home', [AuthController::class, 'home'])->name('home');

    // Client Navbar
    // Go to Sign Up Worker page
    Route::get('/become-a-worker', [AuthController::class, 'sign_up_worker'])->name('sign_up_worker');
    // Go to My Bookings
    Route::get('/my-bookings', [MyBookingsController::class, 'my_bookings'])->name('my_bookings');
        // Cancel Booking
        Route::post('/cancel-booking/{booking}', [MyBookingsController::class, 'cancelBooking'])->name('cancel.booking');
        // Accept Booking
        Route::post('/accept-booking/{booking}', [MyBookingsController::class, 'acceptBooking'])->name('accept.booking');
        // Complete Booking
        Route::post('/complete-booking/{booking}', [MyBookingsController::class, 'completeBooking'])->name('complete.booking');
        // Submit Rating
        Route::post('/submit-rating/{booking}', [MyBookingsController::class, 'submitRating'])->name('submit.rating');



// Go to Worker Profile
Route::get('/worker/profile/{userId}/{workerProfileId}', [AuthController::class, 'showWorkerProfile'])->name('worker.profile');
    // Track Viewing
    // Route::post('/track/worker/profile/view', 'AuthController@trackView')->name('track.worker.profile.view');
    Route::post('/track/worker/profile/view', [AuthController::class, 'trackView'])->name('track.worker.profile.view');
// Book a Service
Route::post('/book', [AuthController::class, 'book'])->name('book');

// Go to My Account
Route::get('/my-account', [MyAccountController::class, 'index'])->name('my.account');
    // [1] Update Profile Picture
    Route::post('/update-profile', [MyAccountController::class, 'updateProfilePicture'])->name('update.profile');
    // [2] Update Password
    Route::post('/update-password', [MyAccountController::class, 'updatePassword'])->name('update.password');
    // [3] Pay Commission
    Route::post('/upload-proof-of-payment', [MyAccountController::class, 'uploadProofOfPayment'])->name('upload.proof_of_payment');
    // [4] Add New Specific Service
    Route::post('/add-new-specific-service', [MyAccountController::class, 'addNewSpecificService'])->name('add.new_specific_service');
