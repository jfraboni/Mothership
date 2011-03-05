package com.mothership
{
	import com.mothership.abstract.ICommunicator;
	import com.mothership.abstract.command.ICommand;
	import com.mothership.controller.Controller;
	import com.mothership.controller.command.AbstractOnMessageCommand;
	import com.mothership.controller.message.Message;
	import com.mothership.controller.message.MessageType;
	import com.mothership.utlil.Identification;
	
	import flash.errors.IllegalOperationError;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	

	public class Communicator implements ICommunicator
	{
		private var _controller					:Controller;
		private var _identification				:Identification;
		
		private var _getMessageTypesOverride	:Function;
		
		
		public function Communicator(exposeMessageTypes:Boolean = false, id:String = null)
		{
			_controller = Controller.getInstance();
			
			_identification = new Identification(id);
			
			if (exposeMessageTypes)
			{
				if (id == '' || id == null)
					throw new IllegalOperationError('No id set on communicator: To register the message types of the communicator object for exposure, the id property must be set!');
				
				_controller.registerCommunicatorForExposure(this);
			}	
		}
			
		public function get controller():Controller
		{
			return _controller;
		}
		
		public function registerOnMessageHandler(messageType:MessageType, onMessageHandler:Function):MessageType
		{	
			_controller.registerOnMessageHandler(messageType, onMessageHandler);
			return messageType;
		}
		
		public function removeOnMessageHandler(messageType:MessageType, onMessageHandler:Function):MessageType
		{
			return _controller.removeOnMessageHandler(messageType, onMessageHandler);
		}
		
		public function registerOnMessageCommand(messageType:MessageType, onMessageCommandClass:Class):MessageType
		{
			_controller.registerOnMessageCommand(messageType, onMessageCommandClass);
			return messageType;
		}
		
		public function removeOnMessageCommand(messageType:MessageType, onMessageCommandClass:Class):MessageType
		{
			return _controller.removeOnMessageCommand(messageType, onMessageCommandClass);
		}
		
		public function sendMessage(message:Message):void
		{
			_controller.sendMessage(message);
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
			if (_getMessageTypesOverride != null)
				return _getMessageTypesOverride.apply();
			
			return getMessageTypesDefault();
		}
		
		public function getMessageTypesDefault():Vector.<MessageType>
		{
			throw IllegalOperationError('Communicator.getMessageTypes() is an Abstract Method and must be overridden in ' + this + '!');
		}
		
		public function getMessageTypeByName(messageTypeName:String):MessageType
		{
			var messageTypes:Vector.<MessageType> = getMessageTypes();
			if (messageTypes)
			{
				for (var i:int = 0; i < messageTypes.length; i++)
				{
					if (messageTypes[i].messageTypeName == messageTypeName)
						return messageTypes[i];
				}
				// TODO: LOG no messageType found on this communicator object for messageTypeName of messageTypeName //
				return null;
			}
			// TODO: LOG no messageType found on this communicator object for messageTypeName of messageTypeName //
			return null;
		}

		/*public function get communicatorName():String
		{
			return _communicatorName;
		}*/
		
		/**
		 * METHOD: public function set getMessageTypesOverride
		 * 
		 * DESCRIPTION: If an Object is implementing ICommunicator by composing itself with a Communicator Object, this setter should be used to set the appropriate 
		 * getMessageTypes method of the ICommunicator.
		 */
		public function set getMessageTypesOverride(value:Function):void
		{
			_getMessageTypesOverride = value;
		}
		
		public function get identification():Identification
		{
			return _identification;
		}
		
		
	}
}