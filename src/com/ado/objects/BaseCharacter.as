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
		
		private var mc:MovieClip;
		
		//当前加载的的状态
		private var currentLoading:String;
		//当前键值
		private var currentKey:String;
		
		private var texture:Texture;
		private var xml:XML;
	
		public function BaseCharacter() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			
		}
		
		/**
		 * 通过传入现成的数据进行显示
		 * */
		public function displayByData(config:XML, texture:Texture,status:String):void
		{
			
		}
	
		private function onAdded(e:starling.events.Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			setStatus(RoleState.BREAK_STATE);
		}
		/** 
		 * 
		 * */
		public function setStatus(value:String):void
		{
			if (value == status) return;
			
			status = value;
			if(mc)	mc.dispose();
			removeChild(mc);
			if (value == RoleState.BREAK_STATE)
			{
				antlas = new TextureAtlas(Texture.fromBitmap(new Res.Beauty as Bitmap), XML(new Res.Beauty_Config));
				mc = new MovieClip(antlas.getTextures("sprite 44"), 24);
				mc.loop = true;
			}else if (value == RoleState.ATTACK_STATE)
			{
				antlas = new TextureAtlas(Texture.fromBitmap(new Res.Beauty_Attack as Bitmap), XML(new Res.Beauty_Attack_Config));
				mc = new MovieClip(antlas.getTextures("sprite 85"), 24);
				mc.loop = false;
				stage.addEventListener(Event.ENTER_FRAME, onEnter);
			}else if (value == RoleState.WALK_STATE)
			{
				antlas = new TextureAtlas(Texture.fromBitmap(new Res.Beauty_Walk as Bitmap), XML(new Res.Beauty_Walk_Config));
				mc = new MovieClip(antlas.getTextures("sprite 73"), 24);
				mc.loop = true;
			}
			mc.x = -mc.width >> 1;// + (status == RoleState.ATTACK_STATE ? 5 : 0);
			mc.y - mc.height;// + (status == RoleState.ATTACK_STATE ? 5 : 0);
			addChild(mc);
			Starling.juggler.add(mc);
		}
		private function onEnter(e:Event):void
		{
			if (mc.isComplete)
			{
				stage.removeEventListener(Event.ENTER_FRAME, onEnter);
				setStatus(RoleState.BREAK_STATE);
			}
		}
		public function goto(_tx:Number,_ty:Number):void
		{
			
		}
	}

}