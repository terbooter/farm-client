package ru.terbooter.farm.model.events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class HelperEvent extends Event {
		
		public static const LISTEN_TO:String = "LISTEN_TO";
		public var eventToListen:Event;
		
		public function HelperEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) { 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event { 
			return new HelperEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String { 
			return formatToString("HelperEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}