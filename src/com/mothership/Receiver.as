package com.mothership
{
	import com.mothership.abstract.IReceiver;
	import com.mothership.controller.Controller;
	import com.mothership.controller.message.Message;
	import com.mothership.controller.message.MessageType;
	import com.mothership.util.Identification;
	
	public class Receiver extends Mother implements IReceiver
	{
		public function Receiver(identification:Identification = null)
		{
			super(identification);
		}
		
		public function registerOnMessageHandler(messageType:MessageType, onMessageHandler:Function):MessageType
		{	
			return controller.registerOnMessageHandler(messageType, onMessageHandler);
		}
		
		public function removeOnMessageHandler(messageType:MessageType, onMessageHandler:Function):MessageType
		{
			return controller.removeOnMessageHandler(messageType, onMessageHandler);
		}
		
		public function registerOnMessageCommand(messageType:MessageType, onMessageCommandClass:Class):MessageType
		{
			return controller.registerOnMessageCommand(messageType, onMessageCommandClass);
		}
		
		public function removeOnMessageCommand(messageType:MessageType, onMessageCommandClass:Class):MessageType
		{
			return controller.removeOnMessageCommand(messageType, onMessageCommandClass);
		}
		
		public function sendMessage(message:Message):void
		{
			controller.sendMessage(message);
		}
		
		/**
		 * METHOD: public function onMessage
		 * 
		 * DESCRIPTION: Can be overridden and implemented in a concrete IReceiver to handle messages of any type. 
		 * Any Object with a reference to the IReceiver can assign a MessageType to be passed to the onMessage 
		 * method of the IReceiver, however, the concrete IReceiver should be implemented to handle the MessageType.  
		 * 
		 * @param message:Message
		 */
		public function onMessage(message:Message):void
		{
		}
	}
}