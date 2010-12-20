package ru.terbooter.logging {
	import ru.terbooter.logging.commands.LoggerComand;
	import ru.terbooter.logging.commands.TraceLoggerComand;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class LoggerImpl implements ILogger {
		
		private var _enabled:Boolean;
		private var _loggingType:String;
		
		private var loggerComand:LoggerComand;
		
		public function LoggerImpl() {
			//По дефолту просто трэйсим
			this.loggingType = LoggingTypes.TRACE;
			//Логгер включен по дефолту
			this.enabled = true;
		}
		
		/* INTERFACE ru.terbooter.logging.ILogger */
		
		public function log(message:String, ...rest):void{
			if (!_enabled) {
				return;
			}
			
			var params:Array;
			if (rest) {
				params = rest;
				params.unshift(message);
			}else {
				params = [message];
			}
			this.loggerComand.log.apply(null, params);
		}
		
		
		public function get enabled():Boolean { return _enabled; }
		
		public function set enabled(value:Boolean):void {
			_enabled = value;
		}
		
		public function get loggingType():String { return _loggingType; }
		
		public function set loggingType(value:String):void {
			
			switch (value) {
				case LoggingTypes.TRACE:
					this.loggerComand = new TraceLoggerComand();
				break;
				
				case LoggingTypes.SERVER:
				break;
				
				default:
					throw new Error("Unknown loggin type :"+value);
				break;
			}
			_loggingType = value;
			
		}
		
	}

}