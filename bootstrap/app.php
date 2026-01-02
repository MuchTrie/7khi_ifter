<?php

use App\Http\Middleware\CheckRole;
use App\Http\Middleware\HandleAppearance;
use App\Http\Middleware\HandleInertiaRequests;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Http\Middleware\AddLinkHeadersForPreloadedAssets;
use Symfony\Component\HttpKernel\Exception\TooManyRequestsHttpException;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {
        $middleware->encryptCookies(except: ['appearance', 'sidebar_state']);

        $middleware->web(append: [
            HandleAppearance::class,
            HandleInertiaRequests::class,
            AddLinkHeadersForPreloadedAssets::class,
        ]);

        $middleware->alias([
            'role' => CheckRole::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        // Handle 429 Too Many Requests - redirect to login with friendly message
        $exceptions->render(function (TooManyRequestsHttpException $e, $request) {
            $retryAfter = $e->getHeaders()['Retry-After'] ?? 60;
            
            // If the request is for login page, redirect back with error
            if ($request->is('login') || $request->routeIs('login')) {
                return redirect()->route('login')->withErrors([
                    'login_error' => "Terlalu banyak percobaan login. Silakan tunggu {$retryAfter} detik sebelum mencoba lagi.",
                ]);
            }
            
            // For other pages, return a JSON response or redirect
            if ($request->expectsJson()) {
                return response()->json([
                    'message' => "Terlalu banyak permintaan. Silakan tunggu {$retryAfter} detik.",
                    'retry_after' => $retryAfter,
                ], 429);
            }
            
            return back()->withErrors([
                'error' => "Terlalu banyak permintaan. Silakan tunggu {$retryAfter} detik.",
            ]);
        });
    })->create();

