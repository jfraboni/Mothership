package com.mothership.controller
{
	import com.mothership.abstract.ICommunicator;
	import com.mothership.abstract.command.ICommand;
	import com.mothership.controller.message.Message;
	import com.mothership.controller.message.MessageType;
	import com.mothership.util.PrivateClassEnforcer;
	
	import flash.errors.IllegalOperationError;
	import flash.utils.Dictionary;

	public class Controller //implements ICommunicator
	{
		// SINGLETON //
		private static var _instance					:Controller;
		private static const _PRIVATE_CLASS_ENFORCER	:PrivateClassEnforcer = {} as PrivateClassEnforcer;
		
		private var _mapMessageTypeToCommands			:Dictionary = new Dictionary();
		private var _mapMessageTypeToFunctions			:Dictionary = new Dictionary();
		private var _mapIdToCommunicator				:Dictionary = new Dictionary();
		
		private var _historyMessagesSent				:Vector.<Message> = new Vector.<Message>();
		
		
		/**
		 * Controller
		 * 
		 * @param privateClassEnforcer
		 * 
		 */		
		public function Controller(privateClassEnforcer:PrivateClassEnforcer)
		{
			if (privateClassEnforcer != _PRIVATE_CLASS_ENFORCER)
				throw new IllegalOperationError(this + ' is a Singleton Class and can only be accessed by using the getInstance() method.');
		}
		
		public static function getInstance():Controller
		{
			if (!_instance)
				_instance = new Controller(_PRIVATE_CLASS_ENFORCER);
			
			return _instance;
		}
		
		/**
		 * METHOD: public function registerOnMessageHandler
		 * 
		 * DESCRIPTION: Registers a Function to be executed on the given MessageType.
		 * 
		 * @param messageType:MessageType  The MessageType object, used to indentify the type of Event being sent, to which the handler will be registered.
		 * @param onEventHandler:Function  The Function that will be executed when the Event of the MessageType is sent.
		 * @return MessageType  Returns the MessageType object of the Event as a courtesy to let any intersted client know that any registered 
		 * Function have been executed.
		 */
		public function registerOnMessageHandler(messageType:MessageType, onMessageHandler:Function):MessageType
		{ 
			if (_mapMessageTypeToFunctions[messageType])
			{
				var onMessageHandlers:Vector.<Function> = _mapMessageTypeToFunctions[messageType] as Vector.<Function>;
				if (onMessageHandlers.indexOf(onMessageHandler) == -1)
					onMessageHandlers.push(onMessageHandler);
			} else {
				_mapMessageTypeToFunctions[messageType] = Vector.<Function>([onMessageHandler]);
			}
			return messageType;
		}
		
		/**
		 * METHOD: public function registerOnMessageCommand
		 * 
		 * DESCRIPTION: Registers an IOnEventCommand Class to be created and executed on receiving the given MessageType.
		 * 
		 * @param messageType:MessageType  The MessageType object, used to indentify the type of Event being sent, to which the handler will be registered.
		 * @param onEventCommandClass:Class  The IOnEventCommand Class that will be created and executed when the Event of the MessageType is sent.
		 * @return MessageType  Returns the MessageType object of the Event as a courtesy to let any intersted client know that any registered 
		 * IOnEventCommand have been created and executed.
		 */
		public function registerOnMessageCommand(messageType:MessageType, onMessageCommandClass:Class):MessageType
		{ 
			if (_mapMessageTypeToCommands[messageType])
			{
				var commands:Vector.<Class> = _mapMessageTypeToCommands[messageType] as Vector.<Class>;
				if (commands.indexOf(onMessageCommandClass) == -1)
					commands.push(onMessageCommandClass);
				//(_mapNotesToCommands[note] as Vector.<Class>).push(onEventCommandClass);
			} else {
				_mapMessageTypeToCommands[messageType] = Vector.<Class>([onMessageCommandClass]);
			}
			return messageType;
		}
		
		/**
		 * METHOD: public function removeOnMessageHandler
		 * 
		 * DESCRIPTION: If registered, removes the given Function associated with the given MessageType.
		 * 
		 * @param messageType:MessageType  The MessageType to which the Function may be associated.
		 * @param onMessageHandler:Function  The Function to be removed, if registerd to the MessageType.
		 * @return MessageType  Returns the MessageType object of the Event as a courtesy to let any intersted client know that any registered 
		 * Function has been removed.  Returns null if no Function was registered.
		 */		
		public function removeOnMessageHandler(messageType:MessageType, onMessageHandler:Function):MessageType
		{
			if (_mapMessageTypeToFunctions[messageType])
			{
				var onMessageHandlers:Vector.<Function> = _mapMessageTypeToFunctions[messageType] as Vector.<Function>;
				var indexOf:int = onMessageHandlers.indexOf(onMessageHandler);
				if (indexOf != -1)
				{
					onMessageHandlers.splice(indexOf, 1);
					return messageType;
				}
			}
			return null;
		}
		
		/**
		 * METHOD: public function removeOnMessageCommand
		 * 
		 * DESCRIPTION: If registered, removes the given IOnEventCommand-Class associated with the given MessageType.
		 * 
		 * @param messageType:MessageType  The MessageType to which the IOnEventCommand-Class may be associated.
		 * @param onMessageCommandClass:Class  IOnMessageCommand-Class to be removed, if registerd to the MessageType.
		 * @return MessageType  Returns the MessageType object of the Event as a courtesy to let any intersted client know that any registered 
		 * IOnEventCommand has been removed.  Returns null if no IOnEventCommand-Class was registered.
		 */		
		public function removeOnMessageCommand(messageType:MessageType, onMessageCommandClass:Class):MessageType
		{
			if (_mapMessageTypeToCommands[messageType])
			{
				var onMessageCommands:Vector.<Class> = _mapMessageTypeToCommands[messageType] as Vector.<Class>;
				var indexOf:int = onMessageCommands.indexOf(onMessageCommandClass);
				if (indexOf != -1)
				{
					onMessageCommands.splice(indexOf, 1);
					return messageType;
				}
			}
			return null;
		}		
		
		private function executeOnMessageCommands(message:Message):void
		{
			var commands:Vector.<Class> = _mapMessageTypeToCommands[message.messageType] as Vector.<Class>;
			if (commands)
			{
				for (var i:int = 0; i < commands.length; i++)
				{
					var CommandClass:Class = commands[i];
					if ( CommandClass == null )
						continue;
					
					var commandInstance:ICommand = new CommandClass(message) as ICommand;
					commandInstance.execute();
					// TODO : add to history the commands successfully fired with the message //
					//_history
				}
			} else {
				// TODO: LOG NO COMMANDS FOUND FOR EVENT //
			}
		}
		
		private function executeOnEventHandlers(message:Message):void
		{
			var onEventHandlers:Vector.<Function> = _mapMessageTypeToFunctions[message.messageType] as Vector.<Function>;
			if (onEventHandlers)
			{
				for (var i:int = 0; i < onEventHandlers.length; i++)
				{
					var onEventHandler:Function = onEventHandlers[i];
					if ( onEventHandler != null )
					{
						onEventHandler.apply(null, [message]);
					} else {
						trace('Attempting to execute a null method!');
					}
					// TODO : add to history the onEventHandlers successfully fired with the message //
					//_history
				}
			} else {
				// TODO: LOG NO HANDLERS FOUND FOR EVENT //
			}
		}
		
		public function sendMessage(message:Message):void
		{
			message.timeSent = new Date();
			_historyMessagesSent.push(message);	
			
			executeOnMessageCommands(message);
			executeOnEventHandlers(message);
		}

		public function get historyOfMessagesSent():Vector.<Message>
		{
			return _historyMessagesSent;
		}
		
		public function historyOfMessagesSentToString():String
		{
			var str:String = '\n---------------------------------------------------------------------------------------------------------------------\nMESSAGES SENT:\n';
			
			str +=	(historyOfMessagesSent.length > 0) ? 'The following messages where sent in the following order:\n' : 'No messages have been sent as of ' + new Date().toString() + '.';
			for (var i:int = 0; i < historyOfMessagesSent.length; i++)
			{
				str += '\t' + (i+1) + '. ' + historyOfMessagesSent[i].toString() + '\n';
			}
			
			str += '\n---------------------------------------------------------------------------------------------------------------------\n';
			return str;
		}
		
		public function registerCommunicatorForExposure(communicator:ICommunicator):void
		{
			_mapIdToCommunicator[communicator.identification.id] = communicator;
		}
		
		public function getMessageTypeByFullyQualifiedPath(communicatorId:String, messageTypeName:String):MessageType
		{
			if (_mapIdToCommunicator[communicatorId])
			{
				var messageTypes:Vector.<MessageType> = ICommunicator(_mapIdToCommunicator[communicatorId]).getMessageTypes();
				if (messageTypes)
				{
					for (var i:int = 0; i < messageTypes.length; i++)
					{
						if (messageTypes[i].messageTypeName == messageTypeName)
							return messageTypes[i];
					}
				}
			}
			return null;
		}
		
		public function getMessageTypesByCommunicatorId(communicatorId:String):Vector.<MessageType>
		{
			return ICommunicator(_mapIdToCommunicator[communicatorId]).getMessageTypes() || null;
		}
		
		public function getMessageTypeByName(messageTypeName:String, messageTypes:Vector.<MessageType>):MessageType
		{
			if (messageTypes)
			{
				for (var i:int = 0; i < messageTypes.length; i++)
				{
					if (messageTypes[i].messageTypeName == messageTypeName)
						return messageTypes[i];
				}
				// TODO: LOG no messageType found on this communicator object for messageTypeName of messageTypeName //
				return null;
			}
			// TODO: LOG no messageType found on this communicator object for messageTypeName of messageTypeName //
			return null;
		}

	}
}