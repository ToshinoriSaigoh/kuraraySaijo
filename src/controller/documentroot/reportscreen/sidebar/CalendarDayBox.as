package controller.documentroot.reportscreen.sidebar
{
	import common.storage.*;
	import model.plugin.draw.Draw;
	import controller.documentroot.reportscreen.DrawContents;
	import spark.collections.Sort;
	import spark.collections.SortField;
	import flash.filesystem.File;
	import flash.events.MouseEvent;
	import mx.collections.ArrayCollection;
	import mx.binding.utils.BindingUtils;
	public class CalendarDayBox extends VC
	{
		private var _fileCollection: ArrayCollection;
		private var _sort: Sort;
		private var _sortField: SortField;
		private var _selectedFileName: String;
		private var _currentReportID: String;

		private var _year: String;
		private var _month: String;
		private var _day: String;
		public function CalendarDayBox()
		{
			vcName = "calendarDayBox";
			elementName = "NavigatorContent";
			super();

			_currentReportID = null;
			_sort = new Sort();
			_sortField = new SortField();
			_sortField.name = "date";
			_sortField.descending = true;
			_sortField.numeric = false;
			_sort.fields = [_sortField];

			_selectedFileName = null;
		}
		override protected function init(): void
		{
			_fileCollection = new ArrayCollection([]);
			mxml.fileList.dataProvider = _fileCollection;
			//mxml.openFileList.dataProvider = DrawContents.reportCollection;

			//ボタン操作
			//mxml.createReportBtn.addEventListener(MouseEvent.CLICK, _createReportBtnHandler);
			mxml.addEventListener(MouseEvent.CLICK, _mxmlClickHandler);
			mxml.fileList.addEventListener(MouseEvent.CLICK, _fileItemClickHandler);
			mxml.closeBtn.addEventListener(MouseEvent.CLICK, _fileItemClickHandler);
			//mxml.openFileList.addEventListener(MouseEvent.CLICK, _fileItemClickHandler);
		}

		/*
		//ツール選択メッセージ受け取り
		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			switch(param.tool)
			{
				case "calendarDayBox":
					updateFileList(year, month, day);
					break;
				default:
					break;
			}
		}
		*/

		//ファイルリスト更新
		public function updateFileList(dayXML: XML): void
		{
			if(dayXML != null)
			{
				_year = dayXML.parent().parent().@name;
				_month = dayXML.parent().@name;
				_day = dayXML.@name;
				_listupFiles(dayXML.files[0]);
			}
			else
			{
				_listupFiles(null);
			}
			//_listupOpenFiles();
		}

		//保存されているファイルリストをリストアップ
		private function _listupFiles(fileListXML: XML): void
		{
			if(fileListXML != null)
			{
				var dir: File = Lib.getAppFileObject(fileListXML.parent().parent().parent().@name).resolvePath(fileListXML.parent().parent().@name + "/" + fileListXML.parent().@name);
				_fileCollection.removeAll();

				var i: uint;
				for(i = 0; i < fileListXML.file.length(); i++)
				{
					_fileCollection.addItem({
						fileName: fileListXML.file[i].@name,
						date: fileListXML.file[i].@date,
						type: fileListXML.file[i].@type == null ? "default" : fileListXML.file[i].@type,
						title: fileListXML.file[i].@title,
						file: dir.resolvePath(fileListXML.file[i].@name + ".zip")
					});
				}
				mxml.fileList.dataProvider = _fileCollection;
				mxml.fileList.dataProvider.sort = _sort;
				mxml.fileList.dataProvider.refresh();
				_clearSelectItems();
				/*
				DirectoryUtils.getFileListInDirectory(dir, completeListing);
				function completeListing(loadedFiles: Array): void
				{
					var i: uint;
					var file: File;
					var data: Object;
					if(loadedFiles != null)
					{
						loadedFiles.sort(sortDate);
						for(i = 0; i < loadedFiles.length; i++)
						{
							file = loadedFiles[i] as File;
							if(file != null)
							{
								if(file.isDirectory == false)
								{
									data = new Object();
									data.id = file.name;
									data.file = file;
									data.order = file.modificationDate.getTime();
									_fileCollection.addItem(data);
								}
							}
						}
					}
				}
				*/
			}
			else
			{
				_fileCollection.removeAll();
			}
		}

		//ボックスクリックはバブリングストップ
		private function _mxmlClickHandler(evt: MouseEvent): void
		{
			evt.stopImmediatePropagation();
		}

		//ファイルアイテムクリック時処理
		private function _fileItemClickHandler(evt: MouseEvent): void
		{
			switch(evt.target.name)
			{
				case "fileItem"://ファイルアイテムクリック時
					__changeSelectBtn();
					break;
				case "openFileItem"://レポートアイテムクリック時
					__changeSelectBtn();
					break;
				case "openFileBtn":
					_openZip();
					break;
				case "playFileBtn"://zipファイルを開く
					_openZip("play");
					break;
				case "closeBtn":
					PostBox.send("changeToolBox", {tool: null});
					break;
				default:
					_clearSelectItems();
			}
			function __deleteComplete(): void
			{
				//_listupFiles();
			}
			function __changeSelectBtn(): void
			{
				if(evt.target.name == "fileItem")
				{
					var i: uint;
					for(i = 0; i < evt.target.document.parent.dataProvider.length; i++)
					{
						evt.target.document.owner.getElementAt(i).toggleBtn.selected = false;
						evt.target.document.owner.getElementAt(i).toggleBtn.document.currentState = "default";
					}
					if(_selectedFileName == evt.target.document.data.fileName)
					{
						_selectedFileName = null;
						evt.target.selected = false;
						evt.target.document.currentState = "default";
					}
					else
					{
						_selectedFileName = evt.target.document.data.fileName;
						evt.target.selected = true;
						evt.target.document.currentState = "selected";
					}
				}
				else if(evt.target.name == "openFileItem")
				{
					PostBox.send("changeReport", {report: evt.target.document.data.fileName});
				}
			}
		}
		//選択したアイテムを解除する
		private function _clearSelectItems(): void
		{
			var i: uint;
			for(i = 0; i < mxml.fileList.numElements; i++)
			{
				if(mxml.fileList.getElementAt(i) == null) return;
				mxml.fileList.getElementAt(i).toggleBtn.selected = false;
				mxml.fileList.getElementAt(i).toggleBtn.document.currentState = "default";
			}
			_selectedFileName = null;
		}
		//レポート読み込み
		private function _openZip(openMode: String = null): void
		{
			if(_selectedFileName != null)
			{
				PostBox.send("loadZip", {year: _year, month: _month, fileName: _selectedFileName, mode: openMode});
			}
		}

		private function _selectOpenedReport(): void
		{
			var i: uint;
			for(i = 0; i < mxml.openFileList.numElements; i++)
			{
				if(mxml.openFileList.getElementAt(i) == null) continue;
				mxml.openFileList.getElementAt(i).ctrlr.selected = mxml.openFileList.getElementAt(i).ctrlr.fileName == Draw.activeReport.id ? true : false;
			}
		}

		/*
		//レポート切り替え後にアクティブレポートを選択状態にする
		public function PB_changeReport_after(): void
		{
			var param: Object = PostBox.get("PB_changeReport_after");
			if(param.report != id) return;
			_selectOpenedReport();
		}

		//保存完了後の更新
		public function PB_saveZip_after(): void
		{
			_listupFiles();
		}
		//レポート切り替え後にアクティブレポートを選択状態にする
		public function PB_creationCompleteReport(): void
		{
			//trace("*************PB_creationCompleteReport");
			//updateFileList();
			//_selectOpenedReport();
		}
		*/

		/*
		//開いているファイルリストをリストアップ
		private function _listupOpenFiles(): void
		{
			mxml.openFileList.dataProvider.refresh();
		}
		//レポート新規作成ボタン
		private function _createReportBtnHandler(e: MouseEvent): void
		{
			PostBox.send("addReport");
			//_listupOpenFiles();
		}
		*/
	}
}
