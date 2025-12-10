<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Add column comments in Indonesian
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN id BIGINT UNSIGNED AUTO_INCREMENT COMMENT 'ID'");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN submission_id BIGINT UNSIGNED NOT NULL COMMENT 'ID Pengiriman'");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN wake_up_time TIME NULL COMMENT 'Jam Bangun'");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN tidy_bed TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Membereskan Tempat Tidur'");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN mandi TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Mandi'");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN berpakaian_rapi TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Berpakaian Rapi'");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN sarapan TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Sarapan'");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN created_at TIMESTAMP NULL COMMENT 'Waktu Dibuat'");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN updated_at TIMESTAMP NULL COMMENT 'Waktu Diperbarui'");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Remove comments
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN id BIGINT UNSIGNED AUTO_INCREMENT");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN submission_id BIGINT UNSIGNED NOT NULL");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN wake_up_time TIME NULL");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN tidy_bed TINYINT(1) NOT NULL DEFAULT 0");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN mandi TINYINT(1) NOT NULL DEFAULT 0");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN berpakaian_rapi TINYINT(1) NOT NULL DEFAULT 0");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN sarapan TINYINT(1) NOT NULL DEFAULT 0");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN created_at TIMESTAMP NULL");
        DB::statement("ALTER TABLE bangun_pagi_details MODIFY COLUMN updated_at TIMESTAMP NULL");
    }
};
