package  ru.terbooter.connector{
	import flash.events.IEventDispatcher;
	
	/**
	 * Первый уровень абстракции запроса к серверу. (0 уровень - URLLoader, 2 уровень - Server API)
	 * Избавляет от необходимости собирать каждый новый запрос ручками
	 * @author terbooter.ru
	 */
	
	[Event(name="RESPONSE", type="ru.terbooter.connector.events.ConnectorEvents")]
	public interface IConnector extends IEventDispatcher{
		function sendRequest(controller:String, action:String, postParams:Object):void;
	}
	
}