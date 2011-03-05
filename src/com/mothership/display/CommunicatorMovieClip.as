package com.mothership.display
{
	import com.mothership.Communicator;
	import com.mothership.abstract.ICommunicator;
	import com.mothership.controller.message.Message;
	import com.mothership.controller.message.MessageType;
	import com.mothership.utlil.Identification;
	
	import flash.display.MovieClip;
	import flash.errors.IllegalOperationError;
	
	public class CommunicatorMovieClip extends MovieClip implements ICommunicator
	{
		private var _communicator:Communicator;
		
		public function CommunicatorMovieClip(exposeMessageTypes:Boolean = false, id:String = null)
		{
			_communicator = new Communicator(exposeMessageTypes, id);
			
			// set the getMessageTypesOverride of the _communicator object to the CommunicatorSprite.getMessageTypes()
			_communicator.getMessageTypesOverride = getMessageTypes;
		}
		
		public function registerOnMessageHandler(messageType:MessageType, onEventHandler:Function):MessageType
		{
			_communicator.registerOnMessageHandler(messageType, onEventHandler);
			return messageType;
		}
		
		public function registerOnMessageCommand(messageType:MessageType, onEventCommandClass:Class):MessageType
		{
			_communicator.registerOnMessageCommand(messageType, onEventCommandClass);
			return messageType;
		}
		
		public function removeOnMessageHandler(messageType:MessageType, onMessageHandler:Function):MessageType
		{
			return _communicator.removeOnMessageHandler(messageType, onMessageHandler);
		}
		
		public function removeOnMessageCommand(messageType:MessageType, onMessageCommandClass:Class):MessageType
		{
			return _communicator.removeOnMessageCommand(messageType, onMessageCommandClass);
		}
		
		public function sendMessage(event:Message):void
		{
			_communicator.sendMessage(event);
		}
		
		/**
		 * METHOD: public function onMessage
		 * 
		 * DESCRIPTION: Can be overridden and implemented in a concrete ICommunicator to handle messages of any type. 
		 * Any Object with a reference to the ICommunicator can assign a MessageType to be passed to the onMessage 
		 * method of the ICommunicator, however, the concrete ICommunicator should be implemented to handle the MessageType.  
		 * 
		 * @param message:Message
		 * 
		 */
		public function onMessage(message:Message):void
		{
		}
		
		public function getMessageTypes():Vector.<MessageType>
		{
			throw IllegalOperationError('CommunicatorMovieClip.getMessageTypes() is an Abstract Method and must be overridden in ' + this + '!');
		}
		
		public function getMessageTypeByName(messageTypeName:String):MessageType
		{
			return _communicator.getMessageTypeByName(messageTypeName);
		}
		
		public function get identification():Identification
		{
			return _communicator.identification;
		}
	}
}