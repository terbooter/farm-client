package ru.terbooter.farm.view.main {
	import flash.events.Event;
	import ru.terbooter.farm.model.Model;
	import ru.terbooter.farm.view.ViewBase;
	/**
	 * Основной слой с графикой
	 * @author terbooter.ru
	 */
	public class MainLayer extends ViewBase {
		
		private var statusBar:StatusBar;
		
		public function MainLayer(mainModel:Model) {
			super(mainModel);
		}
		
		override protected function onAdded(e:Event):void {
			
			this.statusBar = new StatusBar(this.mainModel);
			this.addChild(this.statusBar);
		}
	}

}