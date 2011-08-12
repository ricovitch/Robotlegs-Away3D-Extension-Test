package
{
	import com.heliereric.away3drobotlegs.TestsContext;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	/**
	 * @author Eric Hélier
	 * inspired from Paul Tondeur post :
	 * http://www.paultondeur.com/2011/03/07/robotlegs-away3d-4-broomstick-integration-with-a-wink-at-unity/
	 */
	[SWF(backgroundColor="#010101", frameRate="60", width="1024", height="768")]
	public class Away3D4_RobotLegs_Tests extends Sprite
	{
		private var _context : TestsContext;
		
		public function Away3D4_RobotLegs_Tests()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			_context = new TestsContext(this);
		}
	}
}