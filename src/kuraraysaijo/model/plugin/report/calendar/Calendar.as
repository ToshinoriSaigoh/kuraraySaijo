package kuraraysaijo.model.plugin.report.calendar
{
	import model.plugin.report.*;

	import common.db.DB;
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

		private var _calendar: Object;//_calendar[1～12]{body: monthPanel(Sprite), days: {1～31: box(Day)}} //Day(VC) -> DayBody(Sprite)
		public function Calendar(parent: VC, y: uint)
		{
			_calendarWidth = 2080;//1040////saigoh
			_calendarHeight = 1880;//940////saigoh
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

		public function PB_changeReport_after(): void
		{
			var param: Object = PostBox.get("PB_changeReport_after");
			if(id != param.report) return;
			PostBox.send("changeTool", {tool: "calendarTool"});
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
				if(Draw.activeReport.id != id) PostBox.send("changeReport", {report: String(year)});
				__startCalendar();
				ControlPanel.controlPanel.visible = false;
				_updateFileList();
				function __startCalendar(): void
				{
					var reportScreen: Sprite = Global.get("reportScreen") as Sprite;
					reportScreen.addEventListener(MouseEvent.CLICK, _dayClickHandler);
				}
			}
			else
			{
				__stopCalendar();
				function __stopCalendar(): void
				{
					var i: uint;
					for(i = 0; i < pageCollection.source.length; i++)
					{
						_calendar[String(i + 1)].body.removeEventListener(MouseEvent.CLICK, _dayClickHandler);
					}
				}
			}
		}

		//dataXML保存//非同期
		public function saveDataTree(completeFunc: Function = null): void
		{
			var reportTree: XML = myDataElement;
			StorageUtils.saveTextFile(reportDir.resolvePath("data/data.xml"), reportTree.toXMLString(), completeFunc, FileMode.WRITE);
		}

		//カレンダーコンテンツ配置
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

		//monthPanelに日付(Daybody)を貼り付け・整列
		private function _setMonthPanel(m: uint, date: Date): void
		{
			_calendar[String(m + 1)] = {body: null, days: null};
			var monthPanel: Sprite = new Sprite();
			monthPanel.mouseEnabled = false;
			monthPanel.doubleClickEnabled = false;
			monthPanel.tabEnabled = false;
			monthPanel.mouseChildren = true;

			var theMonth: String = String(date.getMonth() + 1);
			var yearField: UITextField = new UITextField();
			var formatYear: TextFormat = new TextFormat();
			formatYear.color = 0x222222;
			formatYear.size = 96;
			yearField.embedFonts = true;
			formatYear.font = Lib.notoSansMonoCJKJP;
			yearField.defaultTextFormat = formatYear;
			yearField.setTextFormat(formatYear);
			yearField.mouseEnabled = false;
			yearField.name = "yearField";
			yearField.text = String(year);
			yearField.width = 300;
			yearField.height = 120;
			yearField.border = false;
			yearField.background = false;
			yearField.styleName = "calendarYearField";
			yearField.type = TextFieldType.DYNAMIC;
			monthPanel.addChild(yearField);

			var monthField: UITextField = new UITextField();
			var formatMonth: TextFormat = new TextFormat();
			formatMonth.color = 0x222222;
			formatMonth.size = 192;
			formatMonth.bold = true;
			formatMonth.align = TextFormatAlign.CENTER;
			formatMonth.font = Lib.notoSansMonoCJKJP;
			monthField.embedFonts = true;
			monthField.setTextFormat(formatMonth);
			monthField.defaultTextFormat = formatMonth;
			monthField.mouseEnabled = false;
			monthField.name = "monthField";
			monthField.text = String(date.getMonth() + 1);
			monthField.width = 300;
			monthField.height = 240;
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
			formatWeekHead.size = 72;
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
				weekHeadArr[n].width = 280;
				weekHeadArr[n].height = 100;
				weekHeadArr[n].border = false;
				weekHeadArr[n].background = false;
				weekHeadArr[n].x = (i - firstWeekDay) * 300;
				weekHeadArr[n].y = 248;
				weekHeadArr[n].text = String(weekDayArr[n]);
				weekHeadArr[n].styleName = "calendarHead";
				weekHeadArr[n].type = TextFieldType.DYNAMIC;
				monthPanel.addChild(weekHeadArr[n]);
			}
			//整列
			yearField.text = String(year);
			yearField.x = 0;
			yearField.y = 20;
			monthField.x = (monthPanel.width / 2) - (monthField.width / 2);
			monthField.y = 20;

			days = [];
			var daysNum: uint;//ひと月に表示する日数

			var firstDay: Date = new Date(date.fullYear, date.getMonth(), 1);
			var fd: int = firstDay.getDay() < firstWeekDay ? firstDay.getDay() + 7 : firstDay.getDay();
			var lastDays: int = -(fd - firstWeekDay);

			var boxW: uint;
			var boxH: uint;
			var col: uint = 360;//日付Y基準値
			var row: uint = 0;
			var boxMargin: uint = 20;
			var lastDate: Date = new Date(date.fullYear, date.getMonth() + 1, -1);//月末

			if(lastDays < -5 && lastDate.getDate() > 29)
			{
				daysNum = 42;
				boxW = 280;
				boxH = 240;
			}
			else
			{
				daysNum = 35;
				boxW = 280;
				boxH = 280;
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

		//mouthPanelをレイヤーに貼り付けて位置調整
		private function _mount(): void
		{
			var i: uint;
			for(i = 0; i < pageCollection.source.length; i++)
			{
				pageCollection.source[i].drawLayers[0].body.addChildAt(_calendar[String(i + 1)].body, 0);
				_calendar[String(i + 1)].body.x = (viewWidth / 2) - (_calendar[String(i + 1)].body.width / 2);
				_calendar[String(i + 1)].body.y = viewHeight / 2160 * 35;
			}
		}
		private function _dayClickHandler(evt: MouseEvent): void
		{
			if(Draw.activeTool != "calendarTool") return;
			_clearCalendar();
			if(!evt.target.hasOwnProperty("ctrlr")) return;
			var dataElement: XML;
			var m: String;
			for(m in _calendar)
			{
				if(!evt.target.ctrlr.hasOwnProperty("month")) return;
				if(m == evt.target.ctrlr.calendarMonth)//当月かどうか
				{
					var d: String;
					for(d in _calendar[m].days)
					{
						if(d == String(evt.target.ctrlr.day) && m == evt.target.ctrlr.month)
						{
							var xml: XML = _filesXML.elements("month").(attribute("name") == evt.target.ctrlr.month).elements("day").(attribute("name") == evt.target.ctrlr.day)[0];
							var fileName: String = String(year) + Lib.digitNum(Number(m), 2) + Lib.digitNum(Number(d), 2);
							if(evt.target.ctrlr.hasOwnReport())
							{
								PostBox.send("loadZip", {year: String(year), month: m, fileName: fileName, mode: null});
							}
							else
							{
								dataElement = <xml year={String(year)} month={m} day={d}/>;
								PostBox.send("addReport", {type: "kuraraysaijo", report: fileName, dataElement: dataElement});
							}
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
		//カレンダー内DayBodyの枠線表示クリア
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

		//カレンダー更新
		public function MSG_refreshCalendar(): void
		{
			var n: String;
			var m: String;
			for(n in _calendar)
			{
				for(m in _calendar[n].days)
				{
					_calendar[n].days[m].updateBody();
				}
			}
		}
	}
}
