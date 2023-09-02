<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserAppliance extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'appliance_id',
        'power_rating',
    ];

    protected $with = ['appliance', 'user'];
    function appliance()
    {
        return $this->belongsTo(Appliance::class);
    }

    public function consumption()
    {
        return $this->hasOne(ElectricityConsumption::class, 'user_appliance_id', 'id');
    }

    public function user() {
        return $this->belongsTo(User::class);
    }

    protected $casts = [
        'created_at' => 'datetime:Y-m-d',
        'updated_at' => 'datetime:Y-m-d',
    ];

    //create get units used attribute
    public function getUnitsUsedAttribute()
    {
        $consumption = ElectricityConsumption::where('user_appliance_id', $this->id)->first();
        return $consumption->units_used ?? 0;
    }
}
