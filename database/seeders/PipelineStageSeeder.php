<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PipelineStageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
{
    $stages = ['Lead', 'Contactado', 'Propuesta', 'Negociación', 'Ganado', 'Perdido'];
    
    foreach ($stages as $index => $stage) {
        \App\Models\PipelineStage::create([
            'name' => $stage, 
            'position' => $index + 1
        ]);
    }
}
}
