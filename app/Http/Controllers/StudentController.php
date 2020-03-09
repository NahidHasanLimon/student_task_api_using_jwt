<?php

namespace App\Http\Controllers;
use DB;
use JWTAuth;
use App\Task;
use App\Student;
use Illuminate\Http\Request;
class StudentController extends Controller
{
    //
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


	    public function index()
		{
		// return "ok";
		 $student = $this->user->students()->get();
		  return response()->json([
	            'success' => true,
	            'student' => $student
	        ]);
		 // return $student;
		}


	public function show($id)
		{
			$student = new Student();
		    $student =$this->user->students()->find($id);

		    if (!$student) {
		        return response()->json([
		            'success' => false,
		            'message' => 'Sorry, Student with id ' . $id . ' cannot be found.'
		        ], 400);
		    }
		    // return $student;
		     return response()->json([
	            'success' => true,
	            'student' => $student
	        ]);
		}


	   public function store(Request $request)
	{
	    $this->validate($request, [
	        'name' => 'required',
	        'email' => 'required',
	        'contact_no' => 'required',
	        'address' => 'required',
	        'fathers_name' => 'required',
	        'gender' => 'required',
	        'maritial_status' => 'required',
	        'dob' => 'required',
	        'blood_group' => 'required',
	    ]);
	    $student = new Student();
	    $lastCollection=$student->orderBy('id','desc')->get();  
	    $lastID=$lastCollection[0]->id;
	    $student->id=$lastID+1;

	    $student->name = $request->name;
	    $student->email = $request->email;
	    $student->contact_no = $request->contact_no;
	    $student->address = $request->address;
	    $student->fathers_name = $request->fathers_name;
	    $student->gender = $request->gender;
	    $student->maritial_status = $request->maritial_status;
	    $student->dob = $request->dob;
	    $student->blood_group = $request->blood_group;
	    $student->user_id=$this->user['id'];

	    if ( $student->save())
	        return response()->json([
	            'success' => true,
	            'student' => $student
	        ]);
	    else
	        return response()->json([
	            'success' => false,
	            'message' => 'Sorry, student could not be added.'
	        ], 500);
	}

	public function update(Request $request, $id)
		{
		
			// return "got it";
 // return $request;
			$student = new Student();
		    $student = $this->user->students()->find($id);
		    if (!$student) {
		        return response()->json([
		            'success' => false,
		            'message' => 'Sorry, Student with id ' . $id . ' cannot be found.'
		        ], 400);
		    }

		    // $updated = $task->fill($request->all())->save();
		    
		    $updated=$student->update($request->all());


		    if ($updated) {
		        return response()->json([
		            'success' => true
		        ]);
		    } else {
		        return response()->json([
		            'success' => false,
		            'message' => 'Sorry, Student could not be updated.'
		        ], 500);
		    }
		}



	public function destroy($id)
		{
			$student= new Student();
		    $student =  $this->user->students()->find($id);

		    if (!$student) {
		        return response()->json([
		            'success' => false,
		            'message' => 'Sorry, Student with id ' . $id . ' cannot be found.'
		        ], 400);
		    }

		    if ($student->delete()) {
		        return response()->json([
		            'success' => true
		        ]);
		    } else {
		        return response()->json([
		            'success' => false,
		            'message' => 'Student could not be deleted.'
		        ], 500);
		    }
		}
}
