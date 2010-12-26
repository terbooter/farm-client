package {
	import flash.display.Sprite;
	import flash.events.Event;
	import ru.terbooter.connector.Connector;
	import ru.terbooter.connector.events.ConnectorEvent;
	import ru.terbooter.connector.IConnector;
	import ru.terbooter.logging.Log;
	import ru.terbooter.server_api.events.ServerEvent;
	import ru.terbooter.server_api.ServerAPI;
	
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class Test extends Sprite {
		
		private static const SERVER_URL:String = "http://127.0.0.1:3000/";
		private var api:ServerAPI;
		
		public function Test():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var connector:IConnector = new Connector(SERVER_URL);
			this.api = new ServerAPI(connector, "1");
			
			this.api.addEventListener(ConnectorEvent.RESPONSE, onApiResponse);
			
			//this.api.user_restore();
			//this.api.user_restore("user121212");
			
			this.api.field_restore();
		}
		
		private function onApiResponse(e:ConnectorEvent):void {
			Log.instance.log("Test::onApiResponse");
			Log.instance.log(e.responseXML);
			Log.instance.log(e.responseID);
			
		}
		
	}
	
}