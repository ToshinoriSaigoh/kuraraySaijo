package controller.documentroot.reportscreen.sidebar.texttoolbox
{
	public class TextItem extends VC
	{
		[Bindable]
		public var text: String;
		public function TextItem()
		{
			vcName = "textItem";
			elementName = "itemRenderer";
		}

		override protected function init(): void
		{
			mxml.mouseChildren = false;
			text = mxml.data.text;
		}
	}
}
