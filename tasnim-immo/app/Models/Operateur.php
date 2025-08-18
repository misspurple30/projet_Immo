<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Operateur extends Authenticatable
{
    use Notifiable;

    protected $table = 'T_Operateur';
    protected $primaryKey = 'id';

    protected $fillable = [
        'LoginOp',
        'MotPasseOp',
        // autres champs si nécessaire
    ];

    protected $hidden = [
        'MotPasseOp',
        'remember_token',
    ];
}
