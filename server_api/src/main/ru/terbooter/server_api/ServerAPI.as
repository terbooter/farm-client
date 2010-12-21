package ru.terbooter.server_api {
	import flash.events.EventDispatcher;
	import ru.terbooter.connector.events.ConnectorEvent;
	import ru.terbooter.connector.IConnector;
	/**
	 * Более детально, чем Connector, описывает протокол общения с сервером
	 * необходим для формализации и тестирования запросов на игровой сервер
	 * @author terbooter.ru
	 */
	public class ServerAPI extends EventDispatcher{
		
		private var connector:IConnector;
		
		/**
		 * Ид в социальной сети игрока
		 */
		private var uid:String;
		
		/**
		 * Ключ для проверки авторизации игрока на нашем сервере
		 */
		private var authKey:String;
		
		public function ServerAPI(connector:IConnector, uid:String, authKey:String = "") {
			this.connector = connector;
			this.uid = uid;
			this.authKey = authKey;
			
			this.connector.addEventListener(ConnectorEvent.RESPONSE, onResponse);
		}
		
		public function user_restore(requestID:String = null, userID:String = null):void {
			var id:String = (userID == null)? this.uid : userID;
			this.connector.sendRequest("users", "restore", { id:this.uid } ,requestID);
		}
		
		public function field_restore(requestID:String = null, userID:String):void {
			var id:String = (userID == null)? this.uid : userID;
			this.connector.sendRequest("users", "restore", { id:id } , requestID);
		}
		
		private function onResponse(e:ConnectorEvent):void {
			this.dispatchEvent(e);
		}
		
		
	}

}