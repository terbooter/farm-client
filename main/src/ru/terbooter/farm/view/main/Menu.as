package ru.terbooter.farm.view.main {
	import flash.events.MouseEvent;
	import ru.terbooter.farm.model.Model;
	import ru.terbooter.farm.view.ViewBase;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class Menu extends ViewBase {
		
		private var skin:Menu_design;
		
		public function Menu(mainModel:Model) {
			
			super(mainModel);
			this.skin = new Menu_design();
			this.addChild(this.skin);
			
			this.skin.growButton.addEventListener(MouseEvent.CLICK, onGrow);
		}
		
		private function onGrow(e:MouseEvent):void {
			super.mainModel.commandsPool.growAll.execute();
		}
		
	}

}