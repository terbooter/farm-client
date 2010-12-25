package ru.terbooter.farm.model.data {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import ru.terbooter.farm.model.Config;
	import ru.terbooter.farm.model.ModelBase;
	/**
	 * Тут хранится конфигурационная информация приложения
	 * 
	 * @author terbooter.ru
	 */
	public class AppData extends ModelBase{
		
		private var _flashVars:Object;
		private var _serverURL:String = Config.SERVER_URL;
		private var _siteId:int = Config.SITE_ID;
		
		private var testTimer:Timer = new Timer(1000, 10);
		
		public function AppData(flashVars:Object=null) {
			
			if (flashVars) {
				this.flashVars = flashVars;
			}
			//this.testTimer.addEventListener(TimerEvent.TIMER, tick);
			//this.testTimer.start();
		}
		
		private function tick(e:TimerEvent):void {
			this.dispatchEvent(new Event("test"));
		}
		
		public function get flashVars():Object { return _flashVars; }
		
		public function set flashVars(value:Object):void {
			
			this.dispatchEvent(new AppDataEvent(AppDataEvent.FLASH_VARS));
			_flashVars = value;
		}
		
		public function get serverURL():String { return _serverURL; }
		
		public function get uid():String {
			var uid:String = "1";
			switch(this._siteId) {
				case 0:
					uid = this._flashVars.viewer_id;
				break;
			}
			
			//TODO
			if (!uid) {
				uid = "1";
			}
			return uid;
		}
		
	}

}