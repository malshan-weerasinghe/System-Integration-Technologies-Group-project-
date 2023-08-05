<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Str;
use Laravel\Jetstream\Features;
use Laravel\Jetstream\Http\Livewire\ApiTokenManager;
use Livewire\Livewire;
use Tests\TestCase;

class ApiTokenPermissionsTest extends TestCase
{
    use RefreshDatabase;

    public function test_api_token_permissions_can_be_updated(): void
    {
        if (! Features::hasApiFeatures()) {
            $this->markTestSkipped('API support is not enabled.');

            return;
        }

        $this->actingAs($user = User::factory()->withPersonalTeam()->create());

        $token = $user->tokens()->create([
            'name' => 'Test Token',
            'token' => Str::random(40),
            'abilities' => ['create', 'read'],
        ]);

    }
}
