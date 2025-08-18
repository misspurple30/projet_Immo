<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    // Dans le fichier de migration
public function up()
{
    Schema::table('T_Operateur', function (Blueprint $table) {
        $table->rememberToken()->after('MotPasseOp');
    });
}
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
    
};
