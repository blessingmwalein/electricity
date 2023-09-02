<?php

namespace App\Http\Controllers;

use App\Models\Meter;
use App\Models\Token;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;
use Illuminate\Support\Facades\Hash;


class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function adminDashboard()
    {
        //count all consumers
        $consumers = User::where('user_type', 'consumer')->count();
        $meters = Meter::all()->count();

        //add total units from all tokens
        $total_units = Token::sum('units');

        $meter_reading_units = Meter::sum('current_units');

        //get recent 20 tokens with latest
        $tokens = Token::latest()->take(20)->get();


        return Inertia::render('Admin/Dashboard', [
            'consumers' => $consumers,
            'meters' => $meters,
            'total_sold_units' => $total_units,
            'total_used_units' => $total_units - $meter_reading_units,
            'tokens' => $tokens,
        ]);
    }
    public function consumerDashboard()
    {
        $user = Auth::user();
        //count all consumers
        $appliances = $user->appliances()->count();
        $tokens = $user->tokens();
        $meter = $user->meter;

        //add total units from all tokens
        $total_units = $tokens->sum('units');

        //get recent 20 tokens with latest
        $lastTokens = $tokens->latest()->take(20)->get();
        $used_units = $total_units - $meter->current_units;


        return Inertia::render('Consumer/Dashboard', [
            'appliances' => $appliances,
            'total_units' => $total_units,
            'used_units' => $used_units,
            'tokens' => $lastTokens,
            'meter' => $meter,
        ]);
    }
    public function index()
    {

        return Inertia::render('Admin/Consumers', [
            'consumers' => User::where('user_type', 'consumer')->get(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render('Admin/CreateConsumer');
    }

    public function store(Request $request)
    {

        $data = $request->validate([
            'name' => 'required',
            'email' => ['email', 'max:255', 'unique:users'],
            'address' => 'required',
            'password' => 'required',
        ]);


        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'address' => $data['address'],
            'user_type' => 'consumer', // default user type is 'user
            'password' => Hash::make($data['password']),
        ]);
        $this->createMeterForConsumer($user);

        return redirect('/admin/consumers')->with('success', 'User created successfully');
    }

    //create meter for user
    public function createMeterForConsumer(User $user)
    {
        $user->meter()->create([
            'meter_number' => $this->generateMeterNumber($user),
            'current_units' => 0,
        ]);
    }

    //create function to generate 10 digit meter number consisting of 0-9 and concatenate with user id
    public function generateMeterNumber(User $user)
    {
        $meter_number = $user->id;
        $length = 10;
        $characters = '0123456789';
        $charactersLength = strlen($characters);
        for ($i = 0; $i < $length; $i++) {
            $meter_number .= $characters[rand(0, $charactersLength - 1)];
        }
        return $meter_number;
    }

    /**
     * Store a newly created resource in storage.
     */


    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, User $user)
    {
        $request->validate([
            'name' => 'required',
            'address' => 'required',
        ]);

        $user->update([
            'name' => $request->name,
            'address' => $request->address,
        ]);

        return redirect()->back()->with('success', 'User updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $user)
    {
        $user->meter()->delete();
        $user->delete();

        return redirect()->back()->with('success', 'User deleted successfully');
    }
}
