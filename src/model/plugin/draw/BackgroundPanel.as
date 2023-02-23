package model.plugin.draw
{
/**
 * 入力値取得用パネル.
 * 手書き、図形で使用する。
 *
 * update 2018/01/24
 * Since 2018/01/24
 * @private
 */
	import controller.*;
	import controller.documentroot.reportscreen.DrawContents;
	import model.plugin.draw.*;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.geom.Point;

	public class BackgroundPanel extends VC
	{
		public static var backgroundPanel: Object;
		public static var eventFunction: Object;
		private static var _rect: Graphics;
		private var _tmpPoint: Point;
		private var _touchCnt: int;
		private var _touchID: int;
		private var _currentPoint: Point;
		public function BackgroundPanel(parent: VC)
		{
			vcName = "backgroundPanel";
			super();
			caller = parent;
			_tmpPoint = new Point(0, 0);
			_createPanel();
			Global.define("backgroundPanel", BackgroundPanel);
			backgroundPanel = this.body;
		}

		public function MSG_windowResize(): void
		{
			body.width = App.mainStage.stageWidth;
			body.height = App.mainStage.stageHeight;
		}

		//操作用パネル作成
		private function _createPanel(): void
		{
			body = new Sprite();
			body.name = vcName;
			_rect = body.graphics;
			_rect.beginFill(0xffff00, 0.5);
			_rect.drawRect(0, 0, App.mainStage.stageWidth, App.mainStage.stageHeight);
			_rect.endFill();
			DrawContents.drawContentsBody.bg.addChildAt(body, 0);
		}

	}
}
