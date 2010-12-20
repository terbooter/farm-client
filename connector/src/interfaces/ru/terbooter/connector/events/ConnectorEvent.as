package  ru.terbooter.connector.events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class ConnectorEvent extends Event {
		
		public static const RESPONSE:String = "RESPONSE";
		
		private var _responseXML:XML;
		
		public function ConnectorEvent(type:String, xml:XML, bubbles:Boolean = false, cancelable:Boolean = false) { 
			this._responseXML = xml;
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event { 
			return new ConnectorEvent(type, this._responseXML, bubbles, cancelable);
		} 
		
		public override function toString():String { 
			return formatToString("ConnectorEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get responseXML():XML { return _responseXML; }
		
	}
	
}