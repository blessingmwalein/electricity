<?php

namespace App\Actions\Fortify;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Laravel\Fortify\Contracts\CreatesNewUsers;
use Laravel\Jetstream\Jetstream;

class CreateNewUser implements CreatesNewUsers
{
    use PasswordValidationRules;

    /**
     * Validate and create a newly registered user.
     *
     * @param  array<string, string>  $input
     */
    public function create(array $input): User
    {
        Validator::make($input, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'address' => ['required'],
            'password' => $this->passwordRules(),
            'terms' => Jetstream::hasTermsAndPrivacyPolicyFeature() ? ['accepted', 'required'] : '',
        ])->validate();


        $user = User::create([
            'name' => $input['name'],
            'email' => $input['email'],
            'address' => $input['address'],
            'user_type' => 'consumer', // default user type is 'user
            'password' => Hash::make($input['password']),
        ]);
        $this->createMeterForConsumer($user);

        return $user;
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
}
