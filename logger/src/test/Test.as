package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import ru.terbooter.logging.ILogger;
	import ru.terbooter.logging.Log;
	import ru.terbooter.logging.LoggerImpl;
	
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class Test extends Sprite {
		
		public function Test():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var logger:ILogger = new LoggerImpl();
			logger.log("first with params", 1, 2, 3);
			logger.log("Single string");
			
			Log.instance.log("wewewewe");
		}
		
	}
	
}