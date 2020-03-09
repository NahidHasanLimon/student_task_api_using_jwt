<?php

namespace App\Http\Controllers;

use JWTAuth;
use App\Task;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    /**
     * @var
     */
    protected $user;

    /**
     * TaskController constructor.
     */
	 public function __construct()
	    {
	        $this->user = JWTAuth::parseToken()->authenticate();
	    }


 public function task_for_all_user()
		{
			$tasks_=  new Task();
		    $tasks =$tasks_->get(['title', 'description'])->toArray();

		    return $tasks;
		}



	  public function index()
		{
		    $tasks = $this->user->tasks()->get(['title', 'description'])->toArray();

		    return $tasks;
		}

	public function show($id)
		{
		    $task = $this->user->tasks()->find($id);

		    if (!$task) {
		        return response()->json([
		            'success' => false,
		            'message' => 'Sorry, task with id ' . $id . ' cannot be found.'
		        ], 400);
		    }

		    return $task;
		}




		public function store(Request $request)
	{
	    $this->validate($request, [
	        'title' => 'required',
	        'description' => 'required',
	    ]);

	    $task = new Task();
	    $task->title = $request->title;
	    $task->description = $request->description;

	    if ($this->user->tasks()->save($task))
	        return response()->json([
	            'success' => true,
	            'task' => $task
	        ]);
	    else
	        return response()->json([
	            'success' => false,
	            'message' => 'Sorry, task could not be added.'
	        ], 500);
	}


	public function update(Request $request, $id)
		{
			
			 
		    $task = $this->user->tasks()->find($id);
 // return $request;
		    if (!$task) {
		        return response()->json([
		            'success' => false,
		            'message' => 'Sorry, task with id ' . $id . ' cannot be found.'
		        ], 400);
		    }

		    // $updated = $task->fill($request->all())->save();
		    
		    $updated=$task->update($request->all());


		    if ($updated) {
		        return response()->json([
		            'success' => true
		        ]);
		    } else {
		        return response()->json([
		            'success' => false,
		            'message' => 'Sorry, task could not be updated.'
		        ], 500);
		    }
		}


		public function destroy($id)
		{
		    $task = $this->user->tasks()->find($id);

		    if (!$task) {
		        return response()->json([
		            'success' => false,
		            'message' => 'Sorry, task with id ' . $id . ' cannot be found.'
		        ], 400);
		    }

		    if ($task->delete()) {
		        return response()->json([
		            'success' => true
		        ]);
		    } else {
		        return response()->json([
		            'success' => false,
		            'message' => 'Task could not be deleted.'
		        ], 500);
		    }
		}


}