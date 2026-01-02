<?php

namespace App\Http\Controllers;

use App\Models\Deal;
use App\Models\Company;
use App\Models\PipelineStage;
use Inertia\Inertia;
use Illuminate\Http\Request;

class DealController extends Controller
{
    public function index()
    {
        $deals = Deal::with(['company', 'pipelineStage'])
            ->where('user_id', auth()->id()) // Solo los míos
            ->orderBy('created_at', 'desc')
            ->get();

        $stages = PipelineStage::orderBy('position')->get();

        $companies = Company::where('user_id', auth()->id())->orderBy('name')->get();

        return Inertia::render('Deals/Index', [
            'deals' => $deals,
            'stages' => $stages,
            'companies' => $companies // <--- La enviamos a Vue
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'amount' => 'required|numeric|min:0',
            'company_id' => 'required|exists:companies,id',
            'expected_close_date' => 'required|date',
        ]);

        $request->user()->deals()->create([
            ...$validated,
            'pipeline_stage_id' => 1,
            'status' => 'open'
        ]);

        return redirect()->back();
    }

    public function move(Request $request, Deal $deal)
    {
        $validated = $request->validate([
            'pipeline_stage_id' => 'required|exists:pipeline_stages,id'
        ]);

        $newStage = PipelineStage::findOrFail($validated['pipeline_stage_id']);

        $deal->pipeline_stage_id = $newStage->id;

        if ($newStage->name === 'Ganado') {
            $deal->status = 'won';
            $deal->expected_close_date = now();
        } elseif ($newStage->name === 'Perdido') {
            $deal->status = 'lost';
        } else {
            $deal->status = 'open';
        }

        $deal->save();

        return back();
    }

    public function update(Request $request, Deal $deal)
    {
        // Validamos que el usuario sea dueño del deal
        if ($deal->user_id !== auth()->id()) {
            abort(403);
        }

        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'amount' => 'required|numeric|min:0',
            'company_id' => 'required|exists:companies,id',
            'expected_close_date' => 'required|date',
        ]);

        $deal->update($validated);

        return redirect()->back();
    }

    public function destroy(Deal $deal)
    {
        if ($deal->user_id !== auth()->id()) {
            abort(403);
        }

        $deal->delete();

        return redirect()->back();
    }
}
