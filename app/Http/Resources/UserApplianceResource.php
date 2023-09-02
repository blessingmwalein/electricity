<?php

namespace App\Http\Resources;

use App\Models\ElectricityConsumption;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserApplianceResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'appliance' => $this->appliance,
            'user' => $this->user,
            'consumption' => ElectricityConsumption::where('user_appliance_id', $this->id)->first(),
            'power_rating' => $this->power_rating,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
