package model.plugin.report.emergency
{
	import model.plugin.draw.Draw;
	import flash.events.MouseEvent;
	import mx.collections.ArrayCollection;
	//import mx.binding.utils.BindingUtils;
	public class EmergencyHeader extends VC
	{
		[Bindable]
		public var title: String;
		[Bindable]
		public var datetime: String;

		public function EmergencyHeader()
		{
			super();
		}
		override protected function init(): void
		{
			mxml.menuList.addEventListener(MouseEvent.CLICK, _menuClickHandler);
		}

		public function PB_changeReport_after(): void
		{
			var param: Object = PostBox.get("PB_changeReport_after");
			switch(Draw.activeReport.reportType)
			{
				case "emergency":
				case "trouble":
					_setActiveEmergencyData();
					mxml.visible = true;
					break;
				default:
					mxml.visible = false;
			}
		}

		private function _menuClickHandler(evt: MouseEvent): void
		{
			PostBox.send("changePage", {report: Draw.activeReport.vcName, page: evt.target.name});
		}

		private function _setActiveEmergencyData(): void
		{
			var emergencyReport: EmergencyReport = Draw.activeReport as EmergencyReport;
			switch(emergencyReport.emergencyReportType)
			{
				case "emergency":
					mxml.title.styleName = "emergencyTitle";
					break;
				case "trouble":
					mxml.title.styleName = "troubleTitle";
					break;
			}
			var emergencyTypeItem: EmergencyTypeItem = Emergency.emergencyTypeCollection.getItemAt(int(emergencyReport.emergencyType)) as EmergencyTypeItem;
			var tree: XML = emergencyTypeItem.myDataElement;
			title = tree.@title;
			datetime = emergencyReport.myDataElement.@datetime;
			mxml.menuList.dataProvider = emergencyTypeItem.manualPageCollection;
			//ボタン色変更
			var i: uint;
			for(i = 0; i < mxml.menuList.dataProvider.length; i++)
			{
				if(mxml.menuList.getElementAt(i) != null)
				{
					mxml.menuList.getElementAt(i).emergencyPageBtn.skin.setColor(mxml.menuList.dataProvider.getItemAt(i).bgColor, mxml.menuList.dataProvider.getItemAt(i).styleName);
				}
			}
		}
	}
}
