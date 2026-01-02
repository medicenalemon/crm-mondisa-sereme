<?php

namespace App\Http\Controllers;

    use App\Models\Company;
    use Illuminate\Http\Request;
    use Inertia\Inertia;
    use App\Models\Deal;

class CompanyController extends Controller
{
    public function index(Request $request)
    {
        $companies = Company::where('user_id', auth()->id())
            ->withCount('deals')
            ->orderBy('name')
            ->get();

        return Inertia::render('Companies/Index', [
            'companies' => $companies
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'nullable|email',
            'phone' => 'nullable|string|max:20',
            'domain' => 'nullable|string|max:255',
            'address' => 'nullable|string|max:255',
        ]);

        $request->user()->companies()->create($validated);

        return redirect()->back();
    }

    public function update(Request $request, Company $company)
    {
        if ($company->user_id !== auth()->id()) abort(403);

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'nullable|email',
            'phone' => 'nullable|string|max:20',
            'domain' => 'nullable|string|max:255',
            'address' => 'nullable|string|max:255',
        ]);

        $company->update($validated);

        return redirect()->back();
    }

    public function destroy(Company $company)
    {
        if ($company->user_id !== auth()->id()) abort(403);

        $company->delete();

        return redirect()->back();
    }

    public function show(Company $company)
    {
        if ($company->user_id !== auth()->id()) abort(403);

        $company->load(['deals' => function ($query) {
            $query->orderBy('created_at', 'desc')->with('pipelineStage');
        }]);

        $totalWon = $company->deals->where('status', 'won')->sum('amount');
        $openDealsCount = $company->deals->where('status', 'open')->count();

        return Inertia::render('Companies/Show', [
            'company' => $company,
            'stats' => [
                'total_won' => $totalWon,
                'open_deals' => $openDealsCount
            ]
        ]);
    }
}

