package ru.terbooter.farm.commands.user {
	import flash.geom.Point;
	import ru.terbooter.farm.commands.CommandBase;
	import ru.terbooter.farm.model.data.HandData;
	import ru.terbooter.farm.model.Model;
	import ru.terbooter.farm.vos.FieldObjectVO;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class FieldClick extends CommandBase {
		
		private var point:Point;
		
		public function FieldClick(mainModel:Model) {
			super(mainModel);
		}
		
		public function setPoint(p:Point):void {
			
			this.point = p;
		}
		
		override public function execute():void {
			if (!this.point) {
				return;
			}
			
			if (super.mainModel.handData.state == HandData.NO_ACTION) {
				return;
			}
			
			var fo:FieldObjectVO;
			if (super.mainModel.handData.state == HandData.SEED) {
				fo = new FieldObjectVO();
				fo.type_id = super.mainModel.handData.seedObjectType;
				trace("ru.terbooter.farm.commands.user.FieldClick::execute", fo.type_id);
				fo.x = this.point.x;
				fo.y = this.point.y;
				
				this.mainModel.commandsPool.seedPlant.setFieldObject(fo);
				this.mainModel.commandsPool.seedPlant.execute();
			}
			
			if (super.mainModel.handData.state == HandData.CROP) {
				fo = this.mainModel.fieldData.getFieldObjectVO(this.point.x, this.point.y);
				
				if (fo) {
					this.mainModel.commandsPool.cropPlant.setFieldObject(fo);
					this.mainModel.commandsPool.cropPlant.execute();
				}
			}
			
		}
		
	}

}