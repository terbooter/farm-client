package ru.terbooter.connector {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import ru.terbooter.connector.events.ConnectorEvent;
	/**
	 * Отправляет запросы на сервер
	 * 
	 * При необходимости можно реализовать очередь
	 * и др вспомогательные функции
	 * @author terbooter.ru
	 */
	public class Connector extends EventDispatcher implements IConnector {
		
		private var serverURL:String;
		
		/**
		 * Хэш активных лоадеров.
		 * 
		 */
		private var activeLoaders:Object;
		
		public function Connector(serverURL:String) {
			super();
			
			this.serverURL = serverURL;
		}
		
		public function sendRequest(controller:String, action:String, postParams:Object, requestID:String=null):void {
			var url:String = this.serverURL + controller + "/" + action;
			
			//Если ид у запроса не задан явно, то соберем дефолтный
			if (requestID == null) {
				requestID = controller + "/" + action;
				if (postParams.id) {
					requestID += "/" + postParams.id;
				}
			}
			
			var loader:ConnectorLoader = new ConnectorLoader(url, postParams, requestID);
			loader.addEventListener(Event.COMPLETE, onLoadComplete);
			loader.load();
		}
		
		private function onLoadComplete(e:Event):void {
			var loader:ConnectorLoader = ConnectorLoader(e.target);
			var data:String = String(loader.loader.data);
			var xml:XML = new XML(data);
			var requestID:String = loader.requestID;
			
			var event:ConnectorEvent = new ConnectorEvent(ConnectorEvent.RESPONSE, xml, requestID) ;
			this.dispatchEvent(event);
		}
		
	}

}