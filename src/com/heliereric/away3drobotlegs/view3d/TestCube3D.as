package com.heliereric.away3drobotlegs.view3d
{
	import away3d.materials.MaterialBase;
	import away3d.primitives.Cube;
	
	public class TestCube3D extends Cube
	{
		public function TestCube3D(material:MaterialBase=null, width:Number=100, height:Number=100, depth:Number=100, segmentsW:uint=1, segmentsH:uint=1, segmentsD:uint=1, tile6:Boolean=true)
		{
			super(material, width, height, depth, segmentsW, segmentsH, segmentsD, tile6);
		}
	}
}