package test.com.wezside.components 
{
	import com.wezside.components.UIElement;

	/**
	 * @author Wesley.Swanepoel
	 */
	public class MockUIElement extends UIElement 
	{
		private var _antiAliasType:String = "";

		public function MockUIElement()
		{
			super( );
		}
		
		public function get antiAliasType():String
		{
			return _antiAliasType;
		}
		
		public function set antiAliasType( value:String ):void
		{
			_antiAliasType = value;
		}
	}
}
