<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Deal;
use App\Models\PipelineStage;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        $userId = auth()->id();

        $totalWon = Deal::where('user_id', $userId)
            ->where('status', 'won')
            ->sum('amount');

        $openDealsCount = Deal::where('user_id', $userId)
            ->where('status', 'open')
            ->count();

        $dealsByStage = PipelineStage::withCount(['deals' => function($query) use ($userId) {
            $query->where('user_id', $userId);
        }])->get()->map(function($stage) {
            return [
                'name' => $stage->name,
                'count' => $stage->deals_count
            ];
        });

        $monthlySales = Deal::where('user_id', $userId)
            ->where('status', 'won')
            ->where('expected_close_date', '>=', now()->subMonths(6))
            ->select(
                DB::raw('DATE_FORMAT(expected_close_date, "%Y-%m") as month'),
                DB::raw('SUM(amount) as total')
            )
            ->groupBy('month')
            ->orderBy('month')
            ->get();

        return Inertia::render('Dashboard', [
            'kpis' => [
                'totalWon' => $totalWon,
                'openDeals' => $openDealsCount,
                'winRate' => 0
            ],
            'charts' => [
                'byStage' => $dealsByStage,
                'monthlySales' => $monthlySales
            ]
        ]);
    }
}
