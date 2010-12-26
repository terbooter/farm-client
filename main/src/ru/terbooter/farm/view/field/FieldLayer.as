package ru.terbooter.farm.view.field {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import ru.terbooter.farm.model.Model;
	import ru.terbooter.farm.view.ViewBase;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	
	 //TODO Функционал таскания поля будет в этом классе
	public class FieldLayer extends ViewBase {
		
		private var field:Field;
		private var clickPoint:Point = new Point(0, 0);
		
		public function FieldLayer(mainModel:Model) {
			super(mainModel);
			this.field = new Field(super.mainModel);
			this.addChild(this.field);
			
			//TODO слушать еще роловер
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		private function onMouseUp(e:MouseEvent):void {
			this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onMouseDown(e:MouseEvent):void {
			this.clickPoint.x = this.mouseX-this.field.x;
			this.clickPoint.y = this.mouseY-this.field.y;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void {
			//TODO оптимизировать
			this.field.x = this.mouseX-this.clickPoint.x;
			this.field.y = this.mouseY-this.clickPoint.y;
			 //= this.mouseX;
			 
			if (this.field.x > 0) {
				this.field.x = 0;
			}
			if (this.field.y > 0) {
				this.field.y = 0;
			}
			
			if (this.field.x < 1000 - this.field.width) {
				this.field.x = 1000 - this.field.width;
			}
			if (this.field.y < 800 - this.field.height) {
				this.field.y = 800 - this.field.height;
			}
			
			//if(this.field.x)
		}
		
		override protected function onAdded(e:Event):void {
			
		}
		
	}

}