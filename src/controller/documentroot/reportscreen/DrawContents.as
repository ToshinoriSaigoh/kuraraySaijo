package controller.documentroot.reportscreen
{
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
		}

		//新規レポート作成
		public function PB_addReport(): void
		{
			trace("■DrawContents PB_addReport()");
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
		}
		//新規レポート作成
		public function PB_creationCompleteReport(): void
		{
			var param: Object = PostBox.get("PB_creationCompleteReport");
			trace("#############PB_creationCompleteReport", param.report);
			PostBox.send("changeReport", {report: param.report});
		}
		//レポートディレクトリ（解凍したレポートデータ.zip）からレポートを開く
		public function GW_openReport(): void
		{
			trace("■GW_openReport");
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
		public function PB_openReport_after(): void
		{
			var param: Object = PostBox.get("PB_openReport_after");
			Load.loadDB(Report.reportMap[param.xml.@name]);
			PostBox.send("changeReport", {report: param.xml.@name});
		}

		protected function changeToFirstPage(report: Report): void
		{
			var pageID: uint = report.getFirstPageID();
			PostBox.send("changePage", {report: report.vcName, page: pageID});
		}

		protected function addReport(reportID: String, reportElement: XML = null, reportType: String = "default", mode: String = null): void
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

			var report: Report = new Report(this, reportID, reportElement, reportType, mode);
			caller.vcSideBar.addPager(report);
		}
		protected function addEmergency(reportID: String, reportElement: XML = null, reportType: String = "emergency", emergencyType: String = "0", mode: String = null): void
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
		public function PB_changeReport(): void
		{
			var param: Object = PostBox.get("PB_changeReport");
			trace("■■DrawContents.PB_changeReport", param.report, hasOwnReport(param.report));
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
					//trace("##changePage", param.report, Report.reportMap[param.report].activePageID);
					PostBox.send("changePage", {report: param.report, page: Report.reportMap[param.report].activePageID});
				}
			}
		}
		protected function changeReport(reportID: String): void
		{
			var report: Object = Report.reportMap[reportID] as Report;
			mxml.drawContentsViewStack.selectedChild = report.mxml;
			Global.set("activeReport", report);
			caller.vcSideBar.selectPager(report.id);
		}

		protected function hasOwnReport(reportID: String): Boolean
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
