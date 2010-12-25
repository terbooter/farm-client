package ru.terbooter.farm.view {
	import flash.events.Event;
	import ru.terbooter.farm.model.Model;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class Layout extends ViewBase{
		
		public function Layout(mainModel:Model) {
			super(mainModel);
			
			super.mainModel.addEventListener("test", onTest);
		}
		
		private function onTest(e:Event):void {
			trace("ru.terbooter.farm.view.Layout::onTest");
		}
		
	}

}