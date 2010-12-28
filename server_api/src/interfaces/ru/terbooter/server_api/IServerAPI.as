package ru.terbooter.server_api {
	import ru.terbooter.connector.IConnector;
	
	/**
	 * Формализуем конкретные запросы к серверу
	 * @author terbooter.ru
	 */
	
	[Event(name="RESPONSE", type="ru.terbooter.server_api.events.ServerEvent")]
	public interface IServerAPI extends IConnector{
		function user_restore(requestID:String = null, userID:String = null):void;
		function field_restore(requestID:String = null, userID:String = null):void;
		function field_grow(requestID:String = null, userID:String = null):void;
		function field_seed(x:int, y:int, type_id:int, requestID:String = null, userID:String = null):void;
		function field_crop(obj_id:String, requestID:String = null, userID:String = null):void;
		
	}
	
}