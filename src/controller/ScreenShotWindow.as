package controller
{
	import controller.App;
	import flash.events.MouseEvent;

	public class ScreenShotWindow extends VC
	{
		public function ScreenShotWindow()
		{
			vcName = "screenShotWindow";
			elementName = "window";
			super(null, true);
		}

		override protected function init(): void
		{
			mxml.shotBtn.addEventListener(MouseEvent.CLICK, _shotBtnClickHandler);
			mxml.closeBtn.addEventListener(MouseEvent.CLICK, _closeBtnClickHandler);
		}

		//スクリーンショット実行ボタン
		private function _shotBtnClickHandler(e: MouseEvent): void
		{
			PostBox.send("screenShot");
		}

		//閉じるボタン
		private function _closeBtnClickHandler(e: MouseEvent): void
		{
			PostBox.send("closeScreenShotWindow");
		}
	}
}
