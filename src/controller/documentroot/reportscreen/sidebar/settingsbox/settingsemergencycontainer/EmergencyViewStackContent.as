package controller.documentroot.reportscreen.sidebar.settingsbox.settingsemergencycontainer
{
	import flash.events.MouseEvent;
	import model.plugin.report.emergency.Emergency;
	import model.plugin.report.emergency.EmergencyTypeItem;
	import model.plugin.report.emergency.ManualPageItem;
	public class EmergencyViewStackContent extends VC
	{
		private var _myItem: EmergencyTypeItem;
		public function EmergencyViewStackContent()
		{
			vcName = "settingsEmergencyContainer";
			elementName = "NavigatorContent";
		}

		override protected function init(): void
		{
			mxml.emergencyTitle.text = Config.getText("Settings", "emergency", "emergencyTitle");
			mxml.emergencyDirName.text = Config.getText("Settings", "emergency", "emergencyDirName");
			mxml.emergencyPageAlert.text = Config.getText("Settings", "emergency", "emergencyPageAlert");
			mxml.emergencyPage1.text = Config.getText("Settings", "emergency", "emergencyPage1");
			mxml.emergencyPage2.text = Config.getText("Settings", "emergency", "emergencyPage2");
			mxml.emergencyPage3.text = Config.getText("Settings", "emergency", "emergencyPage3");
			mxml.emergencyPage4.text = Config.getText("Settings", "emergency", "emergencyPage4");
			mxml.emergencyPage5.text = Config.getText("Settings", "emergency", "emergencyPage5");
			mxml.emergencyPage6.text = Config.getText("Settings", "emergency", "emergencyPage6");
			mxml.emergencyPage7.text = Config.getText("Settings", "emergency", "emergencyPage7");
			mxml.emergencyPage8.text = Config.getText("Settings", "emergency", "emergencyPage8");
			mxml.emergencyPage9.text = Config.getText("Settings", "emergency", "emergencyPage9");

			_refreshContent();
			mxml.saveBtn.addEventListener(MouseEvent.CLICK, _btnClickHandler);
			mxml.delBtn.addEventListener(MouseEvent.CLICK, _btnClickHandler);
		}

		//ボタンクリック時処理
		private function _btnClickHandler(evt: MouseEvent): void
		{
			switch(evt.target.name)
			{
				case "saveBtn":
					__setElement();
					trace(caller.mxml.emergencyTypeButtonBar.dataGroup.dataProvider.getItemAt(_myItem.name));
					//Emergency.refresh();
					break;
				case "delBtn":
					__removeElement();
					Emergency.refresh();
					caller.refreshViewStack();
					break;
			}

			function __setElement(): void
			{
				_myItem.myDataElement.@title = mxml.inputEmergencyTitle.text;
				_myItem.myDataElement.@dir = mxml.inputEmergencyDirName.text;
				_myItem.myDataElement.page.(@name == "0").@title = mxml.inputEmergencyPageAlert.text;
				_myItem.myDataElement.page.(@name == "1").@title = mxml.inputEmergencyPage1.text;
				_myItem.myDataElement.page.(@name == "2").@title = mxml.inputEmergencyPage2.text;
				_myItem.myDataElement.page.(@name == "3").@title = mxml.inputEmergencyPage3.text;
				_myItem.myDataElement.page.(@name == "4").@title = mxml.inputEmergencyPage4.text;
				_myItem.myDataElement.page.(@name == "5").@title = mxml.inputEmergencyPage5.text;
				_myItem.myDataElement.page.(@name == "6").@title = mxml.inputEmergencyPage6.text;
				_myItem.myDataElement.page.(@name == "7").@title = mxml.inputEmergencyPage7.text;
				_myItem.myDataElement.page.(@name == "8").@title = mxml.inputEmergencyPage8.text;
				_myItem.myDataElement.page.(@name == "9").@title = mxml.inputEmergencyPage9.text;

				_myItem.refreshMyData();
				Emergency.saveEmergencyXML(_refreshContent);
			}
			function __removeElement(): void
			{
				Dom.removeMyself(_myItem.myDataElement);
				Emergency.saveEmergencyXML(null);
				Emergency.refresh();
			}
		}
		private function _refreshContent(): void
		{
			_myItem = Emergency.emergencyTypeCollection.getItemAt(mxml.parent.getElementIndex(mxml)) as EmergencyTypeItem;
			var tree: XML = _myItem.myDataElement;

			mxml.inputEmergencyTitle.text = _myItem.title;
			mxml.inputEmergencyDirName.text = _myItem.dir;

			var manualPageList: XMLList = tree.elements("page");
			var pageName: String;
			var pageItem: ManualPageItem;
			var i: uint;
			for(i = 0; i < manualPageList.length(); i++)
			{
				pageItem = _myItem.manualPageCollection.getItemAt(i) as ManualPageItem;
				if(pageItem != null)
				{
					pageName = manualPageList[i].@name;
					switch(pageName)
					{
						case "0":
							mxml.inputEmergencyPageAlert.text = pageItem.title;
							break;
						case "1":
							mxml.inputEmergencyPage1.text = pageItem.title;
							break;
						case "2":
							mxml.inputEmergencyPage2.text = pageItem.title;
							break;
						case "3":
							mxml.inputEmergencyPage3.text = pageItem.title;
							break;
						case "4":
							mxml.inputEmergencyPage4.text = pageItem.title;
							break;
						case "5":
							mxml.inputEmergencyPage5.text = pageItem.title;
							break;
						case "6":
							mxml.inputEmergencyPage6.text = pageItem.title;
							break;
						case "7":
							mxml.inputEmergencyPage7.text = pageItem.title;
							break;
						case "8":
							mxml.inputEmergencyPage8.text = pageItem.title;
							break;
						case "9":
							mxml.inputEmergencyPage9.text = pageItem.title;
							break;
						default:
							continue;
					}
				}
			}
		}

		/*
		private function _getBaseXML(): XML
		{
			var xml: XML =
	<report type="emergency">
		<page name="0">
			<layer name="0"/>
			<layer name="1"/>
		</page>
		<page name="1">
			<layer name="0"/>
			<layer name="1"/>
		</page>
		<page name="2">
			<layer name="0"/>
			<layer name="1"/>
		</page>
		<page name="3">
			<layer name="0"/>
			<layer name="1"/>
		</page>
		<page name="4">
			<layer name="0"/>
			<layer name="1"/>
		</page>
		<page name="5">
			<layer name="0"/>
			<layer name="1"/>
		</page>
		<page name="6">
			<layer name="0"/>
			<layer name="1"/>
		</page>
		<page name="7">
			<layer name="0"/>
			<layer name="1"/>
		</page>
		<page name="8">
			<layer name="0"/>
			<layer name="1"/>
		</page>
		<page name="9">
			<layer name="0"/>
			<layer name="1"/>
		</page>
	</report>;
			return xml.copy();
		}
		*/
	}
}
