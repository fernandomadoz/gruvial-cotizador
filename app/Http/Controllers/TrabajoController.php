<?php

namespace App\Http\Controllers;
use App\Maquina;
use App\Firma;
use App\Cliente;
use App\Trabajo_encabezado;
use App\Parametro;

use App\Http\Controllers\GenericController;
use \App\Http\Controllers\FxC; 
use \App\Http\Controllers\NotificationController; 


use Auth;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;



class TrabajoController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function crearTrabajo()
    {   
        //$Solicitudes = Solicitud::all();

        $Firmas = Firma::all();
        $Clientes = Cliente::all();
        $titulo = 'Crear Trabajo';

        $Trabajo_encabezado = new Trabajo_encabezado();
        $Trabajo_encabezado->id = -1;

        return View('trabajos/crear-trabajo')
        ->with('titulo', $titulo)
        ->with('Firmas', $Firmas)
        ->with('Clientes', $Clientes)
        ->with('Trabajo_encabezado', $Trabajo_encabezado);
    }




}
