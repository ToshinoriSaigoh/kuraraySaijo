package controller.documentroot.reportscreen
{
	import kuraraysaijo.model.plugin.report.KuraraySaijoReport;
	import kuraraysaijo.model.plugin.report.calendar.Calendar;
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

	public class DrawContents extends VC
	{
		[Bindable]
		public static var reportCollection: ArrayCollection;
		public static var drawContentsBody: Object;
		public var myDataElement: XML;
		public function DrawContents()
		{
			vcName = "drawContents";
			elementName = "group";
			super();

			Global.define("activeReport", Draw);

			reportCollection = new ArrayCollection([]);
			myDataElement = <group name="drawContents"/>;
			Dom.dataTree.appendChild(myDataElement);
		}

		override protected function init(): void
		{
			caller.vcDrawContents = this;
			drawContentsBody = mxml;
		}

		public function MSG_appStart_after(): void
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
				PostBox.send("changeReport", {report: String(now.getFullYear())});
			}
		}

		//新規レポート作成
		public function PB_addReport(): void
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
					_addEmergency(reportID, null, type, emergencyName);
					break;
				default:
					_addReport(reportID, dataElement, type);

			}
			PostBox.send("changeReport", {report: reportID});
		}

		//レポートディレクトリ（解凍したレポートデータ.zip）からレポートを開く
		public function GW_openReport(): void
		{
			trace("■GW_openReport");
			var param: Object = PostBox.get("GW_openReport");
			if(_hasOwnReport(param.xml.@name))
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
					_addEmergency(param.xml.@name, param.xml, param.xml.@type, param.xml.@category, param.mode);
				}
				else
				{
					_addReport(param.xml.@name, param.xml, param.xml.@type, param.mode);
				}
			}
		}
		public function PB_openReport_after(): void
		{
			var param: Object = PostBox.get("PB_openReport_after");
			Load.loadDB(Report.reportMap[param.xml.@name]);
			PostBox.send("changeReport", {report: param.xml.@name});
		}

		private function _changeToFirstPage(report: Report): void
		{
			var pageID: uint = report.getFirstPageID();
			PostBox.send("changePage", {report: report.vcName, page: pageID});
		}

		private function _addReport(reportID: String, reportElement: XML = null, reportType: String = "default", mode: String = null): void
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
				report = new KuraraySaijoReport(this, reportID, reportElement.@year, reportElement.@month, reportElement.@day) as Report;
			}
			else
			{
				report = new Report(this, reportID, reportElement, reportType, mode);
			}
			caller.vcSideBar.addPager(report);
		}
		private function _addEmergency(reportID: String, reportElement: XML = null, reportType: String = "emergency", emergencyType: String = "0", mode: String = null): void
		{
			//ファイル一覧作成
			var drawContents: VC = this as VC;
			reportElement = reportElement == null ? Emergency.emergencyXML.elements("report").(attribute("name") == emergencyType)[0].copy() : reportElement;
			var emergencyReport: EmergencyReport = new EmergencyReport(drawContents, reportType, reportID, reportElement, emergencyType, mode);
			caller.vcSideBar.addPager(Report(emergencyReport));
		}

		//レポート削除後にレポート切り替え
		public function PB_deleteCompleteReport(): void
		{
			if(DrawContents.reportCollection.length != 0)
			{
				var report: Report = DrawContents.reportCollection.getItemAt(DrawContents.reportCollection.length - 1) as Report;
				//var report: Report = DrawContents.reportCollection.getItemAt(0) as Report;//レポート削除時にカレンダー表示
				PostBox.send("changeReport", {report: report.id});
			}
		}

		public function PB_changeReport_before(): void
		{
			PostBox.send("flushBuffer", {buffer: "saveBuffer"});
			var param: Object = PostBox.get("PB_changeReport_before");

			//レポート切り替え前にアクティブパネルのバッファをフラッシュしておく
			if(_hasOwnReport(param.report))
			{
				if(Draw.activeDrawPanel != null)
				{
					PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: Draw.activeDrawPanel.caller.vcName, page: Draw.activeDrawPanel.vcName});
					PostBox.send("flushBuffer", {buffer: "saveBuffer"});
				}
			}
		}
		//レポート切り替え
		public function PB_changeReport(): void
		{
			var param: Object = PostBox.get("PB_changeReport");
			if(_hasOwnReport(param.report))
			{
				Draw.setActiveReport(Report.reportMap[param.report]);
				if(Draw.activeDrawPanel != null)
				{
					PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: Draw.activeDrawPanel.caller.vcName, page: Draw.activeDrawPanel.vcName});
					PostBox.send("flushBuffer", {buffer: "saveBuffer"});
				}
				_changeReport(param.report);

				if(isNaN(Report.reportMap[param.report].activePageID))
				{
					_changeToFirstPage(Report.reportMap[param.report]);
				}
				else
				{
					PostBox.send("changePage", {report: param.report, page: Report.reportMap[param.report].activePageID});
				}
			}
		}
		private function _changeReport(reportID: String): void
		{
			var report: Object = Report.reportMap[reportID] as Report;
			mxml.drawContentsViewStack.selectedChild = report.mxml;
			Global.set("activeReport", report);
			caller.vcSideBar.selectPager(report.id);
		}

		private function _hasOwnReport(reportID: String): Boolean
		{
			if(myDataElement.elements("report").(attribute("name") == reportID)[0] != null)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}
