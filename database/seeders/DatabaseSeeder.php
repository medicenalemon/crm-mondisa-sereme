<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call(PipelineStageSeeder::class);
        $stages = \App\Models\PipelineStage::all();

        $user = \App\Models\User::factory()->create([
            'name' => 'MONDISA | La Casa de la Tecnología',
            'email' => 'lacasadelatecnologia@protonmail.com',
            'password' => bcrypt('siempremas'),
        ]);

        \App\Models\Company::factory(10)
            ->for($user) 
            ->has(\App\Models\Contact::factory()->count(2)) 
            ->create()
            ->each(function ($company) use ($user, $stages) {
                \App\Models\Deal::factory(rand(1, 3))->create([
                    'company_id' => $company->id,
                    'user_id' => $user->id,
                    'contact_id' => $company->contacts->first()->id,
                    'pipeline_stage_id' => $stages->random()->id, 
                ]);
            });
    }
}
