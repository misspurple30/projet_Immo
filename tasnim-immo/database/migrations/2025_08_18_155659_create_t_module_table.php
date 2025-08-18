<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('T_Module', function (Blueprint $table) {
            $table->id(); // id auto-incrémenté
            $table->string('Nom'); // nom du module
            $table->integer('NumOrdre'); // ordre d'affichage
            $table->string('Description')->nullable(); // optionnel
            $table->timestamps(); // created_at et updated_at
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('T_Module');
    }
};
