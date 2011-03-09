package com.mothership
{
	import com.mothership.abstract.ISender;
	import com.mothership.controller.Controller;
	import com.mothership.controller.message.Message;
	import com.mothership.controller.message.MessageType;
	import com.mothership.util.Identification;
	
	import flash.errors.IllegalOperationError;
	
	public class Sender extends Mother implements ISender
	{
		private var _getMessageTypesOverride	:Function;
			
		public function Sender(identification:Identification = null)
		{
			super(identification);	
		}
		
		public function sendMessage(message:Message):void
		{
			controller.sendMessage(message);
		}
		
		public function getMessageTypes():Vector.<MessageType>
		{
			if (_getMessageTypesOverride != null)
				return _getMessageTypesOverride.apply();
			
			return getMessageTypesDefault();
		}
		
		public function getMessageTypesDefault():Vector.<MessageType>
		{
			throw IllegalOperationError('Sender.getMessageTypes() is an Abstract Method and must be overridden in ' + this + '!');
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
	}
}