package ru.terbooter.farm.model.data {
	import ru.terbooter.farm.commands.CommandBase;
	import ru.terbooter.farm.commands.user.CropPlant;
	import ru.terbooter.farm.commands.user.FieldClick;
	import ru.terbooter.farm.commands.user.SeedPlant;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class CommandsPool {
		
		public var growAll:CommandBase;
		public var seedPlant:SeedPlant;
		public var cropPlant:CropPlant;
		public var fieldClick:FieldClick;
		
		public function CommandsPool() {
			
		}
		
	}

}