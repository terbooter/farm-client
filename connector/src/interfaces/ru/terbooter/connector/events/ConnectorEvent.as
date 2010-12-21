package  ru.terbooter.connector.events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class ConnectorEvent extends Event {
		
		public static const RESPONSE:String = "RESPONSE";
		
		private var _responseXML:XML;
		private var _responseID:String;
		
		public function ConnectorEvent(type:String, xml:XML, id:String, bubbles:Boolean = false, cancelable:Boolean = false) { 
			this._responseXML = xml;
			this._responseID = id;
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event { 
			return new ConnectorEvent(type, this._responseXML, this._responseID, bubbles, cancelable);
		} 
		
		public override function toString():String { 
			return formatToString("ConnectorEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get responseXML():XML { return _responseXML; }
		
		public function get responseID():String { return _responseID; }
		
	}
	
}