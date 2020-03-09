<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Task;
class TestController extends Controller
{
    public function index(){
    	$task = Task::all();
    	return response()->json($task);
    }
}
