package ru.terbooter.server_api {
	import flash.events.EventDispatcher;
	import ru.terbooter.connector.events.ConnectorEvent;
	import ru.terbooter.connector.IConnector;
	import ru.terbooter.server_api.events.ServerEvent;
	/**
	 * Более детально, чем Connector, описывает протокол общения с сервером
	 * необходим для формализации и тестирования запросов на игровой сервер.
	 * 
	 * Вторая функция - это привести ответ сервера в универсальный формат (Value Objects)
	 * Это необходимо в том случае если формат ответа сервера изменится. (Например,
	 * вместо XML будет JSON или AMF)
	 * 
	 * @author terbooter.ru
	 */
	public class ServerAPI extends EventDispatcher implements IServerAPI{
		
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
		
		public function field_restore(requestID:String = null, userID:String = null):void {
			var id:String = (userID == null)? this.uid : userID;
			this.connector.sendRequest("field", "restore", { id:id } , requestID);
		}
		
		public function field_grow(requestID:String = null, userID:String = null):void{
			var id:String = (userID == null)? this.uid : userID;
			this.connector.sendRequest("field", "grow", { id:id } , requestID);
		}
		
		private function onResponse(e:ConnectorEvent):void {
			var serverEvent:ServerEvent = new ServerEvent(e.type, e.responseXML, e.responseID, e.bubbles, e.cancelable);
			switch(serverEvent.command) {
				case "user":
					serverEvent.data = Parser.parseUserVO(e.responseXML);
				break;
				case "field":
					serverEvent.data = Parser.parseField(e.responseXML);
				break;
				case "field_change":
					serverEvent.data = Parser.parseField(e.responseXML);
				break;
			}
			//Parser.parseUserVO(e.responseXML);
			this.dispatchEvent(serverEvent);
		}
		
		/* INTERFACE ru.terbooter.server_api.IServerApi */
		
		public function sendRequest(controller:String, action:String, postParams:Object, requestID:String = null):void{
			this.connector.sendRequest(controller, action, postParams, requestID);
		}
		
		/* INTERFACE ru.terbooter.server_api.IServerAPI */
		
		
	}

}