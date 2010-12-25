package ru.terbooter.farm.commands.init {
	import ru.terbooter.farm.commands.CommandBase;
	import ru.terbooter.farm.model.Model;
	import ru.terbooter.server_api.IServerAPI;
	/**
	 * Стартуем приложение.
	 *	Шлем дефолтные запросы на сервер
	 * @author terbooter.ru
	 */
	
	public class StartApp extends CommandBase {
		
		private var api:IServerAPI;
		
		public function StartApp(mainModel:Model, api:IServerAPI) {
			super(mainModel);
			this.api = api;
		}
		
		override public function execute():void {
			this.api.user_restore();
		}
		
	}

}