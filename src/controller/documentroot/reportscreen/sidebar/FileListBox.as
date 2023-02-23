package controller.documentroot.reportscreen.sidebar
{
	import common.storage.*;
	import common.StorageUtils;
	import common.storage.DirectoryUtils;
	import model.plugin.draw.Draw;
	import model.plugin.report.*;
	import model.plugin.report.emergency.Emergency;
	import controller.documentroot.reportscreen.DrawContents;
	import controller.documentroot.reportscreen.sidebar.filelistbox.*;

	import spark.collections.Sort;
	import spark.collections.SortField;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.events.MouseEvent;
	import mx.collections.ArrayCollection;

	public class FileListBox extends VC
	{
		[Bindable]
		private var _fileTypeCollection: ArrayCollection;

		private var _fileCollection: ArrayCollection;
		private var _templateCollection: ArrayCollection;
		private var _sort: Sort;
		private var _sortField: SortField;
		private var _selectedFileName: String;
		private var _currentReportID: String;

		private var _fileDir: File;
		private var _filesXML: XML;
		private var _fileListXMLList: XMLList;
		private var _now: Date;
		public function FileListBox()
		{
			vcName = "fileListBox";
			elementName = "NavigatorContent";
			super();

			_sort = new Sort();
			_sortField = new SortField();
			_sortField.name = "name";
			_sortField.descending = true;
			_sortField.numeric = false;
			_sort.fields = [_sortField];

			_selectedFileName = null;
			_currentReportID = null;
		}

		override protected function init(): void
		{
			//テキスト適用
			mxml.saveFileText.text = Config.getText("FileListBox", "saveFileText");
			mxml.templateFileText.text = Config.getText("FileListBox", "templateFileText");
			mxml.openFileText.text = Config.getText("FileListBox", "openFileText");

			var sortType: Sort = new Sort();
			sortType.fields = [new SortField("index", false, true)];
			//新規作成ファイルタイプリスト
			_fileTypeCollection = new ArrayCollection([]);
			var i: String;
			for(i in Report.reportTypeList)
			{
				if(i == "calendar") continue;
				_fileTypeCollection.addItem(new ReportItem(Report.reportTypeList[i].name, Report.reportTypeList[i].title, i, Report.reportTypeList[i].color));
			}
			mxml.reportTypeList.dataProvider = _fileTypeCollection;
			mxml.reportTypeList.dataProvider.sort = sortType;
			mxml.reportTypeList.dataProvider.refresh();

			//トラブルレポートリスト
			//mxml.troubleTypeList.dataProvider = Emergency.emergencyTypeCollection;
			//緊急レポートリスト
			mxml.emergencyTypeList.dataProvider = Emergency.emergencyTypeCollection;

			_fileCollection = new ArrayCollection([]);
			_templateCollection = new ArrayCollection([]);
			mxml.fileList.dataProvider = _fileCollection;
			mxml.openFileList.dataProvider = DrawContents.reportCollection;

			//zipファイルメニュー
			mxml.saveFileMenu.dataProvider = new ArrayCollection([
				new FileMenuItem("saveFileListBtn", Config.getText("FileListBox", "saveFileBtn"), 0x222222, 172, 44),
				new FileMenuItem("templateListBtn", Config.getText("FileListBox", "templateFileBtn"), 0x222222, 172, 44)
			]);
			mxml.saveFileMenu.addEventListener(MouseEvent.CLICK, _saveFileMenuClickHandler);
			mxml.fileList.addEventListener(MouseEvent.CLICK, _fileItemClickHandler);

			//レポートメニュー
			mxml.openFileMenu.dataProvider = new ArrayCollection([
				new FileMenuItem("openFileListBtn", Config.getText("openFileListBtn"), 0x222222, 116, 44),
				new FileMenuItem("createReportBtn", Config.getText("createReportBtn"), 0x222222, 118, 44),
				//new FileMenuItem("createTroubleBtn", Config.getText("createTroubleBtn"), 0xeecc22, 110, 44),
				new FileMenuItem("createEmergencyBtn", Config.getText("createEmergencyBtn"), 0xee0022, 118, 44)
			]);
			mxml.openFileMenu.addEventListener(MouseEvent.CLICK, _openFileMenuClickHandler);

			_setMenuDefault();

			mxml.importZipBtn.addEventListener(MouseEvent.CLICK, _btnClickHandler);
			mxml.openFileList.addEventListener(MouseEvent.CLICK, _fileItemClickHandler);
			mxml.reportTypeList.addEventListener(MouseEvent.CLICK, _fileItemClickHandler);
			//mxml.troubleTypeList.addEventListener(MouseEvent.CLICK, _fileItemClickHandler);
			mxml.emergencyTypeList.addEventListener(MouseEvent.CLICK, _fileItemClickHandler);

			//閉じるボタン
			mxml.closeBtn.addEventListener(MouseEvent.CLICK, _fileItemClickHandler);

			_loadTemplateXML();

			//年月セット
			_now = new Date();
			_changeDate();
			mxml.dateSelector.addEventListener(MouseEvent.CLICK, _dateSelectorClickHandler);
		}

		//ツール選択メッセージ受け取り
		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			switch(param.tool)
			{
				case "fileTool":
					_now = new Date();
					_changeDate();
					break;
				default:
					break;
			}
		}

		//レポート切り替え後にアクティブレポートを選択状態にする
		public function PB_changeReport_after(): void
		{
			var param: Object = PostBox.get("PB_changeReport_after");
			_updateOpenList();
		}

		//レポート切り替え後にアクティブレポートを選択状態にする
		public function PB_creationCompleteReport(): void
		{
			_updateOpenList();
		}

		//保存完了後の更新
		public function PB_saveZip_after(): void
		{
			_updateFileList();
		}

		public function GLOBAL_activeReport(): void
		{
			//trace("*****OpenFileItem GLOBAL_activeReport()", Draw.activeReport.vcName);
		}

		//レポート操作タブ切り替え
		public function PB_changeOpenFileList(): void
		{
			var param: Object = PostBox.get("PB_changeOpenFileList");
			mxml.openFileViewStack.selectedIndex = param.index;
			mxml.openFileMenu.selectedIndex = param.index;
		}

		///////////////save report list
		//保存されているzipファイルリストをリストアップ
		private function _updateFileList(): void
		{
			//load XML
			_fileDir = Lib.getAppFileObject(String(_now.getFullYear()));
			StorageUtils.loadTextFile(_fileDir.resolvePath("files.xml"), createFileList);
			function createFileList(res: String, loadTxt: String): void
			{
				_filesXML = new XML(loadTxt);
				var monthXML: XML = _filesXML.elements("month").(attribute("name") == String(_now.getMonth() + 1))[0];
				_fileListXMLList = monthXML != null ? monthXML.elements("day").elements("files").elements("file")　: null;

				_clearSelectItems();
				_fileCollection.removeAll();
				if(_fileListXMLList == null) return;
				var data: Object;
				var i: uint;
				for(i = 0; i < _fileListXMLList.length(); i++)
				{
					data = new Object();
					data.name = _fileListXMLList[i].@name;
					data.date = _fileListXMLList[i].@date,
					data.type = _fileListXMLList[i].@type == null ? "default" : _fileListXMLList[i].@type;
					data.xml = _fileListXMLList[i];
					data.file = Lib.getAppFileObject(String(_now.getFullYear())).resolvePath(String(_now.getMonth() + 1) + "/" + _fileListXMLList[i].@name + ".zip");
					_fileCollection.addItem(data);
				}
				mxml.fileList.dataProvider = _fileCollection;
				mxml.fileList.dataProvider.sort = _sort;
				mxml.fileList.dataProvider.refresh();
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

		//zipファイルリストの年月変更
		private function _changeDate(): void
		{
			mxml.dateTextYear.text = String(_now.getFullYear());
			mxml.dateTextMonth.text = String(_now.getMonth() + 1);

			_updateFileList();
		}
		//file.xml読込
		private function _loadTemplateXML(): void
		{
			var templateListXMLList: XMLList;
			StorageUtils.loadTextFile(Lib.getAppFileObject("templates").resolvePath("files.xml"), createFileList);
			function createFileList(res: String, loadTxt: String): void
			{
				var templatesXML: XML = new XML(loadTxt);
				templateListXMLList = templatesXML != null ? templatesXML.elements("files").elements("file")　: null;
				_listupTemplates();
			}
			function _listupTemplates(): void
			{
				_templateCollection.removeAll();
				var data: Object;
				var i: uint;
				for(i = 0; i < templateListXMLList.length(); i++)
				{
					data = new Object();
					data.name = templateListXMLList[i].@name;
					data.date = templateListXMLList[i].@date;
					data.type = templateListXMLList[i].parent().@name;
					data.file = Lib.getAppFileObject("templates").resolvePath(templateListXMLList[i].parent().@name + "/" + templateListXMLList[i].@name + ".zip");
					_templateCollection.addItem(data);
				}
				mxml.templateList.dataProvider = _templateCollection;
				mxml.templateList.dataProvider.sort = _sort;
				mxml.templateList.dataProvider.refresh();
				_clearSelectItems();
			}
		}

		//レポート読み込み
		private function _openZip(openMode: String = null): void
		{
			if(_selectedFileName != null)
			{
				PostBox.send("loadZip", {year: String(_now.getFullYear()), month: String(_now.getMonth() + 1), fileName: _selectedFileName, mode: openMode});
			}
		}


		///////////////open report list
		//ファイルリスト更新
		//アクティブなレポートを選択状態にする
		private function _updateOpenList(): void
		{
			var i: uint;
			for(i = 0; i < mxml.openFileList.numElements; i++)
			{
				if(mxml.openFileList.getElementAt(i) == null) continue;
				mxml.openFileList.getElementAt(i).ctrlr.selected = mxml.openFileList.getElementAt(i).ctrlr.fileName == Draw.activeReport.id ? true : false;
			}
			mxml.openFileList.dataProvider.refresh();
		}


		///////////////menu
		private function _setMenuDefault(): void
		{
			mxml.saveFileMenu.selectedIndex = 0;
			mxml.saveFileViewStack.selectedIndex = 0;
			mxml.openFileMenu.selectedIndex = 0;
			mxml.openFileViewStack.selectedIndex = 0;
		}
		//zip操作タブ切り替え
		private function _saveFileMenuClickHandler(evt: MouseEvent): void
		{
			mxml.saveFileViewStack.selectedIndex = mxml.saveFileMenu.selectedIndex;
		}

		//レポート操作タブ切り替え
		private function _openFileMenuClickHandler(evt: MouseEvent): void
		{
			mxml.openFileViewStack.selectedIndex = mxml.openFileMenu.selectedIndex;
		}
		//リストxmlの日付選択
		private function _dateSelectorClickHandler(evt: MouseEvent): void
		{
			evt.stopImmediatePropagation();
			switch(evt.target.name)
			{
				case "datePrev":
					_now = __getChangedDate(-1);
					break;
				case "dateNext":
					_now = __getChangedDate(+1);
					break;
			}
			_changeDate();

			function __getChangedDate(act: int): Date
			{
				return new Date(_now.fullYear, _now.month + act, 1);
			}
		}

		//ボタンクリック時処理
		private function _btnClickHandler(evt: MouseEvent): void
		{
			switch(evt.target.name)
			{
				case "importZipBtn":
					PostBox.send("importZip");
					break;
			}
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
				case "closeReportBtn":
					PostBox.send("closeReport", {report: evt.target.document.data.id});
					break;
				case "saveReportBtn":
					PostBox.send("saveZip", {report: evt.target.document.data.id});
					break;
				case "shareReportBtn":
					PostBox.send("shareReport", {type: "report", report: evt.target.document.data.id});
					break;
				case "deleteFileBtn":
					evt.target.document.ctrlr.deleteZip(deleteComplete);
					break;
				case "openFileBtn"://zipファイルを開く
					_openZip();
					break;
				case "playFileBtn"://zipファイルを開く
					_openZip("play");
					break;
				case "reportTypeBtn"://レポートタイプクリック時//レポート作成
					__createReportBtnHandler(evt.target.document.data.type);
					break;
				//case "troubleTypeBtn"://レポートタイプクリック時//レポート作成
				//	__createReportBtnHandler("trouble", evt.target.document.data.name);
				//	break;
				case "emergencyTypeBtn"://レポートタイプクリック時//レポート作成
					__createReportBtnHandler(evt.target.document.data.type, evt.target.document.data.name);
					break;
				case "closeBtn":
					PostBox.send("changeToolBox", {tool: null});
					break;
				default:
					_clearSelectItems();
			}
			function deleteComplete(): void
			{
				//対象ファイル削除後にXML削除
				Dom.removeMyself(evt.target.document.data.xml);
				var files: File = Lib.getAppFileObject(String(_now.getFullYear()) + "/files.xml");
				StorageUtils.saveTextFile(files, _filesXML.toXMLString(), saveComplete, FileMode.WRITE);

				function saveComplete(): void
				{
					_changeDate();
				}
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

					if(_selectedFileName == evt.target.document.data.name)
					{
						_selectedFileName = null;
						evt.target.selected = false;
						evt.target.document.currentState = "default";
					}
					else
					{
						_selectedFileName = evt.target.document.data.name;
						evt.target.selected = true;
						evt.target.document.currentState = "selected";
					}
				}
				else if(evt.target.name == "openFileItem")
				{
					PostBox.send("changeReport", {report: evt.target.document.data.id});
				}
			}
			//レポート新規作成ボタン
			function __createReportBtnHandler(reportType: String, emergencyType: String = null): void
			{
				switch(reportType)
				{
					case "emergency":
					case "trouble":
						var reportID: String = Lib.getDateTimeString();
						PostBox.send("addReport", {type: reportType, emergency: emergencyType, report: reportID});
						PostBox.send("sendEmergencyNotification", {type: reportType, emergency: emergencyType, report: reportID});
						break;
					default:
						PostBox.send("addReport", {type: reportType});
				}
				_updateOpenList();
				mxml.openFileMenu.selectedIndex = 0;
				mxml.openFileViewStack.selectedIndex = mxml.openFileMenu.selectedIndex;
			}
		}
	}
}
