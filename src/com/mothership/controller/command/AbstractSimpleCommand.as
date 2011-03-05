package com.mothership.controller.command
{
	import com.mothership.abstract.command.ICommand;
	
	public class AbstractSimpleCommand implements ICommand
	{
		private var _commandName:String;
		
		public function AbstractSimpleCommand(commandName:String)
		{
			//TODO: use abstract enforcer //
			
			_commandName = commandName;
		}
		
		public function execute():void
		{
		}
		
		public function get commandName():String
		{
			return _commandName;
		}

	}
}