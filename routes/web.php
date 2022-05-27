<?php

use App\Http\Controllers\AccountController;
use App\Http\Controllers\TaskController;
use Illuminate\Support\Facades\Route;

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

Route::group(['middleware' => 'auth'], function () {
    Route::get('/', AccountController::class)
        ->name('myTasks');

    Route::get('/myTasks/{userId}', AccountController::class)
        ->where('userId', '\d+')
        ->name('myTasks');

    Route::get('/index/{filter}', [TaskController::class, 'index'])
        ->where('filter', '\d+')
        ->name('index');

    Route::get('/filterTasks/{filter}', [TaskController::class, 'filterTasks'])
        ->where('filter', '\d+')
        ->name('filterTasks');

    Route::get('/create', [TaskController::class, 'create'])
        ->name('create');

    Route::post('/store', [TaskController::class, 'store'])
        ->name('store');

    Route::get('show/{id}/{link}/{filter}', [TaskController::class, 'show'])
        ->where('id', '\d+')
        ->where('link', '\d+')
        ->where('filter', '\d+')
        ->name('show');

    Route::get('back/{link}/{filter}', [TaskController::class, 'back'])
        ->where('link', '\d+')
        ->where('filter', '\d+')
        ->name('back');

    Route::get('delete/{id}/{link}/{filter}', [TaskController::class, 'delete'])
        ->where('id', '\d+')
        ->where('link', '\d+')
        ->where('filter', '\d+')
        ->name('delete');

    Route::put('taskEdit/{id}/{link}/{filter}', [TaskController::class, 'taskEdit'])
        ->where('id', '\d+')
        ->where('link', '\d+')
        ->where('filter', '\d+')
        ->name('taskEdit');

    Route::get('destroy/{id}/{link}/{filter}', [TaskController::class, 'destroy'])
        ->where('id', '\d+')
        ->where('link', '\d+')
        ->where('filter', '\d+')
        ->name('destroy');
});

Auth::routes();

//Route::get('/home', [HomeController::class, 'index'])
//    ->name('home');
