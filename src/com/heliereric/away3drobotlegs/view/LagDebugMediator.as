package com.heliereric.away3drobotlegs.view
{
	import com.heliereric.away3drobotlegs.util.EnterFrameManager;
	import com.paultondeur.away3d.robotlegs.base.Render3DEvent;
	
	import flash.utils.getTimer;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class LagDebugMediator extends Mediator
	{
		[Inject]
		public var view:LagDebug;
		
		private var _enterframe:EnterFrameManager = EnterFrameManager.getInstance();
		
		private var _lagCount:int = 0;
		private var _lagInc:int = 0;
		private var _renderTime:Number;
		
		override public function onRegister():void
		{
			eventDispatcher.addEventListener (Render3DEvent.PRE_RENDER, onPreRender);
			eventDispatcher.addEventListener (Render3DEvent.POST_RENDER, onPostRender);
			_enterframe.add (onEnterFrame);
		}
		
		private function onPreRender (evt:Render3DEvent) : void
		{
			_renderTime = getTimer();
		}
		
		private function onPostRender (evt:Render3DEvent) : void
		{
			_enterframe.renderTime = getTimer() - _renderTime;
		}
		
		private function onEnterFrame () : void
		{
			if (_enterframe.lag) {
				_lagCount++;
				_lagInc++;
				view.tf.text = "lag : " + _lagCount;
				if (_lagInc > 4) view.tf.textColor = 0xFF0000
				return;
			}
			if (_lagInc > 0) _lagInc--;
			if (_lagInc == 0) view.tf.textColor = 0xFFFFFF;
		}
	}
}