package ru.terbooter.farm.view {
	import flash.display.Sprite;
	import ru.terbooter.farm.model.Model;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class ViewBase extends Sprite{
		
		protected var mainModel:Model;
		
		public function ViewBase(mainModel:Model) {
			this.mainModel = mainModel;
			super();
		}
		
	}

}