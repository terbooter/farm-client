package ru.terbooter.logging.commands {
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class TraceLoggerComand extends LoggerComand{
		
		public function TraceLoggerComand() {
			
		}
		
		override public function log(m:String, ...rest):void {
			var message:String = m;
			for (var i:int = 0; i < rest.length; i++) {
				message += " , " + String(rest[i]);
			}
			trace(message);
		}
		
	}

}