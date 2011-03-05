package com.mothership.controller.command
{
	import com.mothership.controller.message.Message;
	import com.mothership.abstract.command.ICommand;

	public interface IOnMessageCommand extends ICommand
	{
		function get message():Message
	}
}