<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{CategoriasController,ProductosController};

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Route::get('/productos',[ProductosController::class,'index']);
// Route::get('/productos/{producto}',[ProductosController::class,'show']);
// Route::post('/productos',[ProductosController::class,'store']);
// Route::delete('productos/{producto}',[ProductosController::class,'destroy']);
// Route::patch('/productos/{producto}',[ProductosController::class,'update']);

Route::apiResource('/productos',ProductosController::class);
Route::apiResource('/categorias',CategoriasController::class);