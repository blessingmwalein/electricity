<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'user_type' => $this->user_type,
            'name' => $this->name,
            'email' => $this->email,
            'meter' => $this->meter,
            'appliances' => $this->appliances,
            'tokens' => $this->tokens,
            'totalUnits' => $this->tokens()->sum('units'),
            'totalCost' => $this->tokens()->sum('cost'),
            'totalUsedUnits' => $this->tokens()->sum('units') - $this->meter->current_units,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
