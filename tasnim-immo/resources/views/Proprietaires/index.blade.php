@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Gestion des Propriétaires</h1>
    
    <div class="mb-4">
        <a href="{{ route('proprietaires.create') }}" class="btn btn-primary">
            Ajouter un propriétaire
        </a>
    </div>

    <div class="card">
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Téléphone</th>
                        <th>Propriétés</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($proprietaires as $proprietaire)
                    <tr>
                        <td>{{ $proprietaire->Civilite }} {{ $proprietaire->Nom }} {{ $proprietaire->Prenoms }}</td>
                        <td>{{ $proprietaire->Tel1 }}</td>
                        <td>{{ $proprietaire->proprietes_count }}</td>
                        <td>
                            <a href="{{ route('proprietaires.show', $proprietaire) }}" class="btn btn-sm btn-info">
                                Voir
                            </a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            
            {{ $proprietaires->links() }}
        </div>
    </div>
</div>
@endsection