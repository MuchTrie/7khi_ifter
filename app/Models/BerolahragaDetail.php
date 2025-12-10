<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class BerolahragaDetail extends Model
{
    protected $fillable = [
        'submission_id',
        'berolahraga',
        'waktu_berolahraga',
    ];

    protected $casts = [
        'berolahraga' => 'boolean',
    ];

    public function submission(): BelongsTo
    {
        return $this->belongsTo(ActivitySubmission::class, 'submission_id');
    }
}
