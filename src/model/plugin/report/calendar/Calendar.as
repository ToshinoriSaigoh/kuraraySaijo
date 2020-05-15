package model.plugin.report.calendar
{
	import common.db.DB;
	import model.plugin.report.*;
	import model.plugin.draw.*;
	import controller.documentroot.reportscreen.DrawContents;
	import common.StorageUtils;
	import common.storage.DirectoryUtils;

	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;
	import mx.core.UITextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	//import flash.text.TextField;
	import flash.text.TextFormatAlign;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.utils.setTimeout;

	public class Calendar extends Report
	{
		public var year: uint;
		public var month: uint;
		public var days: Array;
		private var _calendarWidth: uint;
		private var _calendarHeight: uint;
		private var _filesXML: XML;

		private var _calendar: Object;
		public function Calendar(parent: VC, y: uint)
		{
			_calendarWidth = 1040;
			_calendarHeight = 940;
			_createCalendar(y);

			var now: Date = new Date();
			var baseTime: Number = new Date(now.getFullYear(), 0, 1, 0, 0, 0, 0).getTime();
			myDataElement =
				<report id={String(y)} name={String(y)} type="calendar" baseTime={baseTime} lastTime={Lib.getNowTimeStamp() - baseTime}>
					<record/>
					<page id="0" name="0" title="1"><layer id="0" name="0"/><layer id="1" name="1"/></page>
					<page id="1" name="1" title="2"><layer id="0" name="0"/><layer id="1" name="1"/></page>
					<page id="2" name="2" title="3"><layer id="0" name="0"/><layer id="1" name="1"/></page>
					<page id="3" name="3" title="4"><layer id="0" name="0"/><layer id="1" name="1"/></page>
					<page id="4" name="4" title="5"><layer id="0" name="0"/><layer id="1" name="1"/></page>
					<page id="5" name="5" title="6"><layer id="0" name="0"/><layer id="1" name="1"/></page>
					<page id="6" name="6" title="7"><layer id="0" name="0"/><layer id="1" name="1"/></page>
					<page id="7" name="7" title="8"><layer id="0" name="0"/><layer id="1" name="1"/></page>
					<page id="8" name="8" title="9"><layer id="0" name="0"/><layer id="1" name="1"/></page>
					<page id="9" name="9" title="10"><layer id="0" name="0"/><layer id="1" name="1"/></page>
					<page id="10" name="10" title="11"><layer id="0" name="0"/><layer id="1" name="1"/></page>
					<page id="11" name="11" title="12"><layer id="0" name="0"/><layer id="1" name="1"/></page>
				</report>;
			super(parent, String(y), myDataElement, "calendar");
		}

		override public function creationComplete(): void
		{
			_mount();
			var now: Date = new Date();
			PostBox.send("changePage", {report: vcName, page: String(now.getMonth())});
			if(GroupWork.hasOwnWork("GW_openReport"))
			{
				GroupWork.done("GW_openReport");
			}
			else
			{
				PostBox.send("creationCompleteReport", {report: vcName});
			}
			_updateFileList();
		}

		override public function getReportDir(): File
		{
			return Lib.getSystemFileObject("calendar/" + id);
		}

		private function _updateFileList(): void
		{
			//ファイル一覧作成
			var files: File = Lib.getAppFileObject(String(year));
			StorageUtils.loadTextFile(files.resolvePath("files.xml"), createFileList);
			function createFileList(res: String, loadTxt: String): void
			{
				_filesXML = new XML(loadTxt);
				var xml: XML;
				var n: String;
				var m: String;
				for(n in _calendar)
				{
					for(m in _calendar[n].days)
					{
						xml = _filesXML.elements("month").(attribute("name") == n).elements("day").(attribute("name") == _calendar[n].days[m].day)[0];
						_calendar[n].days[m].updateFileList(xml);//Day.as用ファイルリスト
					}
				}
			}

		}

		//zip圧縮
		override public function GW_saveZip(): void
		{
			var param: Object = PostBox.get("GW_saveZip");
			if(id != param.report)
			{
				GroupWork.done("GW_saveZip");
				return;
			}
			//_pleaseWait();

			save.saveDataTree(complete);
			function complete(): void
			{
				setTimeout(run, 100);
				function run(): void
				{
					var now: Date = new Date();
					var saveFile: File = Lib.getAppFileObject(String(now.getFullYear()) + "/" + id + ".zip");
					save.saveZip("GW_saveZip", saveFile, false);
				}
			}
		}

		//レポート削除処理
		override public function deleteMyself(compFunc: Function = null): void
		{
			//buffer削除
			DrawPlayer.createBufferMap(id);
			//DB close
			DB.close(reportDB.dbConn);
			var i: uint;
			for(i = 0; i < DrawContents.reportCollection.length; i++)
			{
				if(DrawContents.reportCollection.getItemAt(i).id == id)
				{
					DrawContents.reportCollection.removeItemAt(i);
					break;
				}
			}
			//レポートコレクションから削除
			removeStep();
			if(myElement != null) Dom.removeMyself(myElement);
			if(vcList.hasOwnProperty(vcNamePath)) delete vcList[vcNamePath];
			//CommonUtils.removeFromParent(body);
			//レポートリストXMLから削除
			delete myDataElement.parent().children()[myDataElement.childIndex()];
			//コンテンツ表示リストから削除
			caller.mxml.drawContentsViewStack.removeElement(mxml);
			reportList.shift();
			if(compFunc != null)
			{
				compFunc.call();
			}
		}
		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			var now: Date = new Date();
			if(param.year != null)
			{
				year = int(param.year);
			}
			else
			{
				year = now.getFullYear();
			}

			if(param.tool == "calendarTool")
			{
				//PostBox.send("changePage", {report: String(year), page: now.getMonth()});
				PostBox.send("changeReport", {report: String(year)});

				_startCalendar();
				ControlPanel.controlPanel.visible = false;
				_updateFileList();
			}
			else
			{
				_stopCalendar();
			}
		}

		//dataXML保存//非同期
		public function saveDataTree(completeFunc: Function = null): void
		{
			var reportTree: XML = myDataElement;
			StorageUtils.saveTextFile(reportDir.resolvePath("data/data.xml"), reportTree.toXMLString(), completeFunc, FileMode.WRITE);
		}

		private function _createCalendar(y: uint): void
		{
			year = y;
			_calendar = {};

			//日付作成
			var date: Date;
			var i: uint;
			for(i = 0; i < 12; i++)
			{
				date = new Date(year, i, 1);
				_setMonthPanel(i, date);
			}
		}

		private function _setMonthPanel(m: uint, date: Date): void
		{
			_calendar[String(m + 1)] = {body: null, days: null};
			//trace("calendar:", year, String(date.getMonth() + 1));
			var monthPanel: Sprite = new Sprite();
			monthPanel.mouseEnabled = false;
			monthPanel.doubleClickEnabled = false;
			monthPanel.tabEnabled = false;
			monthPanel.mouseChildren = true;

			var theMonth: String = String(date.getMonth() + 1);
			var yearField: UITextField = new UITextField();
			var formatYear: TextFormat = new TextFormat();
			formatYear.color = 0x222222;
			formatYear.size = 48;
			yearField.embedFonts = true;
			formatYear.font = Lib.notoSansMonoCJKJP;
			yearField.defaultTextFormat = formatYear;
			yearField.setTextFormat(formatYear);
			yearField.mouseEnabled = false;
			yearField.name = "yearField";
			yearField.text = String(year);
			yearField.border = false;
			yearField.background = false;
			yearField.styleName = "calendarYearField";
			yearField.type = TextFieldType.DYNAMIC;
			monthPanel.addChild(yearField);

			var monthField: UITextField = new UITextField();
			var formatMonth: TextFormat = new TextFormat();
			formatMonth.color = 0x222222;
			formatMonth.size = 96;
			formatMonth.bold = true;
			formatMonth.align = TextFormatAlign.CENTER;
			formatMonth.font = Lib.notoSansMonoCJKJP;
			monthField.embedFonts = true;
			monthField.setTextFormat(formatMonth);
			monthField.defaultTextFormat = formatMonth;
			monthField.mouseEnabled = false;
			monthField.name = "monthField";
			monthField.text = String(date.getMonth() + 1);
			monthField.width = 150;
			monthField.height = 120;
			monthField.border = false;
			monthField.background = false;
			monthField.styleName = "calendarMonthField";
			monthField.type = TextFieldType.DYNAMIC;
			monthPanel.addChild(monthField);

			//曜日作成
			var firstWeekDay: uint = 0;

			var weekDayArr: Array = ["日", "月", "火", "水", "木", "金", "土"];
			var weekHeadArr: Array = [];
			var formatWeekHead: TextFormat = new TextFormat();
			formatWeekHead.font = Lib.notoSansMonoCJKJP;
			formatWeekHead.color = 0x222222;
			formatWeekHead.size = 36;
			formatWeekHead.align = TextFormatAlign.CENTER;

			var i: uint;
			var n: uint;
			for(i = firstWeekDay; i < weekDayArr.length + firstWeekDay; i++)
			{
				n = i%weekDayArr.length;
				weekHeadArr[n] = new UITextField();
				weekHeadArr[n].setTextFormat(formatWeekHead);
				weekHeadArr[n].embedFonts = true;
				weekHeadArr[n].defaultTextFormat = formatWeekHead;
				weekHeadArr[n].mouseEnabled = false;
				weekHeadArr[n].width = 140;
				weekHeadArr[n].height = 50;
				weekHeadArr[n].border = false;
				weekHeadArr[n].background = false;
				weekHeadArr[n].x = (i - firstWeekDay) * 150;
				weekHeadArr[n].y = 124;
				weekHeadArr[n].text = String(weekDayArr[n]);
				weekHeadArr[n].styleName = "calendarHead";
				weekHeadArr[n].type = TextFieldType.DYNAMIC;
				monthPanel.addChild(weekHeadArr[n]);
			}
			//整列
			yearField.text = String(year);
			yearField.x = 0;
			yearField.y = 10;
			monthField.x = (monthPanel.width / 2) - (monthField.width / 2);
			monthField.y = 10;

			days = [];
			var daysNum: uint;//ひと月に表示する日数

			var firstDay: Date = new Date(date.fullYear, date.getMonth(), 1);
			var fd: int = firstDay.getDay() < firstWeekDay ? firstDay.getDay() + 7 : firstDay.getDay();
			var lastDays: int = -(fd - firstWeekDay);

			var boxW: uint;
			var boxH: uint;
			var col: uint = 180;//日付Y基準値
			var row: uint = 0;
			var boxMargin: uint = 10;
			var lastDate: Date = new Date(date.fullYear, date.getMonth() + 1, -1);//月末

			if(lastDays < -5 && lastDate.getDate() > 29)
			{
				daysNum = 42;
				boxW = 140;
				boxH = 120;
			}
			else
			{
				daysNum = 35;
				boxW = 140;
				boxH = 140;
			}

			_calendar[String(m + 1)].days = {};
			var xml: XML;
			var d: int;
			for(d = 0; d < daysNum; d++)
			{
				row = d % 7;
				var theDate: Date = new Date(year, date.getMonth(), d + 1 + lastDays);
				var box: Day = new Day(this, date.getMonth(), d, theDate, boxW, boxH, (date.getMonth() == theDate.getMonth()));

				_calendar[String(m + 1)].days[String(d)] = box;
				days.push(box);
				monthPanel.addChild(box.body);
				days[d].body.x = row * (boxW + boxMargin);
				days[d].body.y = col;
				if(row == 6) col += (boxH + boxMargin);
			}

			_calendar[String(m + 1)].body = monthPanel;
		}

		private function _mount(): void
		{
			var i: uint;
			for(i = 0; i < pageCollection.source.length; i++)
			{
				pageCollection.source[i].drawLayers[0].body.addChildAt(_calendar[String(i + 1)].body, 0);
				_calendar[String(i + 1)].body.x = (1920 / 2) - (_calendar[String(i + 1)].body.width / 2);
				_calendar[String(i + 1)].body.y = 35;
			}
		}
		private function _startCalendar(): void
		{
			var reportScreen: Sprite = Global.get("reportScreen") as Sprite;
			reportScreen.addEventListener(MouseEvent.CLICK, _dayClickHandler);
			/*
			var i: uint;
			for(i = 0; i < pageCollection.source.length; i++)
			{
				_calendar[String(i + 1)].body.addEventListener(MouseEvent.CLICK, _dayClickHandler);
			}
			*/
		}
		private function _stopCalendar(): void
		{
			var i: uint;
			for(i = 0; i < pageCollection.source.length; i++)
			{
				_calendar[String(i + 1)].body.removeEventListener(MouseEvent.CLICK, _dayClickHandler);
			}
		}
		private function _dayClickHandler(evt: MouseEvent): void
		{
			if(Draw.activeTool != "calendarTool") return;
			_clearCalendar();
			if(!evt.target.hasOwnProperty("ctrlr")) return;
			var m: String;
			for(m in _calendar)
			{
				if(!evt.target.ctrlr.hasOwnProperty("month")) return;
				if(m == evt.target.ctrlr.calendarMonth)//当月かどうか
				{
					var d: String;
					for(d in _calendar[m].days)
					{
						if(d == String(evt.target.ctrlr.id) && m == evt.target.ctrlr.month)
						{
							_calendar[m].days[d].body.border.visible = true;
							_updateFileList();
							var xml: XML = _filesXML.elements("month").(attribute("name") == evt.target.ctrlr.month).elements("day").(attribute("name") == evt.target.ctrlr.day)[0];
							PostBox.send("changeToolBox", {tool: "calendarDayBox", val: xml});//ツールボックス表示
							evt.target.ctrlr.updateFileList(xml);//Day.as用ファイルリスト
						}
						else
						{
							_calendar[m].days[d].body.border.visible = false;
						}
					}
				}
			}
		}
		//カレンダーの表示クリア
		private function _clearCalendar(): void
		{
			PostBox.send("changeToolBox", {tool: null});
			var m: String;
			var d: String;
			for(m in _calendar)
			{
				for(d in _calendar[m].days)
				{
					_calendar[m].days[d].body.border.visible = false;
				}
			}
		}


	}
}
