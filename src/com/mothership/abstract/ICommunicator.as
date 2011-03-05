package com.mothership.abstract
{
	import com.mothership.controller.message.Message;
	import com.mothership.controller.message.MessageType;
	import com.mothership.utlil.Identification;

	public interface ICommunicator
	{
		function registerOnMessageHandler(messageType:MessageType, onMessageHandler:Function):MessageType;
		function removeOnMessageHandler(messageType:MessageType, onMessageHandler:Function):MessageType;
		
		function registerOnMessageCommand(messageType:MessageType, onMessageCommandClass:Class):MessageType;
		function removeOnMessageCommand(messageType:MessageType, onMessageCommandClass:Class):MessageType;
		
		function getMessageTypes():Vector.<MessageType>
		function getMessageTypeByName(messageTypeName:String):MessageType
		
		function sendMessage(message:Message):void;
		function onMessage(message:Message):void;
		
		function get identification():Identification;
			
			
	}
}