package com.ado.objects 
{
	import com.ado.res.RoleState;
	import com.ado.res.Res;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.TextureAtlas;
	
	/**
	 * ...
	 * @author Long.J.Du
	 */
	public class BaseCharacter extends Sprite 
	{
		//0 休息 1 行走 2 攻击
		private var status:String = "";
		
		private var antlas:TextureAtlas;
		
		private var walkMc:MovieClip;
		private var breakMc:MovieClip;
		private var attackMc:MovieClip;
		public function BaseCharacter() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		private function onAdded(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			antlas = new TextureAtlas(Texture.fromBitmap(new Res.Beauty as Bitmap), XML(new Res.Beauty_Config));
			breakMc = new MovieClip(antlas.getTextures("sprite 44"), 24);
			Starling.juggler.add(breakMc);
			breakMc.play();
			breakMc.x = breakMc.width >> 1;
			breakMc.y = -breakMc.height;
			addChild(breakMc);
		}
		/** 
		 * 
		 * */
		public function setStatus(value:String):void
		{
			if (value == status) return;
			
			status = value;
			
			breakMc.dispose();
				removeChild(breakMc);
			if (value == RoleState.BREAK_STATE)
			{
				antlas = new TextureAtlas(Texture.fromBitmap(new Res.Beauty as Bitmap), XML(new Res.Beauty_Config));
				breakMc = new MovieClip(antlas.getTextures("sprite 44"), 24);
			}else if (value == RoleState.ATTACK_STATE)
			{
				breakMc.dispose();
				antlas = new TextureAtlas(Texture.fromBitmap(new Res.Beauty_Attack as Bitmap), XML(new Res.Beauty_Attack_Config));
				breakMc = new MovieClip(antlas.getTextures("sprite 85"), 24);
			}else if (value == RoleState.WALK_STATE)
			{
				breakMc.dispose();
				antlas = new TextureAtlas(Texture.fromBitmap(new Res.Beauty_Walk as Bitmap), XML(new Res.Beauty_Walk_Config));
				breakMc = new MovieClip(antlas.getTextures("sprite 73"), 24);
			}
			breakMc.x = -breakMc.width >> 1;
			breakMc.y - breakMc.height;
			addChild(breakMc);
			Starling.juggler.add(breakMc);
		}
		public function goto(_tx:Number,_ty:Number):void
		{
			
		}
	}

}