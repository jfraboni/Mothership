package com.mothership.controller.command
{
	import com.mothership.controller.message.Message;
	import com.mothership.util.Identification;

	public class AbstractOnMessageCommand extends AbstractSimpleCommand implements IOnMessageCommand
	{
		private var _message		:Message;
		
		public function AbstractOnMessageCommand(identification:Identification, message:Message)
		{
			super(identification);
			
			//TODO: use abstract enforcer //
			
			_message = message;
		}

		public final function get message():Message
		{
			return _message;
		}

	}
}