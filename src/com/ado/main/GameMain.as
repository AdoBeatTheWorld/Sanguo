package com.ado.main 
{
	import com.ado.objects.BaseCharacter;
	import com.ado.res.Res;
	import com.ado.res.RoleState;
	import com.greensock.TweenLite;
	import flash.display.Bitmap;
	import flash.ui.Keyboard;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.utils.Color;
	
	/**
	 * ...
	 * @author Long.J.Du
	 */
	public class GameMain extends Sprite 
	{
		private var role:BaseCharacter;
		private var map:Image;
		private var farSight:Image;
		public function GameMain() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			Res.initAtlas();
			role = new BaseCharacter;
		}
		private function onAdded(e:Event):void
		{
			farSight = new Image(Texture.fromBitmap(Bitmap(new Res.FAR)));
			map = new Image(Texture.fromBitmap(Bitmap(new Res.BG)));
			addChild(map);
			
			addChild(role);
			role.x = stage.stageWidth - role.width >> 1;
			role.y = stage.stageHeight - role.height >> 1;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey);
			stage.addEventListener(TouchEvent.TOUCH, onTouched);
		}
		private function onKey(e:KeyboardEvent):void
		{
			trace(e.keyCode);
			switch(e.keyCode)
			{
				case Keyboard.W:
					role.setStatus(RoleState.WALK_STATE);
					break;
				case Keyboard.A:
					role.setStatus(RoleState.ATTACK_STATE);
					break;
				case Keyboard.S:
					role.setStatus(RoleState.BREAK_STATE);
					break;
				default:
					break;
			}
		}
		private var targetX:Number;
		private var targetY:Number;
		private function onTouched(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage, TouchPhase.ENDED);
			if (touch)
			{
				trace("Don't touch me..");
				targetX = touch.globalX;
				targetY = touch.globalY;
				var dx:Number = role.x - targetX;
				var dy:Number = role.y - targetY;
				var dist:Number = Math.sqrt(dx * dx + dy * dy);
				var time:int = dist / 20;
				role.setStatus(RoleState.WALK_STATE);
				TweenLite.to(role, time, {x:targetX, y:targetY } );
			}
		}
	}

}