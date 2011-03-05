package com.mothership.controller.message.agnostic
{
	import flash.errors.IllegalOperationError;
	import com.mothership.controller.message.MessageType;

	public class ViewMessages
	{
		public static const CREATED								:MessageType = new MessageType('CREATED', 'The view was created.');
		public static const DESTROYED							:MessageType = new MessageType('DESTROYED', 'The view was destroyed.');
		
		public static const VIEW_ADDED							:MessageType = new MessageType('VIEW_ADDED', 'The view was added to the stage.');
		public static const VIEW_REMOVED						:MessageType = new MessageType('VIEW_REMOVED', 'The view was removed from the stage.');
		
		public static const VIEW_ABOUT_TO_BE_ADDED				:MessageType = new MessageType('VIEW_ABOUT_TO_BE_ADDED', 'The view is about to be added to the stage.');
		public static const VIEW_ABOUT_TO_BE_REMOVED			:MessageType = new MessageType('VIEW_ABOUT_TO_BE_REMOVED', 'The view is about to be removed from the stage.');
		
		public static const EXTERNAL_VIEW_LOAD_REQUESTED		:MessageType = new MessageType('EXTERNAL_VIEW_LOAD_REQUESTED', 'A request has been made to load the external view object.');
		public static const EXTERNAL_VIEW_LOAD_COMPLETE			:MessageType = new MessageType('EXTERNAL_VIEW_LOAD_COMPLETE', 'The external view has completed loading successfully.');
		public static const EXTERNAL_VIEW_LOAD_ERROR			:MessageType = new MessageType('EXTERNAL_VIEW_LOAD_ERROR', 'An error occurred while attempting to load the external view.');
		
		
		public function ViewMessages()
		{
			throw IllegalOperationError('ViewMessages cannot be instatiated directly. ViewMessages is a collection of application or module agnostic view-related MessageType declared as public static const.');
		}
		
		public static function getMessageTypes():Vector.<MessageType>
		{
			return Vector.<MessageType>([
				CREATED,
				DESTROYED,
				VIEW_ADDED,
				VIEW_REMOVED,
				VIEW_ABOUT_TO_BE_ADDED,
				VIEW_ABOUT_TO_BE_REMOVED,
				EXTERNAL_VIEW_LOAD_REQUESTED,
				EXTERNAL_VIEW_LOAD_COMPLETE,
				EXTERNAL_VIEW_LOAD_ERROR
			]);
		}
	}
}