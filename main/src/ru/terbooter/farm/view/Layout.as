package ru.terbooter.farm.view {
	import flash.events.Event;
	import ru.terbooter.farm.model.Model;
	import ru.terbooter.farm.view.field.FieldLayer;
	import ru.terbooter.farm.view.main.MainLayer;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class Layout extends ViewBase {
		
		private var mainLayer:MainLayer;
		private var fieldLayer:FieldLayer;
		
		public function Layout(mainModel:Model) {
			super(mainModel);
			
			super.mainModel.addEventListener("test", onTest);
			
			this.fieldLayer = new FieldLayer(this.mainModel);
			this.addChild(this.fieldLayer);
			
			this.mainLayer = new MainLayer(this.mainModel);
			this.addChild(this.mainLayer);
		}
		
		private function onTest(e:Event):void {
			trace("ru.terbooter.farm.view.Layout::onTest");
		}
		
		override protected function onAdded(e:Event):void {
			
		}
		
	}

}