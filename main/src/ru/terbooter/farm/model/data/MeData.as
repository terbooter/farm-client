package ru.terbooter.farm.model.data {
	import ru.terbooter.connector.events.ConnectorEvent;
	import ru.terbooter.farm.model.ModelBase;
	import ru.terbooter.farm.vos.UserVO;
	import ru.terbooter.logging.Log;
	import ru.terbooter.server_api.IServerAPI;
	/**
	 * Получаем информацию о себе,
	 * храним, оповещаем других
	 * @author terbooter.ru
	 */
	public class MeData extends ModelBase{
		
		private var me:UserVO;
		private var serverApi:IServerAPI;
		
		public function MeData(serverApi:IServerAPI) {
			this.serverApi = serverApi;
			this.serverApi.addEventListener(ConnectorEvent.RESPONSE, onResponse);
		}
		
		private function onResponse(e:ConnectorEvent):void {
			//;
			Log.instance.log(e.responseXML.attribute("c"));
		}
		
	}

}