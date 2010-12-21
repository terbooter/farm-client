package ru.terbooter.farm.vos {
	/**
	 * Value Object описывающий пользователя в игре
	 * @author terbooter.ru
	 */
	public class UserVO {
		
		/**
		 * id в социальной сети
		 */
		public var id:String;
		
		/**
		 * Количество игровых денег
		 */
		public var money:int;
		
		/**
		 * Размер поля по Х
		 */
		public var size_x:int;
		
		/**
		 * Размер поля по Y
		 */
		public var size_y:int;
		
		public function UserVO() {
			
		}
		
	}

}