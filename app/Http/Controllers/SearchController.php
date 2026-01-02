<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Company;
use App\Models\Deal;

class SearchController extends Controller
{
    public function __invoke(Request $request)
    {
        $query = $request->input('q');

        if (!$query) {
            return Inertia::render('Search/Results', [
                'companies' => [],
                'deals' => [],
                'query' => ''
            ]);
        }

        $userId = auth()->id();

        $companies = Company::where('user_id', $userId)
            ->where(function($q) use ($query) {
                $q->where('name', 'like', "%{$query}%")
                    ->orWhere('email', 'like', "%{$query}%")
                    ->orWhere('domain', 'like', "%{$query}%");
            })
            ->limit(10)
            ->get();

        $deals = Deal::where('user_id', $userId)
            ->where('title', 'like', "%{$query}%")
            ->with('company')
            ->limit(10)
            ->get();

        return Inertia::render('Search/Results', [
            'companies' => $companies,
            'deals' => $deals,
            'query' => $query
        ]);
    }
}
