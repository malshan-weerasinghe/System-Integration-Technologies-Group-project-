<?php

namespace App\Http\Controllers;

use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Str;

class ApiUserController extends Controller
{
    public function verify($token)
{
    $user = User::where('address', $token)->first();

    if (!$user) {
        return response()->json(['message' => 'Invalid token'], 400);
    }

    $user->status = 1;
    $user->save();

    $data = [
        'title' => 'Email Verification',
        'message' => 'You can now login to shopping-Hub app or website.',
        'name' => $user->name,
    ];

    return view('verify', $data);
}


public function requestToken(Request $request)
{
    $request->validate([
        'email' => 'required|email',
        'password' => 'required',
        'device_name' => 'required',
    ]);

    $user = User::where('email', $request->email)->first();

    if (! $user || ! Hash::check($request->password, $user->password)) {
        throw ValidationException::withMessages([
            'email' => ['The provided credentials are incorrect.'],
        ]);
    }

    $token = $user->createToken($request->device_name)->plainTextToken;

    return response()->json([
        'token' => $token,
        'user' => $user,
    ]);
}


public function revokeToken(Request $request): string
{
    $user = $request->user();

    if ($user) {
        $user->currentAccessToken()->delete();
        return response()->json(['message' => 'Token revoked']);
    } else {
        return response()->json(['message' => 'No authenticated user'], 401);
    }
}


    public function revokeAllTokens(Request $request): string
    {
        $request->user()->tokens()->delete();
    
        return response()->json(['message' => 'Tokens revoked']);
    }

    public function register(Request $request): JsonResponse
    {
    $request->validate([
        'name' => 'required',
        'email' => 'required|email|unique:users,email',
        'password' => 'required',
        'ConfirmPassword' => 'required|same:password',
        'phone' => 'required|string|min:10|max:10|regex:/^\d+$/',
        'address' => 'required|string|max:255',
        'dob' => [
            'required',
            'date',
            function ($attribute, $value, $fail) {
                if (!strtotime($value)) {
                    $fail('Invalid date format');
                } else {
                    $dob = Carbon::parse($value);
                    $now = Carbon::now();
                    if ($dob->diffInYears($now) <= 18) {
                        $fail('You must be older than 18 years old to register.');
                    }
                }
            },
        ],
        'device_name' => 'required',
    ]);

    $user = User::where('email', $request->email)->first();

    if ($user) {
        return response()->json(['message' => 'You are already a registered user'], 409);
    }

    $newUser = User::create([
        'name' => $request['name'],
        'email' => $request['email'],
        'role_id'=> 1,
        'password' => Hash::make($request['password']),
        'phone' => $request['phone'],
        'address' => uniqid('', true), 
        'dob' => $request['dob'],
        'status' => 0,
        'token' => uniqid('', true), 
    ]);

    return response()->json(['message' => 'Registration successful', 'user' => $newUser, 'token' => $newUser->address], 200);

}


}
