<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TablasEnPlurarl extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function tablasEnPlural() {

        $tb_plural_distintas = [
            "Rol_de_usuario" => "roles_de_usuario",
            "Opcion" => "opciones",
            "Tipo_de_maquina" => "tipos_de_maquina",
            "Unidad_de_trabajo" => "unidades_de_trabajos",
        ];
        
        return $tb_plural_distintas;

    }


}
