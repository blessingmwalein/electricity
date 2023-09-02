<?php

namespace App\Console\Commands;

use App\Models\UserAppliance;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class UpdateElectricityConsumption extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:update-electricity-consumption';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        Log::info('Your job is running.');
        //get all user appliances
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
                $userAppliance->consumption()->create([
                    'units_used' => $userAppliance += $powerRating,
                    'user_id' => $user->id,
                ]);

                $user->meter->update([
                    'current_units' => $currentUnits -= $powerRating,
                ]);
            }
            //create a new electricity consumption record
        }
    }
}
