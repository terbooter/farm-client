package ru.terbooter.farm.model.data {
	import flash.events.Event;
	import ru.terbooter.farm.model.data.DataEvent;
	import ru.terbooter.farm.model.Model;
	import ru.terbooter.farm.model.ModelBase;
	import ru.terbooter.farm.model.utils.Utils;
	import ru.terbooter.farm.vos.FieldObjectVO;
	import ru.terbooter.logging.Log;
	import ru.terbooter.server_api.events.ServerEvent;
	import ru.terbooter.server_api.IServerAPI;
	/**
	 * Все данные того что есть на поле
	 * @author terbooter.ru
	 */
	public class FieldData extends ModelBase {
		
		private var serverApi:IServerAPI;
		private var mainModel:Model;
		private var _field:Array;
		
		public function FieldData(serverApi:IServerAPI, mainModel:Model) {
			
			this.mainModel = mainModel;
			this.serverApi = serverApi;
			this.serverApi.addEventListener(ServerEvent.RESPONSE, onResponse);
			this.mainModel.addEventListener(DataEvent.UPDATE_ME, onUpdateMe, false, -1);
		}
		
		private function onUpdateMe(e:DataEvent):void {
			
		}
		
		private function onResponse(e:ServerEvent):void {
			trace("ru.terbooter.farm.model.data.FieldData::onResponse");
			Log.instance.log(e.responseXML.attribute("c"));
			if (e.command == "field") {
				var ar:Array = e.data as Array;
				this.clearCoords();
				this.fillCoords(ar);
				//this.dispatchEvent(new DataEvent(DataEvent.UPDATE_ME));
				
			}
		}
		
		private function clearCoords():void{
			
		}
		
		private function fillCoords(ar:Array):void {
			this._field = Utils.create2dArray(10, 10);
			var o:FieldObjectVO;
			for (var i:int = 0; i < ar.length; i++) {
				o = FieldObjectVO(ar[i]);
				this._field[o.x][o.y] = o;
			}
			this.dispatchEvent(new DataEvent(DataEvent.UPDATE_FIELD));
		}
		
		public function get field():Array { return _field; }
		
	}

}