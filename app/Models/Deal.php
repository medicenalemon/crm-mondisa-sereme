<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Deal extends Model
{
    use HasFactory;
    protected $guarded = [];
    
    // Casteamos la fecha para que Laravel la maneje como objeto Carbon
    protected $casts = ['expected_close_date' => 'date'];

    public function company() { return $this->belongsTo(Company::class); }
    public function contact() { return $this->belongsTo(Contact::class); }
    public function pipelineStage() { return $this->belongsTo(PipelineStage::class); }
    public function user() { return $this->belongsTo(User::class); }
}
