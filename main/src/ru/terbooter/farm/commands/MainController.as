package ru.terbooter.farm.commands {
	import flash.display.Sprite;
	import ru.terbooter.connector.Connector;
	import ru.terbooter.connector.IConnector;
	import ru.terbooter.farm.commands.init.StartApp;
	import ru.terbooter.farm.commands.user.CropPlant;
	import ru.terbooter.farm.commands.user.FieldClick;
	import ru.terbooter.farm.commands.user.GrowAll;
	import ru.terbooter.farm.commands.user.SeedPlant;
	import ru.terbooter.farm.model.data.AppData;
	import ru.terbooter.farm.model.data.CommandsPool;
	import ru.terbooter.farm.model.Model;
	import ru.terbooter.farm.view.Layout;
	import ru.terbooter.server_api.IServerAPI;
	import ru.terbooter.server_api.ServerAPI;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class MainController {
		
		private var root:Sprite;
		
		public function MainController(root:Sprite) {
			this.root = root;
		}
		
		public function execute():void {
			
			var appData:AppData = new AppData(this.root.loaderInfo.parameters);
			var connection:IConnector = new Connector(appData.serverURL);
			var serverApi:IServerAPI = new ServerAPI(connection, appData.uid);
			
			var mainModel:Model = new Model(appData, serverApi);
			var layout:Layout = new Layout(mainModel);
			root.addChild(layout);
			
			mainModel.commandsPool = new CommandsPool();
			mainModel.commandsPool.growAll = new GrowAll(mainModel, serverApi);
			mainModel.commandsPool.seedPlant = new SeedPlant(mainModel, serverApi);
			mainModel.commandsPool.cropPlant = new CropPlant(mainModel, serverApi);
			mainModel.commandsPool.fieldClick = new FieldClick(mainModel);
			
			var start:CommandBase = new StartApp(mainModel, serverApi);
			start.execute();
			
			
		}
		
	}

}