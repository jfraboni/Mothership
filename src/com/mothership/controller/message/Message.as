package com.mothership.controller.message
{
	public class Message
	{
		private var _messageType	:MessageType;
		private var _data			:Object;
		private var _params			:Array;
		private var _sender			:Object;
		private var _timeCreated	:Date;
		private var _timeSent		:Date;
		
		
		public function Message(messageType:MessageType, sender:Object = null, data:Object = null, ...params)
		{
			_messageType	= messageType;
			_data			= data;
			_params			= params;
			_sender 		= sender;
			_timeCreated	= new Date();
		}

		public function get messageType():MessageType
		{
			return _messageType;
		}

		public function get data():Object
		{
			return _data;
		}

		public function get params():Array
		{
			return _params;
		}
		
		public function get sender():Object
		{
			return _sender;
		}

		public function get timeCreated():Date
		{
			return _timeCreated;
		}

		public function get timeSent():Date
		{
			return _timeSent;
		}

		public function set timeSent(value:Date):void
		{
			// ALLOW ONLY ONCE //
			if (!_timeSent)
				_timeSent = value;
		}
		
		public function toString():String
		{
			var str:String = 'MESSAGE: ' + _messageType.messageTypeName + 
				', sent by ' + _sender + 
				', created at ' + _timeCreated.toString();
			
			str += (_timeSent) ? ', and sent at ' + _timeSent.toString() + '.' : '. Time of send not recorded.';
			
			return str;
		}

	}
}