package ru.terbooter.farm.model.data {
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import ru.terbooter.farm.vos.FieldObjectVO;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class ImageData {
		
		private var images:Object = { };
		private var domain:String;
		
		public function ImageData(appData:AppData) {
			this.domain = appData.serverURL;
		}
		
		public function getImage(fieldObjectVO:FieldObjectVO, callback:Function):void {
			var path:String = "plants/" + fieldObjectVO.type_id + "/" + fieldObjectVO.growPeriod + ".png";
			if (this.images[path]) {
				callback.apply(null, [ImageLoader(this.images[path]).content]);
				return;
			}
			
			var loader:ImageLoader = new ImageLoader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			loader.key = path;
			loader.callback = callback;
			loader.load(new URLRequest(this.domain+path));
		}
		
		private function onLoadComplete(e:Event):void {
			var loader:ImageLoader = ImageLoader(e.target.loader);
			this.images[loader.key] = loader;
			
			loader.callback.apply(null, [loader.content]);
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoadComplete);
			loader.callback = null;
			
		}
		
	}

}