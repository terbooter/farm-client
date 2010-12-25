package ru.terbooter.farm.model.data {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author terbooter.ru
	 */
	
	public class AppDataEvent extends Event {
		
		public static const FLASH_VARS:String = "FLASH_VARS";
		
		public function AppDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) { 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event { 
			return new AppDataEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String { 
			return formatToString("AppDataEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}