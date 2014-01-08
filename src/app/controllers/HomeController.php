<?php

class HomeController extends BaseController
{
	public function index()
	{
		// Do nothing
	}

	public function fail()
	{
		$drop = array(
			'name' 			  => Input::get('name'),
			'event' 		  => Input::get('event'),
			'recipient' 	  => Input::get('recipient'),
			'domain' 		  => Input::get('domain'),
			'message_headers' => Input::get('message-headers'),
			'reason' 		  => Input::get('reason'),
			'code' 			  => Input::get('code'),
			'description'     => Input::get('description'),
			'timestamp' 	  => Input::get('timestamp'),
			'token' 		  => Input::get('token'),
			'signature' 	  => Input::get('signature')
		);

		$fail = new Fail;
		foreach ($drop as $field => $value) {
			$fail->$field = $value;
		}

		$fail->save();
	}
}