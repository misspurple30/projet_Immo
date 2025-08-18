<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Propriete extends Model
{
    protected $table = 'Tim_Propriete';
    protected $primaryKey = 'CodePropriete';
    public $timestamps = false;

    protected $fillable = [
        'NomPropriete', 'CodeTypePropriete', 'Localisation', 'Quartier'
    ];

    public function proprietaire()
    {
        return $this->belongsTo(Proprietaire::class, 'CodeProprio');
    }

    public function locations()
    {
        return $this->hasMany(Location::class, 'CodePropriete');
    }
}