package controller.documentroot.reportscreen.sidebar.settingsbox
{
	import flash.events.MouseEvent;
	import mx.events.FlexEvent;
	import model.plugin.report.emergency.Emergency;
	import view.documentroot.reportscreen.sidebar.settingsbox.settingsemergencycontainer.EmergencyViewStackContent;
	public class SettingsEmergencyContainer extends VC
	{
		public function SettingsEmergencyContainer()
		{
			vcName = "settingsEmergencyContainer";
			elementName = "NavigatorContent";
		}

		override protected function init(): void
		{

			mxml.emergencyTypeButtonBar.dataProvider = Emergency.emergencyTypeCollection;
			mxml.emergencyTypeButtonBar.addEventListener(MouseEvent.CLICK, _btnClickHandler);
			mxml.addBtn.addEventListener(MouseEvent.CLICK, _btnClickHandler);
			refreshViewStack();
		}

		public function refreshBtnBar(): void
		{
			trace(mxml.emergencyTypeButtonBar.selectedItem);
			//mxml.emergencyTypeButtonBar.selectedIndex = viewIndex;
		}
		//緊急リストボタンemergencyTypeButtonBarからビュースタックコンテンツを生成する
		//btnBar.viewIndex == viewStack.viewIndexになる
		public function refreshViewStack(): void
		{
			mxml.settingsEmergencyViewStack.removeAllChildren();
			var navContent: EmergencyViewStackContent;
			var i: uint;
			for(i = 0; i < Emergency.emergencyTypeCollection.length; i++)
			{
				navContent = new EmergencyViewStackContent();
				mxml.settingsEmergencyViewStack.addElementAt(navContent, i);
			}
		}

		//クリック時処理
		private function _btnClickHandler(evt: MouseEvent): void
		{
			switch(evt.target.name)
			{
				case "emergencyTypeBtn"://emergencyタイプボタンクリック時
					changeEmergencyContainer(Number(evt.target.data.name));
					break;
				case "addBtn"://追加ボタンクリック時
					Emergency.addEmergency();
					refreshViewStack();
					changeEmergencyContainer(mxml.settingsEmergencyViewStack.numChildren - 1);
					break;
				default:
			}
		}
		public function changeEmergencyContainer(viewIndex: int): void
		{
			mxml.emergencyTypeButtonBar.selectedIndex = viewIndex;
			mxml.settingsEmergencyViewStack.selectedIndex = viewIndex;
		}
	}
}
