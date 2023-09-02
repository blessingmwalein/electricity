<?php

namespace App\Http\Responses;

use Laravel\Fortify\Contracts\LoginResponse as LoginResponseContract;
use Inertia\Inertia;

class LoginResponse implements LoginResponseContract
{
    /**
     * @param  $request
     * @return mixed
     */
    public function toResponse($request)
    {

        if ($request->user()->user_type == 'consumer') {
            return redirect()->to('/consumer/dashboard');
        } else if ($request->user()->user_type == 'admin') {
            return redirect()->to('/admin/dashboard');
        } else {
            return redirect()->to('/consumer/dashboard');
        }
    }
}
