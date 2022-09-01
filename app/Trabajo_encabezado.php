<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Trabajo_encabezado extends Model
{
	protected $guarded = ['id'];    

    public function firma()
    {
        return $this->belongsTo('App\Firma');
    }

    public function cliente()
    {
        return $this->belongsTo('App\Cliente');
    }

    public function user()
    {
        return $this->belongsTo('App\User');
    }

}
