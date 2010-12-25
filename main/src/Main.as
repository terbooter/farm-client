package {
	import flash.display.Sprite;
	import flash.events.Event;
	import ru.terbooter.farm.commands.MainController;
	import ru.terbooter.server_api.IServerAPI;
	
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class Main extends Sprite {
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			var mainController:MainController = new MainController(this);
			mainController.execute();
			
			var i:IServerAPI;
			
		}
		
	}
	
}