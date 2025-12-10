<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('bangun_pagi_details', function (Blueprint $table) {
            // Rename columns to match the correct schema
            $table->renameColumn('mandi', 'open_window');
            $table->renameColumn('berpakaian_rapi', 'morning_prayer');
            $table->renameColumn('sarapan', 'tidy_room');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('bangun_pagi_details', function (Blueprint $table) {
            // Revert column names
            $table->renameColumn('open_window', 'mandi');
            $table->renameColumn('morning_prayer', 'berpakaian_rapi');
            $table->renameColumn('tidy_room', 'sarapan');
        });
    }
};
