package ru.terbooter.farm.model {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	import ru.terbooter.farm.model.events.HelperEvent;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class ModelBase extends EventDispatcher {
		
		private var dictionary:Dictionary;
		
		public function ModelBase() {
			
		}
		
		/**
		 * От каждого ребенка событие будет всплывать
		 * до рутовой модели
		 * @param	child
		 */
		protected function addChild(child:ModelBase):void {
			if (!this.dictionary) {
				this.dictionary = new Dictionary(true);
			}
			
			child.addEventListener(HelperEvent.LISTEN_TO, helperListener);
			//TODO
			this.dictionary[child] = { };
			
		}
		
		protected function removeChild(child:ModelBase):void {
			//TODO
		}
		
		/**
		 * Перед основным событием диспатчим вспомогательное,
		 * которое расскажет паренту, какой тип события слушать,
		 * чтобы передать его дальше по цепочке
		 * @param	event
		 * @return
		 */
		override public function dispatchEvent(event:Event):Boolean {
			var helper:HelperEvent = new HelperEvent(HelperEvent.LISTEN_TO);
			helper.eventToListen = event;
			super.dispatchEvent(helper);
			return super.dispatchEvent(event);
		}
		
		private function helperListener(e:HelperEvent):void {
			var dispatcher:EventDispatcher = EventDispatcher(e.target);
			dispatcher.addEventListener(e.eventToListen.type, bubbleListener);
		}
		
		private function bubbleListener(e:Event):void {
			//TODO
			this.dictionary[e.target][e.type] = 1;
			this.dispatchEvent(e);
		}
		
		
	}

}