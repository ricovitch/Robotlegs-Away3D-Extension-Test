package com.heliereric.away3drobotlegs.controller
{
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.View3D;
	import away3d.core.base.Object3D;
	import away3d.entities.Mesh;
	import away3d.materials.ColorMaterial;
	
	import com.heliereric.away3drobotlegs.view3d.TestCube3D;
	
	import flash.utils.getTimer;
	
	import org.robotlegs.mvcs.Command;
	
	public class Build3DSceneCommand extends Command
	{
		[Inject]
		public var view3D : View3D;
		
		override public function execute() : void {
			var startTime:Number = getTimer ();
			
			var root3D:ObjectContainer3D = view3D.scene.addChild (new ObjectContainer3D());
			var testCount:int = 500;
			
			var cube:TestCube3D;
			var i:int;
			for (i=0; i<testCount; i++) {
				cube = new TestCube3D (new ColorMaterial (0xFFFFFF), 10, 10, 10);
				cube.x = Math.random()*1000 - 500;
				cube.y = Math.random()*1000 - 500;
				cube.z = Math.random()*1000 - 500;
				root3D.addChild (cube);
			}
			/* cloning is better but don't register mediators...
			var cubeSource:TestCube3D = new TestCube3D (new ColorMaterial (0xFFFFFF), 10, 10, 10);
			var clone:ObjectContainer3D;
			var i:int;
			for (i=0; i<testCount; i++) {
				clone = cubeSource.clone() as ObjectContainer3D;
				clone.x = Math.random()*1000 - 500;
				clone.y = Math.random()*1000 - 500;
				clone.z = Math.random()*1000 - 500;
				root3D.addChild (clone);
			}*/
			
			trace ("[Build3DSceneCommand] execute (" + (getTimer() - startTime) + ")");
		}
	}
}