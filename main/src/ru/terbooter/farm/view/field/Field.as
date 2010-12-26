package ru.terbooter.farm.view.field {
	import flash.display.Sprite;
	import flash.events.Event;
	import ru.terbooter.farm.model.data.DataEvent;
	import ru.terbooter.farm.model.Model;
	import ru.terbooter.farm.model.utils.Utils;
	import ru.terbooter.farm.vos.FieldObjectVO;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class Field extends Sprite {
		
		private var mainModel:Model;
		private var bg:Sprite;
		private var field:Array;
		
		
		private var w:Number = 50;
		private var h:Number = 25;
		
		private var x0:int = 743-w;
		private var y0:int = 102;
		
		public function Field(mainModel:Model) {
			this.bg = new FieldBG_design();
			this.addChild(this.bg);
			
			this.field = Utils.create2dArray(10, 10);
			
			this.mainModel = mainModel;
			this.mainModel.addEventListener(DataEvent.UPDATE_FIELD, onUpdateField);
		}
		
		private function onUpdateField(e:DataEvent):void {
			trace("ru.terbooter.farm.view.field.Field::onUpdateField");
			
			var modelField:Array = this.mainModel.fieldData.field;
			var o:FieldObject;
			var vo:FieldObjectVO;
			
			for (var xi:int = 0; xi < modelField.length; xi++) {
				for (var yi:int = 0; yi < modelField[0].length; yi++) {
					vo = FieldObjectVO(modelField[xi][yi]);
					
					//Если у модели в этих координатах есть
					// данные
					if (vo != null) {
						if (!field[xi][yi]) {
							field[xi][yi] = new FieldObject(this.mainModel.imageData);
							this.addChild(field[xi][yi] as Sprite);
						}
						
						(field[xi][yi]).x = this.x0 + (vo.y - vo.x) * w;
						(field[xi][yi]).y = this.y0 + (vo.y + vo.x) * h;
						o = FieldObject(field[xi][yi]);
						o.setSetFildObjectVO(vo);
					}
					//
					//
				}
			}
		}
		
		
		private function createIsoGrid():void {
			
		}
		
	}

}