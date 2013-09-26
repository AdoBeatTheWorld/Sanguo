package com.ado.main 
{
	import com.ado.objects.BaseCharacter;
	import com.ado.res.Res;
	import com.ado.res.RoleState;
	import com.greensock.TweenLite;
	
	import map.MapRender;
	import map.CharacterRender;
	
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
		
		public function GameMain() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			Res.initAtlas();
		}
		
		private function onAdded(e:Event):void
		{
			MapRender.getInstance().initRoot( this );
			CharacterRender.getInstance().initRoot( this );
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey);
			stage.addEventListener(TouchEvent.TOUCH, onTouched);
		}
		
		private function onKey(e:KeyboardEvent):void
		{
			/**
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
			}*/
		}
		private var targetX:Number;
		private var targetY:Number;
		private function onTouched(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage, TouchPhase.ENDED);
			if (touch)
			{
				targetX = touch.globalX;
				targetY = touch.globalY;
				/**
				var dx:Number = role.x - targetX;
				var dy:Number = role.y - targetY;
				var dist:Number = Math.sqrt(dx * dx + dy * dy);
				var time:int = dist / 40;
				role.setStatus(RoleState.WALK_STATE);
				role.direction = dx;
				TweenLite.to(role, time, {x:targetX, y:targetY, onComplete:onCom } );*/
			}
		}
		
		private function onCom():void
		{
			//role.setStatus(RoleState.BREAK_STATE);
		}
	}

}