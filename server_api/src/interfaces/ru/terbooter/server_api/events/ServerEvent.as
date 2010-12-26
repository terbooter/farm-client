package ru.terbooter.server_api.events {
	import flash.events.Event;
	import ru.terbooter.connector.events.ConnectorEvent;
	
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class ServerEvent extends ConnectorEvent {
		
		public static const RESPONSE:String = "RESPONSE";
		
		public var data:*;
		
		public function ServerEvent(type:String, xml:XML, id:String, bubbles:Boolean = false, cancelable:Boolean = false):void {
			super(type, xml, id, bubbles, cancelable)
		}
		
		public function get command():String {
			return super.responseXML.attribute("c");
		}
		
	}
	
}