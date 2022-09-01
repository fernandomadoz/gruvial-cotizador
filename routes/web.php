<?php

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

	Route::get('/', 'HomeController@index');
	Route::get('/home', 'HomeController@index');
	Route::post('/home', 'HomeController@index');
	Route::get('/micuenta', 'HomeController@miCuenta');

	// RUTAS GENERICAS
	Route::post('/crearlista', 'GenericController@crearLista');
	Route::post('/crearabm', 'GenericController@crearABM');
	Route::post('/enviarabm/{gen_modelo}', 'GenericController@crearABM');
	Route::post('/store', 'GenericController@store');
	Route::get('/list/{gen_modelo}/{gen_opcion}', 'GenericController@index');
	// FIN RUTAS GENERICAS


	Route::get('/crear-cotizacion', 'PresupuestoController@crearCotizacion');
	Route::get('/crear-trabajo', 'TrabajoController@crearTrabajo');
	Route::get('/modificar-cotizaciones/{cotizacion_id}', 'PresupuestoController@modificarCotizacion');
	Route::post('/guardar-cotizacion', 'PresupuestoController@guardarCotizacion');
	Route::get('/generar-pdf-cotizacion/{cotizacion_id}', 'PresupuestoController@generarPDFCotizacion');
	Route::get('data/destnatarios-cotizaciones', 'PresupuestoController@jsonDestinatariosCotizaciones');
	Route::get('/enviar-cotizacion-via-email/{cotizacion_id}', 'PresupuestoController@enviarCotizacionViaEmail');


	


});

Route::get('/prueba', function () {
    return view('prueba');
});	


Auth::routes();

Route::get('/delcache', function () {
    $exitCode = Artisan::call('cache:clear');
    echo 'Cache Borrada';
});



//FORMS
