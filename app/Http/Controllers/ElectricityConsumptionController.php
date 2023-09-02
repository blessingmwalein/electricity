<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Models\ElectricityConsumption;
use App\Models\User;
use App\Models\UserAppliance;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ElectricityConsumptionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $userAppliances = UserAppliance::all();

        //loop through each user appliance
        foreach ($userAppliances as $userAppliance) {
            //get the power rating of the appliance
            $powerRating = $userAppliance->power_rating;

            //get the current units of the meter
            $user = $userAppliance->user;

            //get the current units of the meter
            $currentUnits = $user->meter->current_units;


            if ($currentUnits > $powerRating) {
                //create a new or update existing electricity consumption record
                $consumption = ElectricityConsumption::where('user_appliance_id', $userAppliance->id)->first();
                if ($consumption) {
                    $consumption->update([
                        'units_used' => $consumption->units_used += $powerRating,
                    ]);
                } else {
                    $userAppliance->consumption()->create([
                        'units_used' => $powerRating,
                        'user_id' => $user->id,
                    ]);
                }
                $user->meter->update([
                    'current_units' => $currentUnits -= $powerRating,
                ]);
            }
            //create a new electricity consumption record
        }

        return redirect()->back()->with('success', 'Calculated');
    }

    /**
     * Display the specified resource.
     */
    public function show(ElectricityConsumption $electricityConsumption)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ElectricityConsumption $electricityConsumption)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ElectricityConsumption $electricityConsumption)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ElectricityConsumption $electricityConsumption)
    {
        //
    }

    public function admin()
    {

        //get electricity consumption records sort with the highest units used
        $consumptions = ElectricityConsumption::orderBy('units_used', 'desc')->take(20)->get();

        return Inertia::render('Admin/Consumption', [
            'consumers' => UserResource::collection(User::where('user_type', 'consumer')->get()),
            'consumptions' => $consumptions,
            'totalWatts' => $consumptions->sum('units_used'),
        ]);
    }
}
