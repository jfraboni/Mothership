package com.mothership.utlil
{
	import flash.errors.IllegalOperationError;

	public class Identification
	{
		private var _id				:String;
		private var _name			:String;
		private var _description	:String;
		
		
		public function Identification(id:String = null, name:String = null, description:String = null)
		{
			_id				= id;
			_name			= name;
			_description	= description;
		}
		
		/**
		 * public function set id
		 * 
		 * notes: allow setting only once.
		 * 
		 * @param value:String
		 */
		public function set id(value:String):void
		{
			if (!_id)
				_id = value;
			else
				throw new IllegalOperationError('The id property of the Identification object can only be set once!');
		}
		
		public function get id():String
		{
			return _id;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		/**
		 * public function set name
		 * 
		 * notes: allow setting only once.
		 * 
		 * @param value:String
		 */
		public function set name(value:String):void
		{
			if (!_name)
				_name = value;
			else
				throw new IllegalOperationError('The name property of the Identification object can only be set once!');
		}

		public function get description():String
		{
			return _description;
		}
		
		/**
		 * public function set description
		 * 
		 * notes: allow setting only once.
		 * 
		 * @param value:String
		 */
		public function set description(value:String):void
		{
			if (!_description)
				_description = value;
			else
				throw new IllegalOperationError('The description property of the Identification object can only be set once!');
		}
		

	}
}