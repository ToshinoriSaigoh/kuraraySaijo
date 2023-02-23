package controller.documentroot.reportscreen.sidebar.filelistbox
{
	public class FileMenuItem
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

		public function FileMenuItem(name: String, text: String, color: Number, width: Number, height: Number)
		{
			this.name = name;
			this.text = text;
			this.color = color;
			this.width = width;
			this.height = height;
		}
	}
}
