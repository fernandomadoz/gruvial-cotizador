<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cotizacion_linea extends Model
{
	protected $guarded = ['id'];    

    public function cotizacion_encabezado()
    {
        return $this->belongsTo('App\Cotizacion_encabezado');
    }

    public function maquina()
    {
        return $this->belongsTo('App\Maquina');
    }

}
