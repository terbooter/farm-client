package ru.terbooter.farm.view {
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import ru.terbooter.farm.model.Model;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class ViewBase extends Sprite{
		
		protected var mainModel:Model;
		
		public function ViewBase(mainModel:Model) {
			super();
			
			this.constructor(mainModel);
		}
		
		//Вынесем в отдельный метод чтобы работал JIT
		private function constructor(mainModel:Model):void{
			this.mainModel = mainModel;
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		protected function onAdded(e:Event):void {
			//throw new Error("You must override this method in class:  " + getQualifiedClassName(this));
		}
		
		
	}

}