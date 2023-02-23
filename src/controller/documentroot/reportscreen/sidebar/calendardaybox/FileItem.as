package controller.documentroot.reportscreen.sidebar.calendardaybox
{
	import common.CommonUtils;
	import common.StorageUtils;
	import model.plugin.report.Report;

	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.errors.IOError;
	import mx.events.FlexEvent;
	import mx.binding.utils.BindingUtils;
	public class FileItem extends VC
	{
		[Bindable]
		public var fileName: String;
		[Bindable]
		public var date: String;
		[Bindable]
		public var type: String;

		public var reportID: String;

		private var _file: File;
		public function FileItem()
		{
			vcName = "fileItem";
			elementName = "group";
		}

		override protected function init(): void
		{
			mxml.addEventListener(FlexEvent.DATA_CHANGE, _dataChangeHandler);
			//mxml.toggleBtn.addEventListener(MouseEvent.CLICK, _toggleBtnHandler);
			//mxml.deleteReportBtn.addEventListener(MouseEvent.CLICK, _deleteReportBtnHandler);

			BindingUtils.bindSetter(_setType, this, "type");
			_dateUpdate();
		}

		private function _setType(txt: String): void
		{
			if(txt == null) return;
			mxml.type.text = Report.reportTypeList[type].title;
			mxml.dataTypeMark.currentState = type;

		}

		private function _dataChangeHandler(e: FlexEvent): void
		{
			_dateUpdate();
		}

		private function _dateUpdate(): void
		{
			if(mxml.data == null) return;

			fileName = mxml.data.fileName;
			date = mxml.data.date;
			type = mxml.data.type;
			_file = mxml.data.file;
			/*
			if(mxml.data != null)
			{
				_file = mxml.data.file;
				fileName = _file.name;
				date = CommonUtils.convertDateToString(_file.modificationDate);
			}
			else
			{
				_file = null;
				fileName = null;
				date = null;
			}
			*/
		}
	}
}
