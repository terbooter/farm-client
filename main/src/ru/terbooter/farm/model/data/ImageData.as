package ru.terbooter.farm.model.data {
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	import flash.net.URLRequest;
	import ru.terbooter.farm.vos.FieldObjectVO;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class ImageData {
		
		private var images:Object = { };
		private var domain:String;
		private var _glowFilter:GlowFilter = new GlowFilter(0xFFFF00);
		private var _focus:Sprite = new TileFocus_design();
		
		public function ImageData(appData:AppData) {
			this.domain = appData.serverURL;
		}
		
		public function getImage(fieldObjectVO:FieldObjectVO, callback:Function):void {
			var path:String = "plants/" + fieldObjectVO.type_id + "/" + fieldObjectVO.grow_period + ".png";
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
		
		public function get glowFilter():GlowFilter { return _glowFilter; }
		
		public function get focus():Sprite { return _focus; }
		
	}

}