package com.mothership.controller.message
{
	public class IntendedReceiverMessage extends Message
	{
		private var _intendedReceiver		:Object;
		
		public function IntendedReceiverMessage(messageType:MessageType, sender:Object=null, intendedReceiver:Object=null, data:Object=null, ...params)
		{
			super(messageType, sender, data, params);
			_intendedReceiver = intendedReceiver;
		}

		public function get intendedReceiver():Object
		{
			return _intendedReceiver;
		}

	}
}