package ru.terbooter.farm.view.main {
	import flash.events.Event;
	import ru.terbooter.farm.model.data.DataEvent;
	import ru.terbooter.farm.model.Model;
	import ru.terbooter.farm.view.ViewBase;
	import ru.terbooter.farm.vos.UserVO;
	/**
	 * Статус бар юзера.
	 * Отображает текущую информацию о деньгах, опыте, уровне и тд
	 * @author terbooter.ru
	 */
	public class StatusBar extends ViewBase {
		
		private var skin:StatusBar_design;
		
		public function StatusBar(mainModel:Model) {
			super(mainModel);
			
			mainModel.addEventListener(DataEvent.UPDATE_ME, onUpdateMe);
		}
		
		override protected function onAdded(e:Event):void {
			
			this.skin = new StatusBar_design();
			this.addChild(this.skin);
			this.update(this.mainModel.meData.me);
		}
		
		private function onUpdateMe(e:DataEvent):void {
			this.update(this.mainModel.meData.me);
		}
		
		private function update(me:UserVO):void {
			if (!me) {
				this.skin.moneyTF.text = "--";
				return;
			}
			
			this.skin.moneyTF.text = me.money.toString();
		}
		
		
	}

}