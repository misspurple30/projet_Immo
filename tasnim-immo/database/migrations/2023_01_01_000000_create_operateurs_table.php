<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOperateursTable extends Migration
{
    public function up()
    {
        Schema::create('operateurs', function (Blueprint $table) {
            $table->string('LoginOp', 10)->primary();
            $table->string('MotPasseOp');
            $table->string('NomOperateur');
            $table->rememberToken();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('operateurs');
    }
}