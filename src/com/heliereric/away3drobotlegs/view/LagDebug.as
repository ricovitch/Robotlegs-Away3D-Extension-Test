package com.heliereric.away3drobotlegs.view
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import com.heliereric.away3drobotlegs.util.EnterFrameManager;
	
	public class LagDebug extends Sprite
	{
		private var _enterframe:EnterFrameManager = EnterFrameManager.getInstance();
		
		public var tf:TextField;
		
		public function LagDebug()
		{
			super();
			
			tf = addChild (new TextField ()) as TextField;
			tf.textColor = 0xFFFFFF;
			x = 130;
			y = 2;
		}
		
		/*private function onEnterFrame () : void
		{
			if (_enterframe.lag) {
				_lagCount++;
				_lagInc++;
				_tf.text = "lag : " + _lagCount;
				if (_lagInc > 4) _tf.textColor = 0xFF0000
				return;
			}
			if (_lagInc > 0) _lagInc--;
			if (_lagInc == 0) _tf.textColor = 0xFFFFFF;
		}*/
	}
}