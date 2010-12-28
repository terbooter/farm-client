package ru.terbooter.farm.view.main {
	import fl.controls.RadioButton;
	import fl.controls.RadioButtonGroup;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import ru.terbooter.farm.model.data.DataEvent;
	import ru.terbooter.farm.model.data.HandData;
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
			
			super.mainModel.addEventListener(DataEvent.UPDATE_HAND_STATE, onHandState);
			
			this.skin.freeRB.selected = true;
			
			var group:RadioButtonGroup = new RadioButtonGroup("menu");
			this.skin.freeRB.group = group;
			this.skin.potatoRB.group = group;
			this.skin.cloverRB.group = group;
			this.skin.sunflowerRB.group = group;
			this.skin.cropRB.group = group;
			
			group.addEventListener(Event.CHANGE, onRBChange);
		}
		
		private function onRBChange(e:Event):void {
			trace("onRBChange: " + this.skin.freeRB.selected);
			if (this.skin.freeRB.selected) {
				this.mainModel.handData.state = HandData.NO_ACTION;
			}else if (this.skin.potatoRB.selected) {
				this.mainModel.handData.state = HandData.SEED;
				this.mainModel.handData.seedObjectType = HandData.POTATOE;
			}else if (this.skin.cloverRB.selected) {
				this.mainModel.handData.state = HandData.SEED;
				this.mainModel.handData.seedObjectType = HandData.CLOWER;
			}else if (this.skin.sunflowerRB.selected) {
				this.mainModel.handData.state = HandData.SEED;
				this.mainModel.handData.seedObjectType = HandData.SUNFLOWER;
			}else if (this.skin.cropRB.selected) {
				this.mainModel.handData.state = HandData.CROP;
			}
		}
		
		private function onHandState(e:DataEvent):void {
			var s:String = super.mainModel.handData.state;
		}
		
		
		private function onGrow(e:MouseEvent):void {
			super.mainModel.commandsPool.growAll.execute();
		}
		
	}

}