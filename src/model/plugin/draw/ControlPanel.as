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
	import model.plugin.draw.*;
	import model.plugin.draw.scrolltool.ScrollTool;
	import model.plugin.draw.zoomtool.ZoomTool;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.events.*;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.geom.Point;

	public class ControlPanel extends VC
	{
		public static var controlPanel: Object;
		public static var eventFunction: Object;
		private static var _rect: Graphics;
		private var _tmpPoint: Point;
		private var _touchCnt: int;
		private var _touchID: int;
		private var _currentPoint: Point;
		public function ControlPanel(parent: VC)
		{
			vcName = "controlPanel";
			super();
			caller = parent;
			_tmpPoint = new Point(0, 0);
			_createPanel();
			Global.define("controlPanel", ControlPanel);
			controlPanel = this.body;
			clearEventFunction();
		}

		public function MSG_windowResize(): void
		{
			body.width = App.mainStage.stageWidth;
			body.height = App.mainStage.stageHeight;
		}

		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			Draw.activeTool = param.tool;
			switch(param.tool)
			{
				case "scrollTool":
				case "calendarTool":
					_startGesture();
					_stopControl();
					break;
				default:
					_startTouchPoint();
			}
		}

		//手書き操作用パネル作成
		private function _createPanel(): void
		{
			body = new Sprite();
			body.name = vcName;
			_rect = body.graphics;
			_rect.beginFill(0xffffff, 0);
			_rect.drawRect(0, 0, App.mainStage.stageWidth, App.mainStage.stageHeight);
			_rect.endFill();
			caller.body.addChild(body);
			_startTouchPoint();
		}

		private function _startGesture(): void
		{
			if(Multitouch.supportedGestures)
			{
				Multitouch.inputMode = MultitouchInputMode.GESTURE;
				body.addEventListener(TransformGestureEvent.GESTURE_PAN, ScrollTool.gesturePanHandler);
				body.addEventListener(TransformGestureEvent.GESTURE_ZOOM, ZoomTool.gestureZoomHandler);
			}
		}
		private function _stopGesture(): void
		{
			if(Multitouch.supportedGestures)
			{
				body.removeEventListener(TransformGestureEvent.GESTURE_PAN, ScrollTool.gesturePanHandler);
				body.removeEventListener(TransformGestureEvent.GESTURE_ZOOM, ZoomTool.gestureZoomHandler);
				Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			}
		}
		private function _startTouchPoint(): void
		{
			_stopGesture();
			if(Multitouch.supportsTouchEvents)
			{
				Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
				body.addEventListener(TouchEvent.TOUCH_BEGIN, _touchBeginHandler);
				body.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler);
			}
			else
			{
				body.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler);
			}
		}

		private function _stopControl(): void
		{
			body.removeEventListener(TouchEvent.TOUCH_BEGIN, _touchBeginHandler);
			//body.removeEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler);
		}

		//イベントハンドラー初期化
		public static function clearEventFunction(): void
		{
			eventFunction = {down: none, move: none, up: none};
			function none(pointX: Number, pointY: Number): void {}
		}

		//タッチ開始イベント
		protected function _touchBeginHandler(evt: TouchEvent): void
		{
			evt.stopImmediatePropagation();
			if(_touchCnt > 0 || Draw.activeDrawPanel == null || _touchID != 0)
			{
				return;
			}
			_touchCnt++;
			_touchID = evt.touchPointID;
			_tmpPoint.x = evt.stageX;
			_tmpPoint.y = evt.stageY;
			_currentPoint = Draw.activeDrawPanel.targetEditBox != null ? Draw.activeDrawPanel.targetEditBox.box.globalToLocal(_tmpPoint) : Draw.activeDrawPanel.body.globalToLocal(_tmpPoint);
			eventFunction.down.call(null, _currentPoint.x, _currentPoint.y);
			controlPanel.stage.addEventListener(TouchEvent.TOUCH_MOVE, _touchMoveHandler);
			controlPanel.stage.addEventListener(TouchEvent.TOUCH_END, _touchUpHandler);
		}

		//タッチ移動イベント
		protected function _touchMoveHandler(evt: TouchEvent): void
		{
			evt.stopImmediatePropagation();
			if(Draw.activeDrawPanel == null || _touchID != evt.touchPointID) return;
			_tmpPoint.x = evt.stageX;
			_tmpPoint.y = evt.stageY;
			_currentPoint = Draw.activeDrawPanel.targetEditBox != null ? Draw.activeDrawPanel.targetEditBox.box.globalToLocal(_tmpPoint) : Draw.activeDrawPanel.body.globalToLocal(_tmpPoint);
			eventFunction.move.call(null, _currentPoint.x, _currentPoint.y);
		}

		//タッチ終了イベント
		protected function _touchUpHandler(evt: TouchEvent): void
		{
			if(_touchID != evt.touchPointID)
			{
				return;
			}
			controlPanel.stage.removeEventListener(TouchEvent.TOUCH_MOVE, _touchMoveHandler);
			controlPanel.stage.removeEventListener(TouchEvent.TOUCH_END, _touchUpHandler);
			_tmpPoint.x = evt.stageX;
			_tmpPoint.y = evt.stageY;
			_currentPoint = Draw.activeDrawPanel.targetEditBox != null ? Draw.activeDrawPanel.targetEditBox.box.globalToLocal(_tmpPoint) : Draw.activeDrawPanel.body.globalToLocal(_tmpPoint);
			eventFunction.up.call(null, _currentPoint.x, _currentPoint.y);
			_touchID = 0;
			_touchCnt = 0;
		}

		// マウスプレスイベント
		protected function _mouseDownHandler(evt:  MouseEvent): void
		{
			evt.stopImmediatePropagation();
			if(Draw.activeDrawPanel == null) return;
			controlPanel.stage.addEventListener(MouseEvent.MOUSE_MOVE, _mouseMoveHandler);
			controlPanel.stage.addEventListener(MouseEvent.MOUSE_UP, _mouseUpHandler);
			_tmpPoint.x = evt.stageX;
			_tmpPoint.y = evt.stageY;
			_currentPoint = Draw.activeDrawPanel.targetEditBox != null ? Draw.activeDrawPanel.targetEditBox.box.globalToLocal(_tmpPoint) : Draw.activeDrawPanel.body.globalToLocal(_tmpPoint);
			eventFunction.down.call(null, _currentPoint.x, _currentPoint.y);
		}
		// マウス移動イベント
		protected function _mouseMoveHandler(evt: MouseEvent): void
		{
			evt.stopImmediatePropagation();
			if(Draw.activeDrawPanel == null) return;
			_tmpPoint.x = evt.stageX;
			_tmpPoint.y = evt.stageY;
			_currentPoint = Draw.activeDrawPanel.targetEditBox != null ? Draw.activeDrawPanel.targetEditBox.box.globalToLocal(_tmpPoint) : Draw.activeDrawPanel.body.globalToLocal(_tmpPoint);
			eventFunction.move.call(null, _currentPoint.x, _currentPoint.y);
		}

		// マウスアップイベント
		protected function _mouseUpHandler(evt: MouseEvent): void
		{
			controlPanel.stage.removeEventListener(MouseEvent.MOUSE_MOVE, _mouseMoveHandler);
			controlPanel.stage.removeEventListener(MouseEvent.MOUSE_UP, _mouseUpHandler);
			if(Draw.activeDrawPanel == null) return;
			_tmpPoint.x = evt.stageX;
			_tmpPoint.y = evt.stageY;
			_currentPoint = Draw.activeDrawPanel.targetEditBox != null ? Draw.activeDrawPanel.targetEditBox.box.globalToLocal(_tmpPoint) : Draw.activeDrawPanel.body.globalToLocal(_tmpPoint);
			eventFunction.up.call(null, _currentPoint.x, _currentPoint.y);
		}
	}
}
