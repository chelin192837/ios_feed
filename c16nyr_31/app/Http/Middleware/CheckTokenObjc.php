<?php

namespace App\Http\Middleware;

use Closure;

class CheckTokenObjc
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        if ($request->input('token') != '_objc_')
        {
            return redirect()->to('http://www.baidu.com');
        }

        return $next($request);
    }
}
