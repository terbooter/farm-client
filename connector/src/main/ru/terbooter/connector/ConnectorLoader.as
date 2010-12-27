package ru.terbooter.connector {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import ru.terbooter.logging.Log;
	/**
	 * C помощью этого лоадера отправляем
	 * запросы на сервер.
	 * 
	 * В отличие от обычного лоадера,
	 * хранит некоторые параметры запроса
	 * @author terbooter.ru
	 */
	public class ConnectorLoader extends EventDispatcher {
		
		private var controller:String;
		private var action:String;
		
		private var url:String;
		private var postData:Object;
		
		private var _loader:URLLoader;
		private var _data:String;
		private var _requestID:String;
		
		public function ConnectorLoader(url:String, postData:Object, requestID:String) {
			this.controller = controller;
			this.action = action;
			
			this._requestID = requestID;
			this.url = url;
			this.postData = postData;
		}
		
		public function load():void {
			var request:URLRequest = new URLRequest(this.url);
			var vars:URLVariables = new URLVariables();
			for (var key:String in this.postData) {
				vars[key] = this.postData[key];
			}
			vars.t = (new Date()).time;
			request.data = vars;
			this._loader = new URLLoader();
			//Будем грузить хмл
			this._loader.dataFormat = URLLoaderDataFormat.TEXT;
			this._loader.addEventListener(Event.COMPLETE, onComplete);
			this._loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			this._loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			
			this._loader.load(request);
			
		}
		
		private function onIOError(e:IOErrorEvent):void {
			Log.instance.log("ru.terbooter.connector.ConnectorLoader::onIOError");
		}
		
		private function onSecurityError(e:SecurityErrorEvent):void {
			Log.instance.log("ru.terbooter.connector.ConnectorLoader::onSecurityError");
		}
		
		
		private function onComplete(e:Event):void {
			Log.instance.log("ru.terbooter.connector.ConnectorLoader::onComplete");
			this.dispatchEvent(e);
		}
		
		/*public function get data():String {
			if (!this.loader) {
				return null;
			}
			return this.loader.data; 
		}*/
		
		public function get loader():URLLoader { return _loader; }
		
		public function get requestID():String { return _requestID; }
		
	}

}