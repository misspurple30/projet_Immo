<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Proprietaire extends Model
{
    protected $table = 'Tim_Proprietaire';
    protected $primaryKey = 'CodeProprio';
    public $timestamps = false;

    protected $fillable = [
        'Civilite', 'Nom', 'Prenoms', 'Tel1', 'Tel2', 'Email', 'AdresseComp'
    ];

    public function proprietes()
    {
        return $this->hasMany(Propriete::class, 'CodeProprio');
    }
}