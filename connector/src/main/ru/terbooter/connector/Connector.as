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
		
		public function sendRequest(controller:String, action:String, postParams:Object):void {
			var url:String = this.serverURL + controller + "/" + action;
			var loader:ConnectorLoader = new ConnectorLoader(url, postParams);
			loader.addEventListener(Event.COMPLETE, onLoadComplete);
			loader.load();
		}
		
		private function onLoadComplete(e:Event):void {
			var data:String = String(ConnectorLoader(e.target).loader.data);
			var xml:XML = new XML(data);
			
			var event:ConnectorEvent = new ConnectorEvent(ConnectorEvent.RESPONSE, xml);
			this.dispatchEvent(event);
		}
		
	}

}