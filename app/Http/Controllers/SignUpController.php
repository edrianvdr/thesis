<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SignUpController extends Controller
{
    public function index()
    {
        return view('landing');
    }

    public function sign_up()
    {
        $settings = AppSetting::first();
        return view('auth.sign-up', [
            'settings' => $settings
        ]);
    }

    public function sign_up_worker()
    {
        $settings = AppSetting::first();
        return view('auth.sign-up-worker', [
            'settings' => $settings
        ]);
    }
}
