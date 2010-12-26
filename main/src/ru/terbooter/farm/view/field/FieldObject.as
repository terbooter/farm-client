package ru.terbooter.farm.view.field {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import ru.terbooter.farm.model.data.ImageData;
	import ru.terbooter.farm.vos.FieldObjectVO;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class FieldObject extends Sprite {
		
		private var placeHolder:Sprite = new ISOPlaceHolder_design();
		private var vo:FieldObjectVO;
		
		private var fieldX:int;
		private var fieldY:int;
		private var skin:DisplayObject;
		
		private var imageData:ImageData;
		
		/*x = (j-i) * w / 2; 
		y = (i+j) * h / 2;  */
		
		public function FieldObject(imageData:ImageData) {
			this.imageData = imageData;
		}
		
		public function setSetFildObjectVO(fieldObjectVO:FieldObjectVO):void {
			this.vo = fieldObjectVO;
			
			this.fieldX = (vo.y - vo.x) * this.placeHolder.width / 2;
			this.fieldY = (vo.y + vo.x) * this.placeHolder.height / 2;
			this.addChild(this.placeHolder);
			
			this.imageData.getImage(this.vo, this.imageReady);
		}
		
		private function imageReady(o:Object):void {
			//return;
			trace("ru.terbooter.farm.view.field.FieldObject::imageReady", o);
			var bitmap:Bitmap = Bitmap(o);
			var bitmapdata:BitmapData = bitmap.bitmapData;
			
			this.skin = new Bitmap(bitmapdata);
			this.addChild(this.skin);
			this.skin.y = -this.skin.height+50;
			var rect:Rectangle = this.skin.getBounds(this);
			var b:Sprite = new Sprite();
			b.graphics.lineStyle(1);
			b.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
			this.addChild(b);
		}
		
		/*override public function get x():Number {
			return this.fieldX; 
		}
		
		override public function get y():Number { 
			return this.fieldY; 
		}*/
		
		
	}

}