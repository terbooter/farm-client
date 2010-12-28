package ru.terbooter.farm.commands.user {
	import ru.terbooter.farm.commands.CommandBase;
	import ru.terbooter.farm.model.Model;
	import ru.terbooter.farm.vos.FieldObjectVO;
	import ru.terbooter.server_api.IServerAPI;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class CropPlant extends CommandBase {
		
		private var api:IServerAPI;
		private var fieldObjectVO:FieldObjectVO;
		
		public function CropPlant(mainModel:Model, api:IServerAPI) {
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
			this.api.field_crop(this.fieldObjectVO.id);
			this.fieldObjectVO = null;
		}
		
	}

}