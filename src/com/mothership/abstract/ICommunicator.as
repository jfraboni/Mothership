package com.mothership.abstract
{
	import com.mothership.controller.message.Message;
	import com.mothership.controller.message.MessageType;
	import com.mothership.utlil.Identification;

	public interface ICommunicator extends ISender, IReceiver
	{
		function get identification():Identification;		
	}
}