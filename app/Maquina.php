<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Maquina extends Model
{
	protected $guarded = ['id'];    

    public function tipo_de_maquina()
    {
        return $this->belongsTo('App\Tipo_de_maquina');
    }

    public function unidad_de_trabajo()
    {
        return $this->belongsTo('App\Unidad_de_trabajo');
    }

}
