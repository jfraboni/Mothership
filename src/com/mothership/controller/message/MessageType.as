package com.mothership.controller.message
{
	public class MessageType
	{
		private var _messageTypeName			:String;
		private var _messageTypeDiscription		:String;
		
		public function MessageType(messageTypeName:String, messageTypeDiscription:String = null)
		{
			_messageTypeName 			= messageTypeName;
			_messageTypeDiscription		= messageTypeDiscription;
		}

		public function get messageTypeName():String
		{
			return _messageTypeName;
		}

		public function get messageTypeDiscription():String
		{
			return _messageTypeDiscription;
		}


	}
}