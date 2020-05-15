package controller.documentroot.reportscreen.sidebar.filelistbox
{
	import model.plugin.report.Report;
	import model.plugin.draw.Draw;
	import flash.events.MouseEvent;
	import mx.events.FlexEvent;
	import mx.binding.utils.BindingUtils;
	public class OpenFileItem extends VC
	{
		[Bindable]
		public var fileName: String;

		private var _relationshipReport: Report;
		public function OpenFileItem()
		{
			vcName = "fileItem";
			elementName = "group";
		}

		override protected function init(): void
		{
			mxml.addEventListener(FlexEvent.DATA_CHANGE, _dataChangeHandler);

			BindingUtils.bindSetter(_setType, mxml.data, "reportType");
			_dateUpdate();

			_relationshipReport = mxml.data;
			if(_relationshipReport.openMode == "play") mxml.saveReportBtn.enabled = false;
			if(_relationshipReport.reportType == "calendar")
			{
				mxml.closeReportBtn.enabled = false;
				mxml.shareReportBtn.enabled = false;
			}
		}

		public function set selected(val: Boolean): void
		{
			mxml.toggleBtn.selected = val;
			mxml.currentState = val ? "selected" : "default";
		}
		public function get selected(): Boolean
		{
			return mxml.toggleBtn.selected;
		}

		private function _setType(txt: String): void
		{
			if(txt == null) return;
			mxml.type.text = Report.reportTypeList[mxml.data.reportType].title;
			mxml.dataTypeMark.currentState = mxml.data.reportType;
		}

		private function _selectToggleBtn(): void
		{
			if(fileName == Draw.activeReport.vcName)
			{
				selected = true;
			}
			else
			{
				selected = false;
			}
		}

		private function _dataChangeHandler(e: FlexEvent): void
		{
			_dateUpdate();
		}

		private function _dateUpdate(): void
		{
			if(mxml.data != null)
			{
				fileName = mxml.data.vcName;
			}
			else
			{
				fileName = null;
			}
		}
	}
}
