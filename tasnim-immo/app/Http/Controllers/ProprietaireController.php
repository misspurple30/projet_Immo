<?php

namespace App\Http\Controllers;

use App\Models\Proprietaire;
use Illuminate\Http\Request;

class ProprietaireController extends Controller
{
    public function index()
    {
        $proprietaires = Proprietaire::withCount('proprietes')
            ->orderBy('Nom')
            ->paginate(20);
            
        return view('proprietaires.index', compact('proprietaires'));
    }

    public function create()
    {
        return view('proprietaires.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'Civilite' => 'required|max:5',
            'Nom' => 'required|max:25',
            'Prenoms' => 'required|max:60',
            'Tel1' => 'required|max:20',
        ]);

        Proprietaire::create($validated);

        return redirect()->route('proprietaires.index')
            ->with('success', 'Propriétaire créé avec succès');
    }

    public function show(Proprietaire $proprietaire)
    {
        return view('proprietaires.show', compact('proprietaire'));
    }

    // ... autres méthodes (edit, update, destroy)
}