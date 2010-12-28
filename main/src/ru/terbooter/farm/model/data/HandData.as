package ru.terbooter.farm.model.data {
	import ru.terbooter.farm.model.ModelBase;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class HandData extends ModelBase {
		
		public static const NO_ACTION:String = "NO_ACTION";
		public static const SEED:String = "SEED";
		public static const CROP:String = "CROP";
		
		public static const POTATOE:String = "2";
		public static const CLOWER:String = "1";
		public static const SUNFLOWER:String = "3";
		
		private var _seedObjectType:String;
		
		private var _state:String;
		
		public function HandData() {
			this.state = HandData.NO_ACTION;
		}
		
		public function get state():String { return _state; }
		
		public function set state(value:String):void {
			_state = value;
			this.dispatchEvent(new DataEvent(DataEvent.UPDATE_HAND_STATE));
		}
		
		public function get seedObjectType():String { return _seedObjectType; }
		
		public function set seedObjectType(value:String):void {
			_seedObjectType = value;
		}
		
	}

}