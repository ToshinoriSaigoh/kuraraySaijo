package controller.documentroot
{
	import flash.display.Sprite;

	import controller.utils.Screen;
	import controller.documentroot.reportscreen.*;
	public class ReportScreen extends Screen
	{
		public var vcDrawContents: DrawContents;
		public var vcSideBar: SideBar;
		public var reportScreen: Sprite;
		public function ReportScreen()
		{
			vcName = "reportScreen";
			elementName = "screen";
			super();
			Global.define("reportScreen", this);
		}
		override protected function init(): void
		{
			super.init();
			Global.set("reportScreen", mxml);
		}
	}
}
