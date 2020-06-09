<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('login', 'APIController@login');
 // Route::post('login', [APIController::class, 'login'])->name('login');
Route::post('register', 'APIController@register');

Route::group(['middleware' => 'auth.jwt'], function () {
    Route::get('logout', 'APIController@logout');

    Route::get('tasks', 'TaskController@index');
    Route::get('tasks/{id}', 'TaskController@show');
    Route::post('tasks', 'TaskController@store');
    Route::put('tasks/{id}', 'TaskController@update');
    Route::delete('tasks/{id}', 'TaskController@destroy');
});

 Route::get('tasks_all', 'TaskController@task_for_all_user');
Route::get('tasks_alltest', 'TestController@index');


 // start of student api

//  Route::post('login', 'APIController@login');
// Route::post('register', 'APIController@register');

Route::group(['middleware' => 'auth.jwt'], function () {
    Route::get('logout', 'APIController@logout');
    Route::get('student', 'StudentController@index');
    Route::get('student/{id}', 'StudentController@show');
    Route::post('student', 'StudentController@store');
    Route::put('student/{id}', 'StudentController@update');
    Route::delete('student/{id}', 'StudentController@destroy');
});

Route::fallback(function(){
    return response()->json([
        'message' => 'Page Not Found. If error persists, contact info@website.com'], 404);
});