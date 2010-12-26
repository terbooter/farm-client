package ru.terbooter.farm.model.data {
	import ru.terbooter.connector.events.ConnectorEvent;
	import ru.terbooter.farm.model.ModelBase;
	import ru.terbooter.farm.vos.UserVO;
	import ru.terbooter.logging.Log;
	import ru.terbooter.server_api.events.ServerEvent;
	import ru.terbooter.server_api.IServerAPI;
	import ru.terbooter.farm.model.data.DataEvent;
	/**
	 * Получаем информацию о себе,
	 * храним, оповещаем других
	 * @author terbooter.ru
	 */
	public class MeData extends ModelBase{
		
		private var _me:UserVO;
		private var serverApi:IServerAPI;
		
		public function MeData(serverApi:IServerAPI) {
			this.serverApi = serverApi;
			this.serverApi.addEventListener(ServerEvent.RESPONSE, onResponse);
		}
		
		private function onResponse(e:ServerEvent):void {
			//;
			Log.instance.log(e.responseXML.attribute("c"));
			if (e.command == "user") {
				this._me = UserVO(e.data);
				this.dispatchEvent(new DataEvent(DataEvent.UPDATE_ME));
				
			}
		}
		
		public function get me():UserVO { 
			return _me; 
		}
		
	}

}