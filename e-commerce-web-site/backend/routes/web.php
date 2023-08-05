<?php

use App\Http\Controllers\Approval;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\EmployeeController;
use Illuminate\Routing\Controllers\Middleware;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [HomeController::class, 'checkRoleid']);
Route::post('/admin/change-status/{user}', [Approval::class, 'switchStatus'])
    ->name('admin.approve')
    ->middleware('adminOrEmployee');
Route::middleware(['auth'])->group(function () {
        // Customer routes
        Route::resource('dashboard/customer', CustomerController::class)->name('index', 'customer');
        
        // Employee routes
        Route::resource('dashboard/employee', EmployeeController::class)->name('index', 'employee');
        
        // Approval routes
        Route::resource('dashboard/approval', Approval::class)->name('index', 'approval');
        
        // View for orders
        Route::view('dashboard/orders', 'dashboard.orders')->name('orders');
    });
    