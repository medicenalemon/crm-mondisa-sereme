<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PipelineStage extends Model
{
    protected $guarded = [];
    public function deals() { return $this->hasMany(Deal::class); }
}
