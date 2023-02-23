package controller.documentroot.reportscreen.sidebar
{
	import flash.events.*;
	public class SettingsBox extends VC
	{
		public function SettingsBox()
		{
			vcName = "settingsBox";
			elementName = "NavigatorContent";
			super();
		}

		override protected function init(): void
		{
			//閉じるボタン
			mxml.closeBtn.addEventListener(MouseEvent.CLICK, _btnClickHandler);
			//表示テキスト
			mxml.headerLabel.text = Config.getText("Settings", "header");

			mxml.settingsViewStack.selectedIndex = 0;

		}

		public function PB_showContainer(): void
		{
			var param: Object = PostBox.get("PB_showContainer");
			switch(param.container)
			{
				case "settingsToolContainer":
					mxml.settingsViewStack.selectedIndex = 0;
					break;
				case "settingsLinkContainer":
					mxml.settingsViewStack.selectedIndex = 1;
					break;
				case "settingsEmergencyContainer":
					mxml.settingsViewStack.selectedIndex = 2;
					break;
			}
		}

		//ボタンハンドラー
		private function _btnClickHandler(evt: MouseEvent): void
		{
			switch(evt.target.name)
			{
				case "closeBtn":
					PostBox.send("changeToolBox", {tool: null});
					break;
				default:
			}
		}

	}
}
