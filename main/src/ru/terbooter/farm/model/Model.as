package ru.terbooter.farm.model {
	import flash.events.Event;
	import ru.terbooter.connector.Connector;
	import ru.terbooter.farm.model.data.AppData;
	import ru.terbooter.farm.model.data.CommandsPool;
	import ru.terbooter.farm.model.data.FieldData;
	import ru.terbooter.farm.model.data.HandData;
	import ru.terbooter.farm.model.data.ImageData;
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
		private var _commandsPool:CommandsPool;
		private var _meData:MeData;
		private var _fieldData:FieldData;
		private var _imageData:ImageData;
		private var _handData:HandData;
		private var serverApi:IServerAPI;
		
		public function Model(appData:AppData, serverApi:IServerAPI) {
			
			this.serverApi = serverApi;
			
			this._appData = appData;
			this.addChild(this.appData);
			
			this._meData = new MeData(serverApi);
			this.addChild(this._meData);
			
			this._fieldData = new FieldData(serverApi, this);
			this.addChild(this._fieldData);
			
			this._handData = new HandData();
			this.addChild(this._handData);
			
			this._imageData = new ImageData(this.appData);
			
			this.appData.addEventListener("test", onTest);
		}
		
		private function onTest(e:Event):void {
			trace("ru.terbooter.farm.model.Model::onTest");
		}
		
		public function get appData():AppData { return _appData; }
		
		public function get meData():MeData { return _meData; }
		
		public function get fieldData():FieldData { return _fieldData; }
		
		public function get imageData():ImageData { return _imageData; }
		
		public function get commandsPool():CommandsPool { return _commandsPool; }
		
		public function set commandsPool(value:CommandsPool):void {
			_commandsPool = value;
		}
		
		public function get handData():HandData { return _handData; }
		
		
		
	}

}