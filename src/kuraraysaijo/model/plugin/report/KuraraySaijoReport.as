package kuraraysaijo.model.plugin.report
{
/**
 * 複数のページを含んだレポートクラス.
 *
 * update 2018/06/25
 * Since 2018/06/25
 * @private
 */
	import model.plugin.report.Report;
	import mx.core.UIComponent;
	public class KuraraySaijoReport extends Report
	{
		public var year: String;
		public var month: String;
		public var day: String;
		public function KuraraySaijoReport(parent: VC, reportID: String, dataElement: XML)
		{
			this.year = dataElement.@year;
			this.month = dataElement.@month;
			this.day = dataElement.@day;
			var dataElement: XML = dataElement.elements("page").length() > 0 ? dataElement : <report id={reportID} year={year} month={month} day={day} name={reportID} type="kuraraysaijo" baseTime={baseTime.toString()}>
				<record/>
				<page id="0" name="0">
					<layer id="0" name="0"/>
					<layer id="1" name="1"/>
				</page>
				<schedule/>
				<nextschedule/>
				<message/>
			</report>;
			super(parent, reportID, dataElement, "kuraraysaijo", null);
		}

		//カレンダーに移動するときレポートを保存して閉じる
		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			if(param.tool == "calendarTool")
			{
				closeReport();
			}
		}

		//保存して閉じる
		override public function closeReport(fnc: Function = null): void
		{
			PostBox.send("saveZip", {report: id}, compSaveReport);
			function compSaveReport(): void
			{
				deleteMyself(compDelReport);
			}
			function compDelReport(): void
			{
				if(fnc != null) fnc.call(null);
				/*
				var n: String;
				if(reportList.length == 0)
				{
					trace("■■■■■■■fnc.call", id, reportList.length);
					if(fnc != null) fnc.call(null);
				}
				*/
			}
		}

		//レポート完成時処理
		override public function creationComplete(): void
		{
			_mount();

			PostBox.send("changePage", {report: vcName, page: getFirstPageID()});
			if(GroupWork.hasOwnWork("GW_openReport"))
			{
				GroupWork.done("GW_openReport");
			}
			else
			{
				PostBox.send("creationCompleteReport", {report: vcName});
				PostBox.send("saveZip", {report: id});
			}
		}

		override protected function newSave(): void
		{
			save = new KuraraySaijoSave(this as Report);
		}

		override protected function createBody(): void
		{
			mxml = new KuraraySaijoReportBody(this);
		}

		//0ページ0レイヤーに背景貼り付け
		private function _mount(): void
		{
			//background
			pageCollection.source[0].drawLayers[0].body.graphics.beginFill(0xffffff, 1.0);
			pageCollection.source[0].drawLayers[0].body.graphics.drawRect(0, 0, 1920, 1080);
			pageCollection.source[0].drawLayers[0].body.graphics.endFill();

			//monitor
			var container: UIComponent = new UIComponent();
			var monitorContainer: MonitorContainer = new MonitorContainer();
			container.addChild(monitorContainer);
			pageCollection.source[0].drawLayers[0].body.addChild(container);

			//image svg
			[Embed(source = "./KuraraySaijoReportBG.svg", mimeType="application/octet-stream")]
			var Svg: Class;
			Lib.setSvg(monitorContainer.background, Svg);
		}
	}
}
