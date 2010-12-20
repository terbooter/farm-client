package ru.terbooter.logging {
	
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public interface ILogger {
		
		function log(message:String, ...rest):void;
		function set enabled(value:Boolean):void;
		function get enabled():Boolean;
		
		function set loggingType(value:String):void;
		function get loggingType():String;
		
	}
	
}