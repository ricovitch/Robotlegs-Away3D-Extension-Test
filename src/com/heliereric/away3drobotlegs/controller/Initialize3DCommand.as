package com.heliereric.away3drobotlegs.controller
{
	import away3d.containers.View3D;
	
	import com.paultondeur.away3d.robotlegs.base.Render3DEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class Initialize3DCommand extends Command
	{
		[Inject]
		public var view3D : View3D;
		
		override public function execute() : void {
			view3D.antiAlias = 4;
			view3D.camera.y = 50;
			dispatch (new Render3DEvent(Render3DEvent.REQUEST_START_RENDERING));
		}
	}
}