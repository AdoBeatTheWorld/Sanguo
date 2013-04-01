package com.ado.res 
{
	import flash.display.Bitmap;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author Long.J.Du
	 */
	public class ResMapInfo 
	{
		private var walkTexture:Texture;
		private var breakTexture:Texture;
		private var attackTexture:Texture;
		
		private var walkConfig:XML;
		private var breakConfig:XML;
		private var attackConfig:XML;
		private var name:String = "";
		
		private var atlas:Object;
		public function ResMapInfo(name:String) 
		{
			this.name = name;
			atlas = { };
		}
		/**
		 * 初始化各种状态
		 * @param	walkT	行走的图片集
		 * @param	walkC	行走的xml配置文件
		 * @param	breakT
		 * @param	breakC
		 * @param	attackT
		 * @param	attckC
		 */
 		public function initStates(walkT:Bitmap, walkC:XML, breakT:Bitmap, breakC:XML, attackT:Bitmap, attckC:XML):void
		{
			var texture:Texture = Texture.fromBitmap(walkT);
			atlas[RoleState.WALK_STATE] = new TextureAtlas(texture, walkC);
			texture = Texture.fromBitmap(breakT);
			atlas[RoleState.BREAK_STATE] = new TextureAtlas(texture, breakC);
			texture = Texture.fromBitmap(attackT);
			atlas[RoleState.ATTACK_STATE] = new TextureAtlas(texture, attckC);
		}
		/**
		 * 根据状态取得对应的Atlas
		 * @see AtlasState
		 */
		public function getAtlasByState(state:String):TextureAtlas
		{
			if (atlas.hasOwnProperty(state))
			{
				return atlas[state] as TextureAtlas;
			}else {
				return null;
			}
		}
	}

}