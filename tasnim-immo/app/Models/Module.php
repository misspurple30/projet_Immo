<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Module extends Model
{
    protected $table = 'T_Module'; // Correspond à votre table en base de données
    protected $primaryKey = 'CodeModule';
    public $timestamps = false;

    protected $fillable = [
        'NumOrdre', 'NomModule', 'DescModule', 'ImgModule'
    ];
}

