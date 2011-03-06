package com.mothership.abstract
{
	import com.mothership.controller.message.Message;
	import com.mothership.controller.message.MessageType;

	public interface IReceiver
	{
		function registerOnMessageHandler(messageType:MessageType, onMessageHandler:Function):MessageType;
		function removeOnMessageHandler(messageType:MessageType, onMessageHandler:Function):MessageType;
		
		function registerOnMessageCommand(messageType:MessageType, onMessageCommandClass:Class):MessageType;
		function removeOnMessageCommand(messageType:MessageType, onMessageCommandClass:Class):MessageType;
		
		function onMessage(message:Message):void;
	}
}