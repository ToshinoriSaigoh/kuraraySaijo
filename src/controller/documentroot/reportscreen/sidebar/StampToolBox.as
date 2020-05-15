package controller.documentroot.reportscreen.sidebar
{
	import model.plugin.draw.stamptool.*;

	import flash.events.MouseEvent;
	import mx.collections.ArrayCollection;
	public class StampToolBox extends VC
	{
		public function StampToolBox()
		{
			vcName = "stampToolBox";
			elementName = "NavigatorContent";
		}

		override protected function init(): void
		{
			mxml.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler);
			mxml.stampHistory.dataProvider = StampTool.stampHistoryCollection;
		}

		//スタンプの配置開始イベントハンドラー
		//配置開始でイメージオブジェクト作成
		private function _mouseDownHandler(evt: MouseEvent): void
		{
			switch(evt.target.name)
			{
				case "stampItem":
					PostBox.send("showPallet", {pallet: "stampPallet", value: "hide"});
					StampPalletBase.stampTool.createTmpStamp(evt.target.document.data);
					break;
			}
		}


	}
}
