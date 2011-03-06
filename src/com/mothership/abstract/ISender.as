package com.mothership.abstract
{
	import com.mothership.controller.message.Message;
	import com.mothership.controller.message.MessageType;

	public interface ISender
	{
		function sendMessage(message:Message):void;
		function getMessageTypes():Vector.<MessageType>
		function getMessageTypeByName(messageTypeName:String):MessageType
	}
}