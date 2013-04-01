package com.ado.main
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.TextField;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Long.J.Du
	 */
	 
	public class Main extends Sprite 
	{
		private var entry:Starling;
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			//stage.addEventListener(Event.DEACTIVATE, deactivate);
			addEventListener(Event.ENTER_FRAME, render);
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// entry point
			entry = new Starling(GameMain, this.stage);
			entry.start();
			// new to AIR? please read *carefully* the readme.txt files!
		}
		private function render(e:Event):void
		{
			entry.render();
		}
		private function deactivate(e:Event):void 
		{
			// auto-close
			NativeApplication.nativeApplication.exit();
		}
		
	}
	
}