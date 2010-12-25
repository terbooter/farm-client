package ru.terbooter.farm.commands {
	import ru.terbooter.farm.model.Model;
	import ru.terbooter.server_api.IServerAPI;
	/**
	 * 
	 * @author terbooter.ru
	 */
	public class CommandBase {
		
		protected var mainModel:Model;
		
		
		public function CommandBase(mainModel:Model) {
			
		}
		
		public function execute():void {
			
		}
		
	}

}