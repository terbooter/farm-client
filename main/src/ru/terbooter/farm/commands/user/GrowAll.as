package ru.terbooter.farm.commands.user {
	import ru.terbooter.farm.commands.CommandBase;
	import ru.terbooter.farm.model.Model;
	import ru.terbooter.server_api.IServerAPI;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class GrowAll extends CommandBase {
		
		private var api:IServerAPI;
		
		public function GrowAll(mainModel:Model, api:IServerAPI) {
			super(mainModel);
			this.api = api;
		}
		
		override public function execute():void {
			trace("ru.terbooter.farm.commands.user.GrowAll::execute");
			this.api.field_grow();
		}
		
	}

}