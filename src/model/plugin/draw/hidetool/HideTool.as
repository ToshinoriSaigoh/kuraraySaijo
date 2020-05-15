package model.plugin.draw.hidetool
{
	import controller.documentroot.reportscreen.DrawContents;
	import common.ObjectUtils;
	import controller.App;
	import model.plugin.draw.*;
	import model.plugin.draw.handdraw.HandDrawStroke;
	import model.app.network.ReportUtils;//m2ok
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.events.TouchEvent;
	import flash.events.MouseEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;

	public class HideTool extends Draw
	{
		private var _target: Object;//drawContents
		private var _hideList: Array;

		private var _targetName: String;
		private var _id: String;

		private var _tmpShape: Shape;
		private var _startX: Number;//描画スタートX
		private var _startY: Number;//描画スタートY
		private var _thisX: Number;//描画X
		private var _thisY: Number;//描画Y
		private var _color: uint;
		private var _tmpColor: Number;
		private var _alpha: Number;
		private var _tmpAlpha: Number;
		private var _isLaser: Boolean;
		private var _thick: Number;


		public function HideTool()
		{
			toolName = "hideTool";
			_hideList = [];
			super();
		}

		//描画共有データ受信//m2ok
		public function PB_receiveShareDraw(): void
		{
			var param: Object = PostBox.get("PB_receiveShareDraw");
			if(param.toolName != toolName) return;
			Draw.drawBuffer["simpleBuffer"][param.report][param.page].push(param.bufferData);
			PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: param.report, page: param.page});
		}

		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			if(param.tool == "hideTool")
			{
				startHideTool();
			}
			else
			{
				stopHideTool();
			}
		}

		protected function startHideTool(): void
		{
			ControlPanel.controlPanel.visible = false;
			_target = DrawContents.drawContentsBody;
			if(Multitouch.supportsTouchEvents)
			{
				Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
				App.mainStage.addEventListener(TouchEvent.TOUCH_BEGIN, _down);
				App.mainStage.addEventListener(MouseEvent.MOUSE_DOWN, _down);
			}
			else
			{
				App.mainStage.addEventListener(MouseEvent.MOUSE_DOWN, _down);
			}

		}
		protected function stopHideTool(): void
		{
			if(_target != null)
			{
				App.mainStage.removeEventListener(TouchEvent.TOUCH_BEGIN, _down);
				App.mainStage.removeEventListener(MouseEvent.MOUSE_DOWN, _down);
			}
		}

		private function _down(e: *): void
		{
			_target.addEventListener(TouchEvent.TOUCH_MOVE, _moveHandler);
			_target.addEventListener(MouseEvent.MOUSE_MOVE, _moveHandler);
			App.mainStage.addEventListener(TouchEvent.TOUCH_END, _up);
			App.mainStage.addEventListener(MouseEvent.MOUSE_UP, _up);
		}
		private function _up(e: *): void
		{
			actionHide();
			_target.removeEventListener(TouchEvent.TOUCH_MOVE, _moveHandler);
			_target.removeEventListener(MouseEvent.MOUSE_MOVE, _moveHandler);
			App.mainStage.removeEventListener(TouchEvent.TOUCH_END, _up);
			App.mainStage.removeEventListener(MouseEvent.MOUSE_UP, _up);

			function actionHide(): void
			{
				var i: int;
				for(i = 0; i < _hideList.length; i++)
				{
					Draw.drawList[activeDrawPanel.report.vcName][_hideList[i]].alpha = 1.0;
				}
				_hide();
			}
		}
		private function _moveHandler(evt: *): void
		{
			if(evt.target as HandDrawStroke != null)
			{
				if(evt.target.alpha == 0) return;
				var _index: int = _hideList.indexOf(evt.target.name);
				if(_index == -1)
				{
					evt.target.alpha = 0.4;
					_hideList.push(evt.target.name);
				}
			}
		}

		private function _hide(): void
		{
			if(_hideList.length == 0) return;
			var nowTime: String = String(Draw.activeReport.getNowTime());
			tmpBufferData = createBufferData(toolName, "del", _hideList[i], {});
			tmpBufferData.val.author = activeDrawPanel.report.vcName;
			tmpBufferData.val.lastTime = nowTime;
			var i: int;
			for(i = 0; i < _hideList.length; i++)
			{
				var piece: Object = {
					id: _hideList[i],
					f: nowTime,
					visible: false
				}
				tmpBufferData.val.stroke.push(piece);
			}
			_addUndoList(_hideList);

			Draw.drawBuffer["simpleBuffer"][activeDrawPanel.report.vcName][activeDrawPanel.vcName].push(tmpBufferData);
			PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: Draw.activeDrawPanel.report.vcName, page: Draw.activeDrawPanel.vcName});


			//送信
			var sendParam: Object = {
				toolName: toolName,
				action: "hide",
				report: Draw.activeReport.vcName,
				page: Draw.activeDrawPanel.vcName,
				bufferData: ObjectUtils.clone(tmpBufferData)
			};
			PostBox.send("sendShareDraw", sendParam);
			_hideList = [];
		}
		private function _addUndoList(hideList: Array): void
		{
			Draw.activeReport.redoList = [];
			Draw.activeReport.undoList.unshift(hideList);
			Draw.activeReport.undoList = Draw.activeReport.undoList.slice(0, Draw.undoCnt);
		}
	}
}
