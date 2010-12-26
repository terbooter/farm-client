package ru.terbooter.farm.model.utils {
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class Utils{
		
		public function Utils() {
			
		}
		
		/**
		 * Создадим двумерный массив
		 * @param	maxX
		 * @param	maxY
		 * @return
		 */
		public static function create2dArray(maxX:int, maxY:int):Array {
			var ar:Array = new Array(maxX);
			for (var i:int = 0; i < maxX; i++) {
				ar[i] = new Array(maxY);
			}
			
			return ar;
		}
		
	}

}