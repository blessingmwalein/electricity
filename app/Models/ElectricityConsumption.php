<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ElectricityConsumption extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_appliance_id',
        'units_used',
        'user_id',
    ];

    protected $with = ['userAppliance'];

    function userAppliance()
    {
        return $this->belongsTo(UserAppliance::class);
    }


    protected $casts = [
        'created_at' => 'datetime:Y-m-d',
        'updated_at' => 'datetime:Y-m-d',
    ];
}
