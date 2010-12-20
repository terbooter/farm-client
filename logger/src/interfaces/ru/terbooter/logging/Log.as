package ru.terbooter.logging {
	/**
	 * ...
	 * @author 
	 */
	public class Log {
		
		private static var _instance:ILogger;
		
		public function Log() {
			throw new Error("This is logger factory. Use Log.instance instead new");
		}
		
		static public function get instance():ILogger { 
			if (!_instance) {
				_instance = new LoggerImpl();
			}
			return _instance; 
		}
		
	}

}