<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Inertia\Inertia;
use Inertia\Response;

class DashboardController extends Controller
{
    /**
     * Display the admin dashboard.
     */
    public function index(): Response
    {
        $users = User::orderBy('created_at', 'desc')->get()->map(function ($user) {
            return [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'role' => $user->role,
                'createdAt' => $user->created_at->format('Y-m-d'),
            ];
        });

        // Hitung statistik per role
        $userStats = [
            'total' => $users->count(),
            'siswa' => $users->where('role', User::ROLE_SISWA)->count(),
            'orangtua' => $users->where('role', User::ROLE_ORANGTUA)->count(),
            'guru' => $users->where('role', User::ROLE_GURU)->count(),
            'admin' => $users->where('role', User::ROLE_ADMIN)->count(),
        ];

        return Inertia::render('admin/dashboard', [
            'users' => $users,
            'userStats' => $userStats,
        ]);
    }
}
