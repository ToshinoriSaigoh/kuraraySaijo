package kuraraysaijo.controller.documentroot.reportscreen
{
	import kuraraysaijo.model.plugin.report.KuraraySaijoReport;
	import kuraraysaijo.model.plugin.report.calendar.Calendar;
	import controller.documentroot.reportscreen.DrawContents;
	import common.*;
	import model.plugin.report.*;
	import model.plugin.report.emergency.*;
	import model.plugin.draw.*;
	import model.plugin.draw.handdraw.HandDraw;
	import model.plugin.draw.shapetool.ShapeTool;
	import model.plugin.draw.imagetool.ImageTool;
	import model.plugin.draw.edittool.EditTool;
	import model.plugin.draw.scrolltool.ScrollTool;
	import model.plugin.draw.zoomtool.ZoomTool;
	import model.plugin.draw.hidetool.HideTool;
	import model.plugin.draw.texttool.TextTool;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.filesystem.File;
	import mx.collections.ArrayCollection;

	public class DrawContents extends controller.documentroot.reportscreen.DrawContents
	{
		public function DrawContents()
		{
			super();
		}

		override protected function init(): void
		{
			caller.vcDrawContents = this;
			drawContentsBody = mxml;
		}

		override public function MSG_appStart_after(): void
		{
			new Load();
			new ControlPanel(this);
			new DrawPlayer();
			new ZoomTool();
			new ScrollTool();
			new HandDraw();
			new ShapeTool();
			new ImageTool();
			new EditTool();
			new HideTool();
			new TextTool();

			_openCalendar();
		}

		//日付更新でレポートを開く
		public function MSG_openTodayReport(): void
		{
			_openTodayReport();
		}

		private function _openCalendar(): void
		{
			var now: Date = new Date();
			var path: String = "calendar/" + String(now.getFullYear());
			var calendarFile: File = Lib.getSystemFileObject(path);
			if(calendarFile.exists)
			{
				PostBox.send("loadReport", {dirPath: path});
			}
			else
			{
				var calendar: Calendar = new Calendar(this, now.getFullYear());
				caller.vcSideBar.addPager(Report(calendar));

				_openTodayReport();
			}
		}
		private function _openTodayReport(): void
		{
			var now: Date = new Date();
			var year: String = String(now.getFullYear());
			var month: String = String(now.getMonth() + 1);
			var day: String = String(now.getDate());
			var fileName: String = year + Lib.digitNum(Number(month), 2) + Lib.digitNum(Number(day), 2);
			var files: File = Lib.getAppFileObject(String(year));
			//レポートが開いている場合はチェンジレポート
			if(Report.reportMap.hasOwnProperty(fileName))
			{
				PostBox.send("changeReport", {report: fileName});
			}
			else
			{
				StorageUtils.loadTextFile(files.resolvePath("files.xml"), __loadFileList);
			}
			function __loadFileList(res: String, loadTxt: String): void
			{
				if(res == StorageUtils.OK)
				{
					var filesXML: XML = new XML(loadTxt);
					var xmlList: XMLList = filesXML.elements("month").(attribute("name") == month).elements("day").(attribute("name") == day);
					__loadOrCreateReport(xmlList.length() > 0);
				}
				else if(res == StorageUtils.FILE_NOT_FOUND)
				{
					__loadOrCreateReport(false);
				}
				else
				{
					//ERROR
				}
			}
			function __loadOrCreateReport(loadFlag: Boolean): void
			{
				if(loadFlag)
				{
					PostBox.send("loadZip", {year: year, month: month, fileName: fileName, mode: null});
				}
				else
				{
					var dataElement: XML;
					dataElement = <xml year={year} month={month} day={day}/>;
					PostBox.send("addReport", {type: "kuraraysaijo", report: fileName, dataElement: dataElement});
				}
			}
		}

		//新規レポート作成
		override public function PB_addReport(): void
		{
			var param: Object = PostBox.get("PB_addReport");
			var type: String = param.hasOwnProperty("type") ? param.type : null;
			var emergencyName: String = param.hasOwnProperty("emergency") ? param.emergency : null;
			var reportID: String = param.hasOwnProperty("report") ? param.report : Lib.getDateTimeString();
			var dataElement: XML = param.dataElement != null ? param.dataElement : null;
			switch(type)
			{
				case "emergency":
				case "trouble":
					addEmergency(reportID, null, type, emergencyName);
					break;
				default:
					addReport(reportID, dataElement, type);

			}
			PostBox.send("changeReport", {report: reportID});
		}

		//レポートディレクトリ（解凍したレポートデータ.zip）からレポートを開く
		override public function GW_openReport(): void
		{
			var param: Object = PostBox.get("GW_openReport");
			if(hasOwnReport(param.xml.@name))
			{
				//同名のレポートがあったときの処理
				//レポートを初期化する
				trace("#GW_openReport　true [すでに開かれているレポート]", param.xml.@name);
				GroupWork.done("GW_openReport");//GW終了
			}
			else
			{
				//レポート作成
				if(param.xml.@type == "emergency" || param.xml.@type == "trouble")
				{
					addEmergency(param.xml.@name, param.xml, param.xml.@type, param.xml.@category, param.mode);
				}
				else
				{
					addReport(param.xml.@name, param.xml, param.xml.@type, param.mode);
				}
			}
		}
		override public function PB_openReport_after(): void
		{
			var param: Object = PostBox.get("PB_openReport_after");
			Load.loadDB(Report.reportMap[param.xml.@name]);
			if(Report.reportMap[param.xml.@name].reportType == "calendar")
			{
				_openTodayReport();
			}
			else
			{
				PostBox.send("changeReport", {report: param.xml.@name});
			}
		}


		//レポート削除後にレポート切り替え
		override public function PB_deleteCompleteReport(): void
		{
			if(controller.documentroot.reportscreen.DrawContents.reportCollection.length != 0)
			{
				var report: Report = controller.documentroot.reportscreen.DrawContents.reportCollection.getItemAt(controller.documentroot.reportscreen.DrawContents.reportCollection.length - 1) as Report;
				//var report: Report = DrawContents.reportCollection.getItemAt(0) as Report;//レポート削除時にカレンダー表示
				PostBox.send("changeReport", {report: report.id});
			}
		}

		override public function PB_changeReport_before(): void
		{
			PostBox.send("flushBuffer", {buffer: "saveBuffer"});
			var param: Object = PostBox.get("PB_changeReport_before");

			//レポート切り替え前にアクティブパネルのバッファをフラッシュしておく
			if(hasOwnReport(param.report))
			{
				if(Draw.activeDrawPanel != null)
				{
					PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: Draw.activeDrawPanel.caller.vcName, page: Draw.activeDrawPanel.vcName});
					PostBox.send("flushBuffer", {buffer: "saveBuffer"});
				}
			}
		}
		//レポート切り替え
		override public function PB_changeReport(): void
		{
			var param: Object = PostBox.get("PB_changeReport");
			if(hasOwnReport(param.report))
			{
				Draw.setActiveReport(Report.reportMap[param.report]);
				if(Draw.activeDrawPanel != null)
				{
					PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: Draw.activeDrawPanel.caller.vcName, page: Draw.activeDrawPanel.vcName});
					PostBox.send("flushBuffer", {buffer: "saveBuffer"});
				}
				changeReport(param.report);

				if(isNaN(Report.reportMap[param.report].activePageID))
				{
					changeToFirstPage(Report.reportMap[param.report]);
				}
				else
				{
					PostBox.send("changePage", {report: param.report, page: Report.reportMap[param.report].activePageID});
				}
			}
		}
		override protected function addReport(reportID: String, reportElement: XML = null, reportType: String = "default", mode: String = null): void
		{
			if(reportElement != null)
			{
				var i: int;
				for(i = 0; i < reportElement.attributes().length(); i++)
				{
					if(reportElement.attributes()[i].name() == "type")
					{
						reportType = reportElement.@type;
					}
				}
			}
			var report: Report;
			if(reportType == "calendar")
			{
				report = new Calendar(this, int(reportID)) as Report;
			}
			else if(reportType == "kuraraysaijo")
			{
				report = new KuraraySaijoReport(this, reportID, reportElement) as Report;
			}
			else
			{
				report = new Report(this, reportID, reportElement, reportType, mode);
			}
			caller.vcSideBar.addPager(report);
		}
	}
}
