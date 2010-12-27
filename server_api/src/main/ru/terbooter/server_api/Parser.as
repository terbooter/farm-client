package ru.terbooter.server_api {
	import ru.terbooter.farm.vos.FieldObjectVO;
	import ru.terbooter.farm.vos.UserVO;
	/**
	 * ...
	 * @author terbooter.ru
	 */
	public class Parser{
		
		public function Parser() {
			
		}
		
		public static function parseUserVO(xml:XML):UserVO {
			/*<Response c="user">
			<id>1</id>
			<money>111</money>
			  <size_x>0</size_x>
			  <size_y>0</size_y>
			</Response>*/
			//trace(xml.money.toString());
			var u:UserVO = new UserVO();
			u.id = xml.id.toString();
			u.money = xml.money.toString();
			u.size_x = parseInt(xml.size_x.toString());
			u.size_y = parseInt(xml.size_y.toString());
			return u;
			
		}
		
		public static function parseField(xml:XML):Array {
			
			var field:XMLList = xml.Field;
			var total:int = field.children().length();
			var f:FieldObjectVO;
			var ar:Array = [];
			for (var i:int = 0; i < total; i++) {
				trace(i);
				f = Parser.parseFieldObjectVO(field.child("obj")[i]);
				ar.push(f);
			}
			
			/*<Response c="field">
			  <Field>
				<obj>
				  <id>1</id>
				  <x>0</x>
				  <y>0</y>
				  <type_id>1</type_id>
				  <process_end>12121212</process_end>
				</obj>
				<obj>
				  <id>2</id>
				  <x>1</x>
				  <y>1</y>
				  <type_id>1</type_id>
				  <process_end>232323</process_end>
				</obj>
			  </Field>
			</Response>*/
			
			return ar;
			
		}
		
		public static function parseFieldObjectVO(xml:XML):FieldObjectVO {
			    /*<obj>
				  <x>0</x>
				  <y>0</y>
				  <type_id>1</type_id>
				  <process_end>12121212</process_end>
				</obj>*/
			var f:FieldObjectVO = new FieldObjectVO();
			f.id = xml.id.toString();
			f.type_id = xml.type_id.toString();
			f.process_end = parseInt(xml.process_end.toString());
			f.x = parseInt(xml.x.toString());
			f.y = parseInt(xml.y.toString());
			f.grow_period = parseInt(xml.grow_period.toString());
			return f;
		}
		
	}

}