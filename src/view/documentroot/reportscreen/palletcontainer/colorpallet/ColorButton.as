package view.documentroot.reportscreen.palletcontainer.colorpallet
{
	import spark.components.Button;
	public class ColorButton extends Button
	{
		[Bindable]
		public var color: uint;
		public function ColorButton()
		{
			super();
		}
	}
}