package com.heliereric.away3drobotlegs.util
{
	import flash.display.Shape;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	import org.osflash.signals.Signal;

	/**
	 * signal enterframe dispatcher
	 * (use with singleton injection mechanism)
	 */
	public class EnterFrameManager extends Signal
	{
		/**
		 * static frame counter
		 */
		public static var FRAME:int = 1;
		
		/**
		 * lag detection max ms per frame
		 */
		public static var MAX_MS:int = 40;
		
		/**
		 * last frame lag flag
		 */
		public var lag:Boolean = false;
		
		private var _renderTime:int;
		public function set renderTime (val:int) : void {
			_totalRenderTime += val;
			_renderTime = val;
		}
		private var _totalRenderTime:int = 0;
		private var _renderTooLongCount:int = 0;
		
		private var _dispatcher:Shape = new Shape ();
		private var _lastTime:int = getTimer();
		private var _totalFrameTime:int = 0;
		private var _delaycalls:Array = [];
		
		// SINGLETON IMPLEMENTATION
		private static var _instance:EnterFrameManager;
		public static function getInstance():EnterFrameManager
		{
			if( _instance == null ) _instance = new EnterFrameManager();
			return _instance;
		}

		public function EnterFrameManager () : void
		{
			_dispatcher.addEventListener (Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame (evt:Event) : void {
			lag = false;
			
			// track time execution between frames :
			var newTime:int = getTimer ();
			var frameTime:int = newTime - _lastTime;
			_totalFrameTime += frameTime;
			_lastTime = newTime;
			
			// log frames if execution time is high
			if (frameTime > MAX_MS) {
				lag = true;
				
				// total time
				var log:String = " ------------ " + frameTime + "ms (avg " + int (_totalFrameTime/FRAME) + ")";
				// rendering time
				if (!isNaN(_renderTime)) log += " | render=" + _renderTime + " (avg " + int (_totalRenderTime/FRAME) + ")";
				trace (FRAME + "|  " + log);
				
				// TODO autoadjust performances if rendering time takes too long several times
				/*if (!isNaN(_renderTime)) {
					if (_renderTime > MAX_MS) _renderTooLongCount++;
					else _renderTooLongCount = 0;
					if (_renderTooLongCount > 20) {
						trace ("! ADJUST PERFORMANCES FOR RENDERING !");
					}
				}*/
			}
			
			FRAME++;
			
			// dispath signal
			dispatch ();
		}
	}
}