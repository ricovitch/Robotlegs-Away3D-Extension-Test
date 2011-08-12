package com.heliereric.away3drobotlegs.view3d.mediators
{
	import away3d.containers.View3D;
	
	import com.paultondeur.away3d.robotlegs.base.Mediator3D;
	
	import flash.events.MouseEvent;
	
	public class MouseRotateBehaviour extends Mediator3D
	{
		[Inject]
		public var view3D : View3D;
		
		override public function onRegister() : void {
			eventMap.mapListener (view3D.stage, MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function onMouseMove (evt:MouseEvent) : void
		{
			var mousePercentX:Number = view3D.stage.stageWidth / evt.localX;
			var mousePercentY:Number = view3D.stage.stageHeight / evt.localY;
			object3D.rotationY = 360*mousePercentX;
			object3D.rotationX = 360*mousePercentY;
		}
	}
}