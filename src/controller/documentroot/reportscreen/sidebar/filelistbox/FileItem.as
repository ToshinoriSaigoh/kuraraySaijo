package controller.documentroot.reportscreen.sidebar.filelistbox
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
		public var file: File;

		public function FileItem()
		{
			vcName = "fileItem";
			elementName = "group";
		}

		override protected function init(): void
		{
			mxml.addEventListener(FlexEvent.DATA_CHANGE, _dataChangeHandler);
			//mxml.deleteFileBtn.addEventListener(MouseEvent.CLICK, _deleteFileBtnHandler);

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
			if(mxml.data != null)
			{
				fileName = mxml.data.name;
				date = mxml.data.date;
				type = mxml.data.type;
				file = mxml.data.file;
			}
			else
			{
				fileName = null;
				date = null;
				type = null;
				file = null;
			}
		}

		public function deleteZip(compFunc: Function = null): void
		{
			StorageUtils.deleteFile(file, compFunc);
		}

		/*
		//削除ボタン
		private function _deleteFileBtnHandler(evt: MouseEvent): void
		{
			evt.stopImmediatePropagation();
			try
			{
				if(file.exists)
				{
					file.deleteFile();
				}
			}
			catch(ioError: IOError)
			{
			}
			catch(securityError: SecurityError)
			{
			}
		}
		*/
	}
}
