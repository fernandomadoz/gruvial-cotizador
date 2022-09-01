<?php

namespace App\Http\Controllers;
use App\Maquina;
use App\Cotizacion_encabezado;
use App\Cotizacion_linea;
use App\Parametro;

use App\Http\Controllers\GenericController;
use \App\Http\Controllers\FxC; 
use \App\Http\Controllers\NotificationController; 


use Auth;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;



class PresupuestoController extends Controller
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
    public function crearCotizacion()
    {   
        //$Solicitudes = Solicitud::all();

        $Maquinas = Maquina::where('sino_activa', 'SI')->get();
        $Parametro = Parametro::find(1);
        $condiciones_de_cotizacion = $Parametro->rtf_texto;
        $titulo = 'Crear Cotización';
        $btn_descargar_pdf = 'false';

        $Cotizacion_encabezado = new Cotizacion_encabezado();
        $Cotizacion_encabezado->id = -1;

        return View('presupuestos/crear-presupuesto')
        ->with('titulo', $titulo)
        ->with('btn_descargar_pdf', $btn_descargar_pdf)
        ->with('Maquinas', $Maquinas)
        ->with('Cotizacion_encabezado', $Cotizacion_encabezado)
        ->with('condiciones_de_cotizacion', $condiciones_de_cotizacion);
    }

    public function modificarCotizacion($cotizacion_id)
    {   
        //$Solicitudes = Solicitud::all();

        $Cotizacion_encabezado = Cotizacion_encabezado::find($cotizacion_id);
        $Cotizacion_lineas = Cotizacion_linea::where('cotizacion_id', $cotizacion_id)->get();
        $Maquinas = Maquina::where('sino_activa', 'SI')->get();
        $condiciones_de_cotizacion = $Cotizacion_encabezado->condiciones_de_cotizacion;
        $titulo = 'Modificar Cotización';
        $btn_descargar_pdf = 'true';

        return View('presupuestos/crear-presupuesto')
        ->with('Maquinas', $Maquinas)
        ->with('titulo', $titulo)
        ->with('btn_descargar_pdf', $btn_descargar_pdf)
        ->with('condiciones_de_cotizacion', $condiciones_de_cotizacion)
        ->with('Cotizacion_encabezado', $Cotizacion_encabezado)
        ->with('Cotizacion_lineas', $Cotizacion_lineas);
    }



    public function guardarCotizacion(request $request)
    {   

        $cotizacion_id = $request->cotizacion_id;

        if ($cotizacion_id > 0) {
            $Cotizacion_encabezado = Cotizacion_encabezado::find($cotizacion_id);
        }
        else {
            $Cotizacion_encabezado = new Cotizacion_encabezado();
        }

        $Cotizacion_encabezado->razon_social = $request->razon_social;
        $Cotizacion_encabezado->nombre_de_la_persona = $request->nombre_de_la_persona;
        $Cotizacion_encabezado->celular = $request->celular;
        $Cotizacion_encabezado->email_correo = $request->email_correo;
        $Cotizacion_encabezado->localidad = $request->localidad;
        $Cotizacion_encabezado->domicilio = $request->domicilio;
        $Cotizacion_encabezado->user_id = Auth::user()->id;
        $Cotizacion_encabezado->condiciones_de_cotizacion = $request->condiciones_de_cotizacion;
        $Cotizacion_encabezado->save();

        $cotizacion_id = $Cotizacion_encabezado->id;


        $hash = rand(10000, 999999);
        $nombre_del_pdf = 'cotizacion-gruvial-nro-'.$cotizacion_id.'-'.$hash.'.pdf';
        $Cotizacion_encabezado->url_pdf = env('PATH_PUBLIC').'storage/cotizaciones/'.$nombre_del_pdf;
        $Cotizacion_encabezado->save();

        // CARGAMOS LAS LINEAS DE LA COTIZACION
        
        // MAQUINAS
        Cotizacion_linea::where('cotizacion_id', $cotizacion_id)->delete();

        for($i=0; $i<count($request->maquinas)-3; $i++) { 

            $maquina_id = $request->maquinas[$i]['id'];
            $titulo = $request->maquinas[$i]['titulo'];
            $texto = $request->maquinas[$i]['texto'];
            //echo $i.'<br>';
            //echo $request->maquinas[$i]['nombre_de_maquina'].'<br>';
            //echo $request->maquinas[$i]['chequeado'].'<br>';

            if ($request->maquinas[$i]['chequeado'] == 'true') {
                $Cotizacion_linea = new Cotizacion_linea();
                $Cotizacion_linea->cotizacion_id = $cotizacion_id;
                $Cotizacion_linea->maquina_id = $maquina_id;
                $Cotizacion_linea->titulo = $titulo;   
                $Cotizacion_linea->rtf_texto = $texto;       
                $Cotizacion_linea->save();
            }
        }

        // OTROS

        $i = count($request->maquinas)-3;
        if ($request->maquinas[$i]['chequeado'] == 'true') {
            $Cotizacion_linea = new Cotizacion_linea();
            $Cotizacion_linea->cotizacion_id = $cotizacion_id;
            $Cotizacion_linea->maquina_id = null;
            $Cotizacion_linea->titulo = $request->maquinas[$i]['titulo'];   
            $Cotizacion_linea->rtf_texto = $request->maquinas[$i]['texto'];       
            $Cotizacion_linea->save();
        }
        $i++;
        if ($request->maquinas[$i]['chequeado'] == 'true') {
            $Cotizacion_linea = new Cotizacion_linea();
            $Cotizacion_linea->cotizacion_id = $cotizacion_id;
            $Cotizacion_linea->maquina_id = null;
            $Cotizacion_linea->titulo = $request->maquinas[$i]['titulo'];   
            $Cotizacion_linea->rtf_texto = $request->maquinas[$i]['texto'];           
            $Cotizacion_linea->save();
        }
        $i++;
        if ($request->maquinas[$i]['chequeado'] == 'true') {
            $Cotizacion_linea = new Cotizacion_linea();
            $Cotizacion_linea->cotizacion_id = $cotizacion_id;
            $Cotizacion_linea->maquina_id = null;
            $Cotizacion_linea->titulo = $request->maquinas[$i]['titulo'];   
            $Cotizacion_linea->rtf_texto = $request->maquinas[$i]['texto'];              
            $Cotizacion_linea->save();
        }
        $i++;
    
        echo $cotizacion_id;
    }


    public function generarPDFCotizacion($cotizacion_id) {


        $pdf = \App::make('dompdf.wrapper');
        $Cotizacion_encabezado = Cotizacion_encabezado::find($cotizacion_id);

        $gCon = new GenericController();
        $fcx = new FxC();

        $encabezado = '<html>';
        $encabezado .= '<head>';
        $encabezado .= '  <style>';
        $encabezado .= '    @page { margin-top: 80px; font-family: Arial, Helvetica, sans-serif; font-size: 13px}';
        $encabezado .= '    header { position: fixed; top: -70px; left: 0px; right: 0px; height: 50px; margin-top: 70px }';
        $encabezado .= '    footer { position: fixed; bottom: 40px; left: 0px; right: 0px; height: 50px; }';
        //$encabezado .= '    p { page-break-after: always; }';
        //$encabezado .= '    p:last-child { page-break-after: never; }';
        $encabezado .= '  </style>';
        $encabezado .= '</head>';
        $encabezado .= '<body>';
        $encabezado .= '<header><center><img src="'.env('PATH_PUBLIC').'img/top-presupuesto.jpg"  style="width: 100%"></center></header>';
        //$encabezado .= '<header><p style="text-align: right"><img src="'.env('PATH_PUBLIC').'img/logo.jpg" style="width: 200px"></p></header><footer>info pie</footer>';

        $fecha = strtotime($Cotizacion_encabezado->created_at);
        $dia = date("d", $fecha);
        $numero_de_mes_fecha = date("m", $fecha);
        $nombre_de_mes = $fcx->nombre_de_mes($numero_de_mes_fecha);
        $anio = date("Y", $fecha);

        // FECHA
        $cuerpo = '<p style="text-align: right; margin-top: -30px">La Rioja, '.$dia.' de '.$nombre_de_mes.' de '.$anio.'</p>';
        
        // DIRIGIDO A
        $cuerpo .= '<strong><p style="margin-top: 30px; font-size: 17px">';
        if ($Cotizacion_encabezado->razon_social <> '') {
            $cuerpo .= 'Sres. '.$Cotizacion_encabezado->razon_social.'<br>';
        }
        if ($Cotizacion_encabezado->nombre_de_la_persona <> '') {
            $cuerpo .= 'At: '.$Cotizacion_encabezado->nombre_de_la_persona.'<br>';
        }
        if ($Cotizacion_encabezado->celular <> '') {
            $cuerpo .= 'Cel: '.$Cotizacion_encabezado->celular.'<br>';
        }
        if ($Cotizacion_encabezado->email_correo <> '') {
            $cuerpo .= 'Email: '.$Cotizacion_encabezado->email_correo.'<br>';
        }
        $cuerpo .= 'Cotizaci&oacute;n ID: '.$Cotizacion_encabezado->id.'<br>';
        $cuerpo .= '</p></strong>';
        
        //MAQUINAS
        $Cotizacion_lineas = Cotizacion_linea::where('cotizacion_id', $cotizacion_id)->get();

        foreach ($Cotizacion_lineas as $Cotizacion_lineas) {
            $cuerpo .= '<br>';
            $cuerpo .= '<p style="font-size: 14px; font-weight: bold">Ref.: '.$Cotizacion_lineas->titulo.'<p>';
            if ($Cotizacion_lineas->maquina_id <> '') {
                $cuerpo .= '<p style="font-size: 13px"><u>'.$Cotizacion_lineas->maquina->nombre_de_maquina.'</u><br>';
            }
            $cuerpo .= $Cotizacion_lineas->rtf_texto;
            $cuerpo .= '</p>';
        }

        if ($Cotizacion_encabezado->condiciones_de_cotizacion <> '') {
            $cuerpo .= '<br><br>'.$Cotizacion_encabezado->condiciones_de_cotizacion;
        }

        $cuerpo .= '<table style="float: right"><tr><td><img src="'.env('PATH_PUBLIC').'img/firma-paula.jpg"  style="width: 150px;"></td></tr>';
        $cuerpo .= '<tr><td style="text-align: center; padding-top: -60px">Atte.<br>Por GRU-VIAL<br>Lic. Paula Madoz</td></tr></table>';

        // SALTO DE PAGINA
        //$texto_pdf .= '<div style="page-break-after: always;"></div>';

        $footer = '<footer style="text-align: center; font-size: 10px; font-weight: bold">';
        $footer .= '<center><img src="'.env('PATH_PUBLIC').'img/pie-presupuesto.jpg"  style="width: 100%"></center>';
        $footer .= '<p style="margin-top: -25px; font-size: 12px;">Lo invitamos a visitar nuestro nuevo sitio: <a href="http://www.gruvial.com.ar" target="_blank" style="color: #000; font-size: 15px;">www.gruvial.com.ar</a></p>';
        $footer .= '</footer>';
        $footer .= '</body></html>';

        $texto_pdf = $encabezado.$cuerpo.$footer;



        $pdf->loadHTML($texto_pdf);

        $quitar_url = env('PATH_PUBLIC');
        if ($quitar_url == '') {
            $quitar_url = 'http://localhost:1010/gruvial/public/';
        }
        

        $url_pdf_completa = str_replace($quitar_url, '', $Cotizacion_encabezado->url_pdf);
        //dd($url_pdf_completa);
        //$url_pdf_completa = 'storage/cotizaciones/cotizacion-gruvial-nro-9-953684.pdf';
        //$pdf->download($Cotizacion_encabezado->url_pdf);
        $pdf->save($url_pdf_completa);

        echo $Cotizacion_encabezado->url_pdf;        
        //return $pdf->stream();      
        
    }

    public function miCuenta()
    {   
        $user_id = Auth::user()->id;
        $User = User::find($user_id);

        return View('mi-cuenta')
        ->with('User', $User);
    }

    public function jsonDestinatariosCotizaciones()
    {
        $Destinatarios = DB::table('cotizacion_encabezados')
        ->select('cuit_o_cuil', 'razon_social', 'nombre_de_la_persona', 'celular', 'email_correo', 'localidad', 'domicilio')
        ->orderBy('razon_social')
        ->distinct()
        ->get();
        echo json_encode($Destinatarios);
    }

    public function enviarCotizacionViaEmail($cotizacion_id)
    {
        $Cotizacion_encabezado = Cotizacion_encabezado::find($cotizacion_id);
        $NotificationController = new NotificationController();
        $medio = 2;
        $user_id = 1;
        $mensaje = 'Estimado '.$Cotizacion_encabezado->nombre_de_la_persona.'. Gruvial le envia la cotizacion solicitada para '.$Cotizacion_encabezado->razon_social.'. Para poder verla haga click en el siguiente enlace: <a href="'.$Cotizacion_encabezado->url_pdf.'">'.$Cotizacion_encabezado->url_pdf.'</a>';
        $email = $Cotizacion_encabezado->email_correo;
        
        $Mensaje = $NotificationController->enviarNotificacion($medio, $user_id, $mensaje, $email);

        return $Mensaje;


    }




}
