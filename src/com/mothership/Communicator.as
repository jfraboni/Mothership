package com.mothership
{
	import com.mothership.abstract.ICommunicator;
	import com.mothership.abstract.IReceiver;
	import com.mothership.abstract.ISender;
	import com.mothership.abstract.command.ICommand;
	import com.mothership.controller.Controller;
	import com.mothership.controller.command.AbstractOnMessageCommand;
	import com.mothership.controller.message.Message;
	import com.mothership.controller.message.MessageType;
	import com.mothership.util.Identification;
	
	import flash.errors.IllegalOperationError;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	

	public class Communicator extends Mother implements ICommunicator
	{
		private var _getMessageTypesOverride	:Function;
		
		/**
		 * Communicator
		 * 
		 * @param identification
		 */
		public function Communicator(identification:Identification = null)
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
		
		/**
		 * METHOD: public function onMessage
		 * 
		 * DESCRIPTION: Can be overridden and implemented in a concrete ICommunicator to handle messages of any type. 
		 * Any Object with a reference to the ICommunicator can assign a MessageType to be passed to the onMessage 
		 * method of the ICommunicator, however, the concrete ICommunicator should be implemented to handle the MessageType.  
		 * 
		 * @param message:Message
		 */
		public function onMessage(message:Message):void
		{
		}
		
		public function sendMessage(message:Message):void
		{
			controller.sendMessage(message);
		}
		
		public function getMessageTypes():Vector.<MessageType>
		{
			return null;
		}

		
		public function getMessageTypeByName(messageTypeName:String):MessageType
		{
			return controller.getMessageTypeByName(messageTypeName, getMessageTypes());
		}
		
		
	}
}