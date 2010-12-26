package ru.terbooter.farm.view.field {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
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
		
		
		private var w:Number = 100;
		private var h:Number = 50;
		
		private var x0:int = 743-w/2;
		private var y0:int = 102;
		
		private var overObject:FieldObject;
		
		private var map:Sprite = new Sprite();
		
		public function Field(mainModel:Model) {
			this.bg = new FieldBG_design();
			this.addChild(this.bg);
			
			this.addChild(this.map);
			this.map.x = this.x0;
			this.map.y = this.y0;
			
			this.field = Utils.create2dArray(10, 10);
			
			this.mainModel = mainModel;
			this.mainModel.addEventListener(DataEvent.UPDATE_FIELD, onUpdateField);
			
			this.map.addEventListener(MouseEvent.MOUSE_MOVE, onMouseOver);
		}
		
		private function onMouseOver(e:Event):void {
			var p:Point = this.screen2isometric(this.mouseX, this.mouseY);
			
			if (p.x >= 0 && p.y >= 0) {
				var o:FieldObject = FieldObject(field[p.x][p.y]);
			}
			
			if (o) {
				o.over();
			}
			if (this.overObject) {
				if (this.overObject !== o) {
					this.overObject.out();
					
				}
				
			}
			this.overObject = o;
			
		}
		
		private function onMouseDown(e:MouseEvent):void {
			
		}
		
		private function onUpdateField(e:DataEvent):void {
			trace("ru.terbooter.farm.view.field.Field::onUpdateField");
			
			var modelField:Array = this.mainModel.fieldData.field;
			var o:FieldObject;
			var vo:FieldObjectVO;
			
			for (var xi:int = 0; xi < modelField.length; xi++) {
				for (var yi:int = 0; yi < modelField[0].length; yi++) {
					vo = FieldObjectVO(modelField[xi][yi]);
					
					if (!field[xi][yi]) {
						field[xi][yi] = new FieldObject(this.mainModel.imageData);
						this.map.addChild(field[xi][yi] as Sprite);
						
						(field[xi][yi]).x = (xi - yi) * w / 2;
						(field[xi][yi]).y = (xi + yi) * h / 2;
					}
					o = FieldObject(field[xi][yi]);
					if (vo == null) {
						vo = new FieldObjectVO();
						vo.x = xi;
						vo.y = yi;
						vo.type_id = '0';
					}
						
					o.setSetFildObjectVO(vo);
					
				}
			}
		}
		
		private function screen2isometric(sx:Number, sy:Number):Point { 
			//var localPoint:Point = this.map.globalToLocal(new Point(sx,sy)); 
			var localPoint:Point = new Point(sx-this.map.x, sy-this.map.y);
			sx = localPoint.x - w / 2; 
			sy = localPoint.y;
		    var ix:Number = Math.floor((sy * w + sx * h) / (h * w)); 
			var iy:Number = Math.floor((sy * w - sx * h) / (h * w));  
			
			return new Point(ix, iy); 
		}
		
		private function isometric2screen(ix:int, iy:int):Point {
			
			var sx:Number = (iy + ix) * h / 2;
			var sy:Number = (iy - ix) * w / 2;
			
			return new Point(sx, sy);
		}
		
		
		private function createIsoGrid():void {
			
		}
		
	}

}