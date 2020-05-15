package controller.documentroot.reportscreen.palletcontainer
{
	import controller.App;
	import model.plugin.draw.stamptool.StampPalletBase;
	import flash.geom.Rectangle;
	import flash.events.MouseEvent;
	public class StampPallet extends StampPalletBase
	{
		public function StampPallet()
		{
			//スタンプパレット設定
			thumbWidth = 66;
			thumbHeight = 66;
			vcName = "stampPallet";
			elementName = "Group";
			super();
		}
	}
}
