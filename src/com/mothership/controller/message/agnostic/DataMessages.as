package com.mothership.controller.message.agnostic
{
	import flash.errors.IllegalOperationError;
	import com.mothership.controller.message.MessageType;

	public class DataMessages
	{
		public static const DATA_LOAD_REQUESTED					:MessageType = new MessageType('DATA_LOAD_REQUESTED', 'A request has been made to load the data.');
		public static const DATA_LOAD_COMPLETE					:MessageType = new MessageType('DATA_LOAD_COMPLETE', 'The data has completed loading successfully.');
		public static const DATA_LOAD_ERROR						:MessageType = new MessageType('DATA_LOAD_ERROR', 'An error occurred while attempting to load the data.');
		
		public function DataMessages()
		{
			throw IllegalOperationError('DataMessages cannot be instatiated directly. DataMessages is a collection of application or module agnostic view-related MessageType declared as public static const.');
		}
		
		public static function getMessageTypes():Vector.<MessageType>
		{
			return Vector.<MessageType>([
				DATA_LOAD_REQUESTED,
				DATA_LOAD_COMPLETE,
				DATA_LOAD_ERROR
			]);
		}
	}
}