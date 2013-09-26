package map 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import com.ado.res.Res;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author ...
	 */
	public class MapRender 
	{
		private var nearSight:Image;
		private var farSight:Image;
		private var root:Sprite;
		private var mapWidth:int;
		private var mapHeight:int;
		
		private static var _instance:MapRender;
		
		public function MapRender() 
		{
			
		}
		
		public function initRoot( _root:Sprite ) :void
		{
			root = _root;
			nearSight = new Image(Texture.fromBitmap(Bitmap(new Res.BG)));
			root.addChild( nearSight );
			farSight = new Image(Texture.fromBitmap(Bitmap(new Res.FAR)));
			root.addChild( farSight );
			mapWidth = nearSight.width;
			mapHeight = nearSight.height;
		}
		
		public function render():void
		{
			
		}
		
		public static function getInstance():MapRender
		{
			if ( _instance == null )
			{
				_instance = new MapRender();
			}
			return _instance;
		}
	}

}