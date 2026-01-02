<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Deal>
 */
class DealFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
    return [
        'title' => 'Negocio: ' . fake()->words(3, true),
        'amount' => fake()->randomFloat(2, 1000, 50000), 
        'expected_close_date' => fake()->dateTimeBetween('now', '+3 months'),
        'status' => 'open',
        'company_id' => \App\Models\Company::factory(),
        'pipeline_stage_id' => 1, 
        'user_id' => \App\Models\User::factory(),
    ];
    }
}
