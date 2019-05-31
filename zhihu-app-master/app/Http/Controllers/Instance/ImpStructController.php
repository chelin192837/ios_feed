<?php

namespace App\Http\Controllers\Instance;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ImpStructController extends Controller
{

    public function answers()
    {
        return view('answers.answers');
    }

}
