package com.mothership.controller.message.agnostic
{
	import com.mothership.controller.message.MessageType;
	
	import flash.errors.IllegalOperationError;

	public class AgnosticMessages
	{
		/**
		 * AGNOSTIC:MessageType  An all-purpose agnostic message, it can be used for any purpose and is 
		 * not tied to any application or specific purpose - ideal for agnostic module communication, etc.
		 */		
		public static const AGNOSTIC						:MessageType = new MessageType('AGNOSTIC', 'An agnostic message');
		
		public function AgnosticMessages()
		{
			throw IllegalOperationError('AgnosticMessages cannot be instatiated directly. AgnosticMessages is a collection of application or module agnostic MessageType declared as public static const.');
		}
	}
}