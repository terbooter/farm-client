package ru.terbooter.server_api.events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class ServerEvent extends Event {
		
		public static const RESPONSE:String = "RESPONSE";
		
		public function ServerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) { 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event { 
			return new ServerEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String { 
			return formatToString("ServerEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}