<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
	protected $table = 'students';
	
    //
    protected $fillable = [
        'name', 'email', 'contact_no','address','contact_no','fathers_name','gender','maritial_status','dob','blood_group','user_id',
    ];


    protected $guarded = [];
}
