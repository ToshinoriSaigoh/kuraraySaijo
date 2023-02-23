package model.plugin.draw.scrolltool
{
	import controller.*;
	import model.plugin.draw.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Rectangle;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;

	public class ScrollTool extends Draw
	{
		private var _scrollStartFlag: Boolean;
		private var _scrollArea: Rectangle;
		private var _dragStart: Boolean;
		private var _maxLeftX: Number;
		private var _maxRightX: Number;
		private var _maxTopY: Number;
		private var _maxBottomY: Number;
		private var _startX: Number;
		private var _startY: Number;
		private var _moveX: Number;
		private var _moveY: Number;
		private var _baseX: Number;
		private var _baseY: Number;
		private var _targetX: Number;
		private var _targetY: Number;
		private var _touchMoveID: int;

		private var _touchCnt: int;
		private var _touchID: int;
		public function ScrollTool()
		{
			toolName = "scrollTool";
			super();

			_dragStart = false;
			_touchMoveID = 0;

			//startScroll();
		}

		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			if(param.tool == "scrollTool")
			{
				startScroll();
			}
		}
		public function startScroll(): void
		{
			_touchID = 0;
			_touchCnt = 0;
			//ControlPanel.eventFunction.down = touchBeginEvent;
			ControlPanel.controlPanel.visible = true;
			ControlPanel.eventFunction.down = down;
			ControlPanel.eventFunction.move = move;
			ControlPanel.eventFunction.up = up;
		}
		protected function stopScroll(): void
		{
			ControlPanel.clearEventFunction();
		}

		//タッチパネルジェスチャー用ハンドラー
		public static function gesturePanHandler(evt: TransformGestureEvent): void
		{
			if(activeDrawPanel == null) return;
			var offsetX: int = evt.offsetX;
			var offsetY: int = evt.offsetY;

			var tempX: Number = activeDrawPanel.x + offsetX;
			switch(true)
			{
				case activeDrawPanel.dragRect.left > tempX:
					activeDrawPanel.x = activeDrawPanel.dragRect.left;
					break;
				case activeDrawPanel.dragRect.right < tempX:
					activeDrawPanel.x = activeDrawPanel.dragRect.right;
					break;
				default:
					activeDrawPanel.x += offsetX;
			}
			activeDrawPanel.setDistanceX();

			var tempY: Number = activeDrawPanel.y + offsetY;
			switch(true)
			{
				case activeDrawPanel.dragRect.top > tempY:
					activeDrawPanel.y = activeDrawPanel.dragRect.top;
					break;
				case activeDrawPanel.dragRect.bottom < tempY:
					activeDrawPanel.y = activeDrawPanel.dragRect.bottom;
					break;
				default:
					activeDrawPanel.y += offsetY;
			}
			activeDrawPanel.setDistanceY();
		}

		//タッチ開始イベント
		private function touchBeginEvent(evt: TouchEvent): void
		{
			//trace("#scroll begin:", evt.touchPointID);
			_touchCnt++;
			if(_touchCnt > 1 || activeDrawPanel == null || _touchID != 0)
			{
				_touchID = evt.touchPointID;
				//_tmpPoint.x = evt.stageX;
				//_tmpPoint.y = evt.stageY;

				//_currentPoint = activeDrawPanel.body.globalToLocal(_tmpPoint);
				//mouseDown(_currentPoint.x, _currentPoint.y);
				App.mainStage.addEventListener(TouchEvent.TOUCH_MOVE, touchMoveEvent);
				App.mainStage.addEventListener(TouchEvent.TOUCH_END, touchUpEvent);
			}
		}

		//タッチ移動イベント
		private function touchMoveEvent(evt: TouchEvent): void
		{
			//evt.stopImmediatePropagation();
			if(activeDrawPanel == null) return;
			//trace("#move:", _touchCnt, _touchID, evt.touchPointID);
			//_tmpPoint.x = evt.stageX;
			//_tmpPoint.y = evt.stageY;
			//_currentPoint = activeDrawPanel.body.globalToLocal(_tmpPoint);
			//mouseMove(_currentPoint.x, _currentPoint.y);
		}

		//タッチ終了イベント
		private function touchUpEvent(evt: TouchEvent): void
		{
			//trace("#up:", _touchCnt, _touchID, evt.touchPointID);
			if(_touchID != evt.touchPointID)
			{
				return;
			}
			App.mainStage.removeEventListener(TouchEvent.TOUCH_MOVE, touchMoveEvent);
			App.mainStage.removeEventListener(TouchEvent.TOUCH_END, touchUpEvent);
			//_tmpPoint.x = evt.stageX;
			//_tmpPoint.y = evt.stageY;
			//_currentPoint = activeDrawPanel.body.globalToLocal(_tmpPoint);
			//mouseUp(_currentPoint.x, _currentPoint.y);
			_touchID = 0;
			_touchCnt = 0;
			//evt.stopImmediatePropagation();
		}



		////マウス用ドラッグ
		override protected function down(pointX: Number, pointY: Number): void
		{
			activeDrawPanel.body.startDrag(false, activeDrawPanel.dragRect);
		}
		override protected function up(pointX: Number, pointY: Number): void
		{
			activeDrawPanel.body.stopDrag();
		}

		////タッチ用ドラッグ
		private function _onTouchBegin(evt: TouchEvent): void
		{
			var bodyX: int = activeDrawPanel.body.x;
			var bodyY: int = activeDrawPanel.body.y;
			var startX: int = evt.stageX;
			var startY: int = evt.stageY;
			var lenX: int = 0;
			var lenY: int = 0;
			if(_touchMoveID != 0)
			{
				return;
			}
			_touchMoveID = evt.touchPointID;
			App.mainStage.addEventListener(TouchEvent.TOUCH_MOVE, onTouchMove);
			App.mainStage.addEventListener(TouchEvent.TOUCH_END, onTouchEnd);
			function onTouchMove(evt: TouchEvent): void
			{
				lenX = activeDrawPanel.bodyX + (evt.stageX - startX);
				lenY = activeDrawPanel.bodyY + (evt.stageY - startY);
				if(evt.touchPointID != _touchMoveID)
				{
					return;
				}
				activeDrawPanel.body.x = lenX < activeDrawPanel.dragRect.left ? activeDrawPanel.dragRect.left : lenX;
				activeDrawPanel.body.y = lenY < activeDrawPanel.dragRect.top ? activeDrawPanel.dragRect.top : lenY;
			}
			function onTouchEnd(evt: TouchEvent): void
			{
				if(evt.touchPointID != _touchMoveID)
				{
					return;
				}
				_touchMoveID = 0;
				App.mainStage.removeEventListener(TouchEvent.TOUCH_MOVE, onTouchMove);
				App.mainStage.removeEventListener(TouchEvent.TOUCH_END, onTouchEnd);
			}
		}
		/*
		public function PB_changeTool_after(): void
		{
			var param: Object = PostBox.get("PB_changeTool_after");
			if(param.tool == "scrollTool" && Global.get("baseScale") > 1.0)
			{
				_setMoveMax();
				_startScroll();
				_scrollStartFlag = true;
			}
			else
			{
				_stopScroll();
				_scrollStartFlag = false;
			}
		}
		public function GLOBAL_baseScale(): void
		{
			if(!_scrollStartFlag) return;
			_setMoveMax();
			if(Global.get("baseScale") > 1.0)
			{
				_startScroll();
			}
			else if(Global.get("baseScale") <= 1.0)
			{
				_stopScroll();
			}
		}
		private function _setMoveMax(): void
		{
			_maxLeftX = 0;
			_maxRightX = Config.BOARD_WIDTH - Config.BOARD_WIDTH * Global.get("baseScale");
			_maxTopY = 0;
			_maxBottomY = Config.BOARD_HEIGHT - Config.BOARD_HEIGHT * Global.get("baseScale");
			_scrollArea = new Rectangle(_maxLeftX, _maxTopY, _maxRightX, _maxBottomY);
		}
		private function _startScroll(): void
		{
			if(activeDrawPanel != null)
			{
				activeDrawPanel.activeDrawPanel.bodyMC.mouseEnabled = true;
				activeDrawPanel.activeDrawPanel.bodyMC.mouseChildren = false;
				activeDrawPanel.activeDrawPanel.bodyMC.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownEvent);
				Global.mainTimeline.stage.addEventListener(MouseEvent.MOUSE_UP, _mouseUpEvent);
			}
		}
		private function _stopScroll(): void
		{
			if(activeDrawPanel != null)
			{
				activeDrawPanel.activeDrawPanel.bodyMC.mouseChildren = true;
				activeDrawPanel.activeDrawPanel.bodyMC.removeEventListener(MouseEvent.MOUSE_DOWN, _mouseDownEvent);
				Global.mainTimeline.stage.removeEventListener(MouseEvent.MOUSE_UP, _mouseUpEvent);
			}
		}
		private function _mouseDownEvent(e: MouseEvent):void
		{
			activeDrawPanel.activeDrawPanel.bodyMC.startDrag(false, _scrollArea);
		}
		private function _mouseUpEvent(e:MouseEvent):void
		{
			activeDrawPanel.activeDrawPanel.bodyMC.stopDrag();
		}
		*/
	}
}
