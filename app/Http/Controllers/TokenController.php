<?php

namespace App\Http\Controllers;

use App\Models\Token;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;

class TokenController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        //get all token sort with latest

        $tokens = Token::latest()->get();

        return Inertia::render('Admin/Tokens', [
            'tokens' => $tokens,
        ]);
    }
    public function consumerTokens()
    {

        //get all token sort with latest


        $user = auth()->user();
        //get all token sort with latest

        $tokens = $user->tokens()->latest()->get();

        return Inertia::render('Consumer/Tokens', [
            'tokens' => $tokens,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render('Admin/CreateToken', [
            'users' => User::where('user_type', 'consumer')->get()
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate(
            [
                'user_id' => 'required',
                'cost' => 'required',
                'units' => 'required',
            ]
        );
        $user = User::find($data['user_id']);

        $token = Token::create([
            'user_id' => $data['user_id'],
            'cost' => $data['cost'],
            'units' => $data['units'],
            'status' => 'used',
            'token' => $this->generateToken($user),
        ]);
        $user->meter->update([
            'current_units' => $user->meter->current_units + $data['units'],
        ]);

        return redirect('/admin/tokens')->with('success', 'Token created successfully');
    }

    //create function to generate 16 digit token for user
    public function generateToken(User $user)
    {
        $token = $user->id;
        $length = 16;
        $characters = '0123456789';
        $charactersLength = strlen($characters);
        for ($i = 0; $i < $length; $i++) {
            $token .= $characters[rand(0, $charactersLength - 1)];
        }
        return $token;
    }

    /**
     * Display the specified resource.
     */
    public function show(Token $token)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Token $token)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Token $token)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Token $token)
    {
        //
    }
}
