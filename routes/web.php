<?php

use App\Http\Controllers\ApplianceController;
use App\Http\Controllers\ElectricityConsumptionController;
use App\Http\Controllers\MeterController;
use App\Http\Controllers\TokenController;
use App\Http\Controllers\UserController;
use App\Models\ElectricityConsumption;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return Inertia::render('Auth/Login', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', [UserController::class, 'consumerDashboard'])->name('dashboard');
});


//route prefix for admin
Route::prefix('admin')->middleware(['auth:sanctum', 'verified'])->group(function () {
    Route::get('/dashboard', [UserController::class, 'adminDashboard'])->name('admin.dashboard');

    Route::get('/consumers', [UserController::class, 'index'])->name('admin.users');

    Route::get('/meters', [MeterController::class, 'index'])->name('admin.meters');
    Route::post('/calculateConsumption', [ElectricityConsumptionController::class, 'store'])->name('admin.calculateConsumption');

    Route::get('/consumptions', [ElectricityConsumptionController::class, 'admin'])->name('admin.consumptions');

    Route::get('/tokens', [TokenController::class, 'index'])->name('admin.tokens');
    Route::get('/token/create', [TokenController::class, 'create'])->name('create.tokens');
    Route::post('/tokens', [TokenController::class, 'store'])->name('store.tokens');

    Route::post('/consumers', [UserController::class, 'store'])->name('store.users');
    Route::delete('/consumers/{user}', [UserController::class, 'destroy'])->name('delete.users');
    Route::patch('/consumers/{user}', [UserController::class, 'update'])->name('update.users');
    Route::get('/consumer/create', [UserController::class, 'create'])->name('update.users');

    //appliances routes
    Route::get('/appliances', [ApplianceController::class, 'index'])->name('admin.appliances');

    Route::post('/appliances', [ApplianceController::class, 'store'])->name('store.appliances');
    Route::delete('/appliances/{user}', [ApplianceController::class, 'destroy'])->name('delete.appliances');
    Route::patch('/appliances/{user}', [ApplianceController::class, 'update'])->name('update.appliances');
    Route::get('/appliance/create', [ApplianceController::class, 'create'])->name('get.appliances');
});

Route::prefix('consumer')->middleware(['auth:sanctum', 'verified'])->group(function () {
    Route::get('/dashboard', [UserController::class, 'consumerDashboard'])->name('consumer.dashboard');


    Route::get('/meter', [MeterController::class, 'consumerMeter'])->name('consumer.meters');

    Route::get('/consumptions', function () {
        return Inertia::render('Consumer/Consumption');
    })->name('consumer.consumptions');

    Route::get('/tokens', [TokenController::class, 'consumerTokens'])->name('consumer.tokens');
    Route::get('/appliances', [ApplianceController::class, 'consumerAppliances'])->name('consumer.appliances');
    Route::get('/appliance/create', [ApplianceController::class, 'createConsumer']);

    Route::post('/appliances', [ApplianceController::class, 'storeConsumerAppliance'])->name('store.consumer.appliances');

    //users route

});
