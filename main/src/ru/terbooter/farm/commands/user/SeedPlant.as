package ru.terbooter.farm.commands.user {
	import ru.terbooter.farm.commands.CommandBase;
	import ru.terbooter.farm.model.Model;
	import ru.terbooter.farm.vos.FieldObjectVO;
	import ru.terbooter.server_api.IServerAPI;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class SeedPlant extends CommandBase {
		
		private var api:IServerAPI;
		private var fieldObjectVO:FieldObjectVO;
		
		public function SeedPlant(mainModel:Model, api:IServerAPI) {
			super(mainModel);
			this.api = api;
		}
		
		public function setFieldObject(fo:FieldObjectVO):void {
			this.fieldObjectVO = fo;
		}
		
		override public function execute():void {
			if (!this.fieldObjectVO) {
				return;
			}
			this.api.field_seed(this.fieldObjectVO.x, this.fieldObjectVO.y, parseInt(this.fieldObjectVO.type_id));
			this.fieldObjectVO = null;
		}
		
	}

}