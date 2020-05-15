package controller.documentroot.reportscreen.sidebar.settingsbox.settingslinkcontainer
{
	public class ChMenuItem
	{
		[Bindable]
		public var name: String;
		[Bindable]
		public var text: String;
		[Bindable]
		public var color: Number;
		[Bindable]
		public var width: Number;
		[Bindable]
		public var height: Number;
		[Bindable]
		public var alpha: Number;

		public function ChMenuItem(name: String, text: String, width: Number, height: Number, color: Number, alpha: Number)
		{
			this.name = name;
			this.text = text;
			this.color = color;
			this.width = width;
			this.height = height;
			this.alpha = alpha;
		}
	}
}
