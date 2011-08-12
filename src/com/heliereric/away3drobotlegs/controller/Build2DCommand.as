package com.heliereric.away3drobotlegs.controller
{
	import away3d.containers.View3D;
	import away3d.debug.AwayStats;
	
	import com.heliereric.away3drobotlegs.view.LagDebug;
	
	import org.robotlegs.mvcs.Command;
	
	public class Build2DCommand extends Command
	{
		[Inject]
		public var view3D : View3D;
		
		override public function execute() : void {
			contextView.addChild (new AwayStats (view3D));
			contextView.addChild (new LagDebug ());
		}
	}
}