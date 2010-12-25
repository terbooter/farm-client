package ru.terbooter.farm.model.data {
	import flash.events.Event;
	
	/**
	 * События которые диспатчит модель
	 * @author terbooter.ru
	 */
	public class DataEvent extends Event {
		
		/**
		 * Модель успешно поднялась.
		 * Если нет то причина прилетит в ошибке
		 */
		public static const MODEL_IS_UP:String = "MODEL_IS_UP";
		
		/**
		 * Обновилась информация обо мне (деньги, опыт и тд)
		 */
		public static const UPDATE_ME:String = "UPDATE_ME";
		
		/**
		 * Универсальное поле. Тип данных зависит  от типа события
		 * (Лучше использовать сигналы)
		 */
		public var data:*;
		
		public function DataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) { 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event { 
			return new DataEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String { 
			return formatToString("DataEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}