package {
	import flash.display.Sprite;
	import flash.events.Event;
	import ru.terbooter.connector.Connector;
	import ru.terbooter.connector.events.ConnectorEvent;
	import ru.terbooter.logging.Log;
	
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class Test extends Sprite {
		
		private var connector:Connector;
		private static const SERVER_URL:String = "http://127.0.0.1:3000/";
		
		public function Test():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			Log.instance.enabled = true;
			
			this.connector = new Connector(SERVER_URL);
			this.connector.addEventListener(ConnectorEvent.RESPONSE, onServerResponse);
			//this.connector.sendRequest("test", "echo", { k1:1, k2:"TestTest", k3:"Русский текст" } );
			//this.connector.sendRequest("test", "echo", { k1:1, k2:"TestTest", k3:"English" } );
			
			//this.connector.sendRequest("users", "restore", { id:1 } );
			this.connector.sendRequest("field", "restore", { id:1 } );
		}
		
		private function onServerResponse(e:ConnectorEvent):void {
			
			Log.instance.log(e.responseID);
			Log.instance.log(e.responseXML.toString());
		}
		
	}
	
}