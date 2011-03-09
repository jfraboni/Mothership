package com.mothership
{
	import com.mothership.abstract.IIdentifiable;
	import com.mothership.controller.Controller;
	import com.mothership.util.Identification;
	
	import flash.errors.IllegalOperationError;
	
	/**
	 * CLASS: Mother implements IIdentifiable
	 * <p>
	 * DESCRIPTION: The basic Object of the Mothership framework, binding an IIdentifiable Object to the Controller.
	 * </p>
	 * 
	 */	
	public class Mother implements IIdentifiable
	{
		private var _identification				:Identification;
		private var _controller					:Controller;
		
		
		public function Mother(identification:Identification)
		{
			_identification 	= identification;
			_controller 		= Controller.getInstance();
		}
		
		public function get identification():Identification
		{
			return _identification;
		}
		
		public function set identification(identification:Identification):void
		{
			if (!_identification)
			{
				_identification = identification;
			} else {
				throw new IllegalOperationError('Identification already set! The Identification Object of ' + this + ' can only be set once!')
			}
		}

		public function get controller():Controller
		{
			return _controller;
		}

	}
}