<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProprietaireController;

Route::get('/', function () {
    return view('welcome');
});
use App\Http\Controllers\Auth\LoginController;

Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

// Exemple page protégée
Route::get('/home', function () {
    return view('home');
})->middleware('auth');

Route::middleware(['auth'])->group(function () {
    Route::resource('proprietaires', ProprietaireController::class);
    
    // Ajouter d'autres ressources ici
    // Route::resource('proprietes', ProprieteController::class);
    // Route::resource('locations', LocationController::class);
});

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');