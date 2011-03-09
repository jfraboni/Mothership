package com.mothership.controller.command
{
	import com.mothership.abstract.IIdentifiable;
	import com.mothership.abstract.command.ICommand;
	import com.mothership.util.Identification;
	
	public class AbstractSimpleCommand implements ICommand, IIdentifiable
	{
		private var _identification:Identification;

		
		public function AbstractSimpleCommand(identification:Identification)
		{
			//TODO: use abstract enforcer //
			
			_identification = identification;
		}
		
		public function execute():void
		{
		}
		
		public function get identification():Identification
		{
			return _identification;
		}


	}
}