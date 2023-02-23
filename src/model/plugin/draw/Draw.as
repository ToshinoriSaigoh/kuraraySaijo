package model.plugin.draw
{
/**
 * 描画系のクラスが継承する.
 * 共通項目はこのクラスが静的プロパティでもつ。
 *
 * update 2018/01/24
 * Since 2018/01/24
 * @private
 */
	import common.*;
	import model.app.*;
	import model.plugin.draw.*;
	import model.plugin.draw.edittool.EditBox;
	import model.plugin.report.Report;
	import flash.display.*;
	import flash.events.*;
	import flash.filesystem.File;
	public class Draw extends Plug
	{
		[Bindable]
		public static var activeReport: Object;
		[Bindable]
		public static var activeDrawPanel: Object;

		[Bindable]
		public static var lineColor: Number;
		[Bindable]
		public static var fillColor: Number;
		[Bindable]
		public static var thick: uint;
		[Bindable]
		public static var alpha: Number;

		[Bindable]
		public static var stampSize: int;
		[Bindable]
		public static var imageSize: int;
		[Bindable]
		public static var textSize: int;

		public static var decenter: Boolean = false;//中央から描画

		public static var controlPanel: Sprite;
		public static var drawList: Object = {};
		public static var drawBuffer: Object = {
			simpleBuffer: {},
			saveBuffer: {},
			loadBuffer: {}
		};
		public static var undoCnt: uint = 50;
		public static var activeTool: String;

		public var toolOption: Object = {};
		protected var tmpBufferData: Object = {};//一時的描画データ
		protected var toolName: String;
		protected var targetLayer: DrawLayer;
		protected var targetDiv: EditBox;
		protected var touchCnt: int;
		protected var touchID: int;
		public function Draw()
		{
			super();
		}

		public static function setActiveReport(report: Object): void
		{
			activeReport = report as Report;
		}

		public static function createBufferData(toolName: String, operation: String, id: String, option: Object = null): Object
		{
			return {
				key : toolName,
				val:
				{
					id: id,
					report: activeDrawPanel.report.vcName,
					page: activeDrawPanel.vcName,
					layer: activeDrawPanel.activeLayer.vcName,
					div: activeDrawPanel.targetEditBox != null ? activeDrawPanel.targetEditBox.id : null,
					operation: operation,
					author: Global.get("myTerminalID"),
					option: option,
					firstTime: String(Draw.activeReport.getNowTime()),
					lastTime: null,
					stroke: []
				}
			};
		}

		public static function createDrawBuffer(reportID: String, page: String): void
		{
			addTree(drawBuffer["simpleBuffer"]);//ローカル入力用
			addTree(drawBuffer["loadBuffer"]);//ファイル展開用
			addTree(drawBuffer["saveBuffer"]);//simple,motionをflushしたときに保存用に溜めておく

			function addTree(tree: Object): void
			{
				if(!tree.hasOwnProperty(reportID))
				{
					tree[reportID] = {};
					DrawPlayer.createBufferMap(reportID);
				}
				if(!tree[reportID].hasOwnProperty(page))
				{
					tree[reportID][page] = [];
				}
			}
		}
		public static function clearBuffer(bufferName: String): void
		{
			var i: String;
			if(!drawBuffer.hasOwnProperty(bufferName))
			{
				drawBuffer[bufferName] = [];
			}
			else
			{
				for(i in drawBuffer)
				{
					drawBuffer[i] = [];
				}
			}
		}

		protected function down(pointX: Number, pointY: Number): void {}
		protected function move(pointX: Number, pointY: Number): void {}
		protected function up(pointX: Number, pointY: Number): void {}

		/*
		//ドローパネルに対応するデータ保存用ディレクトリのFileオブジェクトを返す
		//引数で指定しない場合はアクティブドローパネルを適用する
		public static function getDrawPanelDirectory(reportID: String = null, pageID: String = null): File
		{
			reportID = reportID == null ? activeDrawPanel.caller.vcName : reportID;
			var pageName: String = pageID == null ? activeDrawPanel.vcName : pageID;
			var path: String = reportID + "/data/" + pageName;
			return Lib.getSystemFileObject(path);
		}
		*/
		//drawパネル取得
		//なければ作る
		public static function getDrawPanel(reportID: String, pageID: String): Object
		{
			var panel: Object;
			var structure: Array = ["dom", "screen", "panel", "list", "report", "page"];
			var names: Array = ["mainTimeline", "reportScreen", "drawPanel", "reportMap", reportID, pageID];

			if(VC.vcList.hasOwnProperty(names.join(".")))
			{
				panel = VC.vcList[names.join(".")];
			}
			return panel;
		}

		//バッファーに追加する
		public static function addDrawBuffer(tmpBufferData: Object, drawPanel: Object = null): void
		{
		}
	}
}
