package com.ado.res
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author Long.J.Du
	 */
	public class Res 
	{
		[Embed(source="../../../res/texture/Beauty.png")]
		public static var Beauty:Class;
		[Embed(source="../../../res/texture/Beauty.xml",mimeType="application/octet-stream")]
		public static var Beauty_Config:Class;
		
		[Embed(source="../../../res/texture/Beauty_Walk.png")]
		public static var Beauty_Walk:Class;
		[Embed(source="../../../res/texture/Beauty_Walk.xml",mimeType="application/octet-stream")]
		public static var Beauty_Walk_Config:Class;
		
		[Embed(source="../../../res/texture/Beauty_Attack.png")]
		public static var Beauty_Attack:Class;
		[Embed(source="../../../res/texture/Beauty_Attack.xml",mimeType="application/octet-stream")]
		public static var Beauty_Attack_Config:Class;
		
		[Embed(source="../../../res/texture/image2.png")]
		public static var BG:Class;
		
		[Embed(source="../../../res/texture/image3.png")]
		public static var FAR:Class;
		
		private static var atlasMap:Dictionary = new Dictionary();
		public  static function initAtlas():void
		{/**
			var beauty:ResMapInfo = new ResMapInfo("beauty");
			beauty.initStates(new Beauty_Walk as Bitmap, 
			XML(new Beauty_Walk_Config),
			new Beauty as Bitmap, 
			XML(new Beauty_Config), 
			new Beauty_Attack as Bitmap,
			XML(new Beauty_Attack_Config));
			atlasMap["beauty"] = beauty;*/
		}
		/**
		 * 根据名字和状态取得纹理数据
		 * @param	key
		 * @param	state
		 */
		public static function getAltas(key:String, state:String):TextureAtlas
		{
			if (atlasMap.hasOwnProperty(key))
			{
				var target:ResMapInfo = new ResMapInfo("beauty");
				target.initStates(new Beauty_Walk() as Bitmap, 
				XML(new Beauty_Attack_Config()), 
				new Beauty() as Bitmap, 
				XML(new Beauty_Config()), 
				new Beauty_Attack() as Bitmap, 
				XML(new Beauty_Attack_Config()));
				return target.getAtlasByState(state);
			}
			return null;
		}
		
		public static var resMap:Dictionary = new Dictionary();
	}

}