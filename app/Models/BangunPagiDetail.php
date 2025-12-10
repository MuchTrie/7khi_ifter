<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class BangunPagiDetail extends Model
{
    protected $fillable = [
        'submission_id',
        'wake_up_time',
        'tidy_bed',
        'mandi',
        'berpakaian_rapi',
        'sarapan',
    ];

    protected $casts = [
        'wake_up_time' => 'datetime:H:i',
        'tidy_bed' => 'boolean',
        'mandi' => 'boolean',
        'berpakaian_rapi' => 'boolean',
        'sarapan' => 'boolean',
    ];

    public function submission(): BelongsTo
    {
        return $this->belongsTo(ActivitySubmission::class, 'submission_id');
    }
}
