package ru.terbooter.farm.model {
	import flash.events.Event;
	import ru.terbooter.connector.Connector;
	import ru.terbooter.farm.model.data.AppData;
	import ru.terbooter.farm.model.data.MeData;
	import ru.terbooter.server_api.IServerAPI;
	import ru.terbooter.server_api.ServerAPI;
	/**
	 * "Рутовая" модель.
	 * События от "листьев" всплывают до объекта этого класса
	 * @author terbooter.ru
	 */
	public class Model extends ModelBase{
		
		private var _appData:AppData;
		private var _meData:MeData;
		private var serverApi:IServerAPI;
		
		public function Model(appData:AppData, serverApi:IServerAPI) {
			
			this.serverApi = serverApi;
			
			this._appData = appData;
			this.addChild(this.appData);
			
			this._meData = new MeData(serverApi);
			this.addChild(this._meData);
			
			this.appData.addEventListener("test", onTest);
		}
		
		private function onTest(e:Event):void {
			trace("ru.terbooter.farm.model.Model::onTest");
		}
		
		public function get appData():AppData { return _appData; }
		
		public function get meData():MeData { return _meData; }
		
		
		
	}

}