<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserApplianceResource;
use App\Models\Appliance;
use App\Models\UserAppliance;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class ApplianceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Admin/Appliances', [
            'appliances' => Appliance::all(),
        ]);
    }

    public function consumerAppliances()
    {

        // return  UserApplianceResource::collection(auth()->user()->appliances);
        return Inertia::render('Consumer/Appliances', [
            'appliances' => UserApplianceResource::collection(auth()->user()->appliances),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render('Admin/CreateAppliance');
    }
    public function createConsumer()
    {
        return Inertia::render('Consumer/CreateAppliance', [
            'appliances' => Appliance::all(),

        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required',
        ]);

        $appliance = Appliance::create([
            'name' => $data['name'],
        ]);

        return redirect('/admin/appliances')->with('success', 'Appliance created successfully');
    }

    public function storeConsumerAppliance(Request $request)
    {
        $user = Auth::user();
        $data = $request->validate([
            'appliance_id' => 'required',
            'power_rating' => 'required',
        ]);

        $appliance = $user->appliances()->create([
            'appliance_id' => $data['appliance_id'],
            'power_rating' => $data['power_rating'],
        ]);

        return redirect('/consumer/appliances')->with('success', 'Appliance created successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(Appliance $appliance)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Appliance $appliance)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Appliance $appliance)
    {
        $data = $request->validate([
            'name' => 'required',
        ]);
        $appliance->update([
            'name' => $data['name'],
        ]);
        return redirect('/admin/appliances')->with('success', 'Appliance updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Appliance $appliance)
    {
        $appliance->userAppliances()->delete();
        $appliance->delete();
        return redirect('/admin/appliances')->with('success', 'Appliance deleted successfully');
    }
}
