<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Operateur;

class LoginController extends Controller
{
    public function showLoginForm()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'LoginOp' => 'required|string',
            'password' => 'required|string',
        ]);

        $operator = Operateur::where('LoginOp', $request->LoginOp)
                             ->where('MotPasseOp', $request->password) // pour le dev seulement, pas hashé
                             ->first();

        if ($operator) {
            Auth::login($operator);
            $request->session()->regenerate();
            return redirect()->intended('/home');
        }

        return back()->withErrors([
            'LoginOp' => 'Identifiants incorrects',
        ]);
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/login');
    }
}
