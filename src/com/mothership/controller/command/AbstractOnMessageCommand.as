package com.mothership.controller.command
{
	import com.mothership.controller.message.Message;

	public class AbstractOnMessageCommand extends AbstractSimpleCommand implements IOnMessageCommand
	{
		private var _message		:Message;
		
		public function AbstractOnMessageCommand(commandName:String, message:Message)
		{
			super(commandName);
			
			//TODO: use abstract enforcer //
			
			_message = message;
		}

		public final function get message():Message
		{
			return _message;
		}

	}
}