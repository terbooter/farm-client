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
		private var menu:Menu;
		
		public function MainLayer(mainModel:Model) {
			super(mainModel);
		}
		
		override protected function onAdded(e:Event):void {
			
			this.statusBar = new StatusBar(super.mainModel);
			this.addChild(this.statusBar);
			
			this.menu = new Menu(super.mainModel);
			this.addChild(this.menu);
			this.menu.y = this.root.stage.stageHeight - this.menu.height;
			trace(menu.y);
			this.menu.y = 615;
		}
	}

}