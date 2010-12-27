package ru.terbooter.farm.vos {
	/**
	 * Описывает объект на поле
	 * @author terbooter.ru
	 */
	public class FieldObjectVO {
		
		/**
		 * Id в БД
		 */
		public var id:String;
		
		public var user_id:String;
		
		/**
		 * Тип объекта (клевер, подсолнух, собачья будка и тд)
		 */
		public var type_id:String;
		public var x:int;
		public var y:int;
		
		/**
		 * Таймстэмп окончания процесса
		 */
		public var process_end:int;
		
		/**
		 * Стадия роста ростения
		 */
		public var grow_period:int;
		
		
		public function FieldObjectVO() {
			
		}
		
	}

}