package map 
{
	import com.ado.objects.BaseCharacter;
	import starling.display.Sprite;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author ...
	 */
	public class CharacterRender 
	{
		private var root:Sprite;
		private static var _instance:CharacterRender;
		
		private var self:BaseCharacter;
		private var others:Vector.<BaseCharacter>;
		public function CharacterRender() 
		{
			
		}
		
		private function init():void
		{
			others = new Vector.<BaseCharacter>();
		}
		
		private function initSelf():void
		{
			self = new BaseCharacter;
			root.addChild(self);
		}
		
		public function initRoot( _root:Sprite ):void
		{
			root = _root;
			init();
			initSelf();
		}
		
		public static function getInstance():CharacterRender
		{
			if ( _instance == null )
			{
				_instance = new CharacterRender();
			}
			
			return _instance;
		}
	}

}