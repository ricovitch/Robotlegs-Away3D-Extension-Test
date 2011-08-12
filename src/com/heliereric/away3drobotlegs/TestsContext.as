package com.heliereric.away3drobotlegs
{
	import com.heliereric.away3drobotlegs.controller.Build2DCommand;
	import com.heliereric.away3drobotlegs.controller.Build3DSceneCommand;
	import com.heliereric.away3drobotlegs.controller.Initialize3DCommand;
	import com.heliereric.away3drobotlegs.util.EnterFrameManager;
	import com.heliereric.away3drobotlegs.view.LagDebug;
	import com.heliereric.away3drobotlegs.view.LagDebugMediator;
	import com.heliereric.away3drobotlegs.view3d.TestCube3D;
	import com.heliereric.away3drobotlegs.view3d.mediators.MouseRotateBehaviour;
	import com.paultondeur.away3d.robotlegs.mvcs.Context3D;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	
	/**
	 * @author Eric Hélier
	 */
	public class TestsContext extends Context3D
	{
		public function TestsContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup() : void {
			EnterFrameManager.getInstance();
			
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, Build3DSceneCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, Initialize3DCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, Build2DCommand, ContextEvent, true);
			
			// 2d mediators
			mediatorMap.mapView (LagDebug, LagDebugMediator);
			
			// 3d mediators
			threeDeeMap.mapObject3D (TestCube3D, MouseRotateBehaviour, [TestCube3D]);
			
			super.startup();
		}
	}
}