package model.plugin.draw.texttool
{
	import common.*;
	import controller.App;
	import model.plugin.*;
	import model.plugin.draw.*;
	import controller.documentroot.reportscreen.DrawContents;
	import model.app.network.ReportUtils;//m2ok

	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.geom.*;
	import flash.geom.Rectangle;

/*
１．テキストフィールド作成
	自動サイズ調整 or サイズ固定
２．入力完了でオブジェクト化
*/
	public class TextTool extends Draw
	{
		private var _tmpShape: Shape;
		private var _startX: Number;//描画スタートX
		private var _startY: Number;//描画スタートY
		private var _thisX: Number;//描画X
		private var _thisY: Number;//描画Y
		private var _shapeX: Number;
		private var _shapeY: Number;
		private var _shapeW: Number;
		private var _shapeH: Number;
		private var _id: String;
		private var _targetID: Object;
		private var _maxSize: uint;
		private var _minSize: uint;

		private var _currentPoint: Point;
		private var _tmpPoint: Point;

		//テキスト枠
		protected var _tmpBox: Sprite;//範囲プレビュー用
		protected var _rectTextBox: Rectangle;//テキストエリアサイズ
		protected var _tmpColor: int;
		protected var _tmpAlpha: Number;
		protected var _tmpThick: int;

		protected var _scale: Number;

		public function TextTool()
		{
			toolName = "textTool";
			super();
			_tmpPoint = new Point(0, 0);

			_tmpColor = 0x000000;
			_tmpAlpha = 0.2;
			_tmpThick = 1;

			_maxSize = 100;
			_minSize = 10;

			Draw.textSize = Number(Config.get("config", "tools", "textSize"));
		}


		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			if(param.tool == "textTool")
			{
				startTextTool();
			}
		}

		//テキストツール開始
		//テキストボックス作成用イベント登録
		private function startTextTool(): void
		{
			if(Draw.activeDrawPanel.activeLayer != null)
			{
				ControlPanel.controlPanel.visible = true;
				ControlPanel.eventFunction.down = down;
				ControlPanel.eventFunction.move = move;
				ControlPanel.eventFunction.up = up;
			}
		}
		private function stopTextTool(): void
		{
			App.mainStage.removeEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler);
		/*
			if(Draw.activeDrawPanel.activeLayer != null)
			{
				ControlPanel.clearEventFunction();
			}
		*/
		}
		override protected function down(pointX: Number, pointY: Number): void
		{
			//point下にTextBoxがあれば編集モードにする
			var globalPoint: Point = Draw.activeDrawPanel.body.localToGlobal(new Point(pointX, pointY));
			var _targetID: Object = null;
			var i: String;
			for(i in Draw.drawList[Draw.activeDrawPanel.report.vcName])
			{
				if(Draw.drawList[Draw.activeDrawPanel.report.vcName][i].hitTestPoint(globalPoint.x, globalPoint.y, true))
				{
					if(Draw.drawList[Draw.activeDrawPanel.report.vcName][i].visible)
					{
						_targetID = Draw.drawList[Draw.activeDrawPanel.report.vcName][i] as TextBox;
						break;
					}
				}
				_targetID = null;
			}

			if(_targetID != null)//編集モード
			{
				_targetID.changeMode("edit");
				ControlPanel.controlPanel.visible = false;
				App.mainStage.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler);
			}
			else//入力モード
			{
				Global.set("isMouseDown", true);
				_startX = pointX;
				_startY = pointY;
				_tmpBox = new Sprite();
				Draw.activeDrawPanel.activeLayer.body.addChild(_tmpBox);
				_rectTextBox = new Rectangle(_startX, _startY, 0, 0);
			}
		}

		private function _mouseDownHandler(evt: MouseEvent): void
		{
			if(evt.target as TextField != null)
			{
			}
			else if(evt.target as TextBox != null)
			{
				var localPoint: Point = Draw.activeDrawPanel.body.globalToLocal(new Point(evt.stageX, evt.stageY));
				evt.target.changeMode("edit");
			}
			else
			{
				App.mainStage.focus = null;
				App.mainStage.removeEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler);
				ControlPanel.controlPanel.visible = true;
			}
		}

		override protected function move(pointX: Number, pointY: Number): void
		{
			if(!Global.get("isMouseDown")) return;

			var w: Number = pointX - _startX;
			var h: Number = pointY - _startY;

			var adjust: Number = _tmpThick > 0 ? _tmpThick / 2 : 0;

			_rectTextBox.x =  w < 0 ? pointX : _startX;
			_rectTextBox.y =  h < 0 ? pointY : _startY;
			_rectTextBox.width = w + adjust;
			_rectTextBox.height = h + adjust;

			if(w < 0) _rectTextBox.width *= -1;
			if(h < 0) _rectTextBox.height *= -1;

			_tmpBox.graphics.clear();
			_tmpBox.graphics.lineStyle(1, _tmpColor, _tmpAlpha);
			_tmpBox.graphics.beginFill(_tmpColor, _tmpAlpha);

			_tmpBox.graphics.drawRect(_rectTextBox.x, _rectTextBox.y, _rectTextBox.width, _rectTextBox.height);
		}

		override protected function up(pointX: Number, pointY:Number): void
		{
			if(!Global.get("isMouseDown")) return;
			Draw.activeDrawPanel.activeLayer.body.removeChild(_tmpBox);
			Global.set("isMouseDown", false);

			var baseX: Number = _startX < pointX ? _startX : pointX;
			var baseY: Number = _startY < pointY ? _startY : pointY;
			var boxW: Number = _startX - pointX;
			if(boxW < 0) boxW *= -1;
			var boxH: Number = _startY - pointY;
			if(boxH < 0) boxH *= -1;

			createTextBox(baseX, baseY, boxW, boxH);//テキスト入力開始
		}

		private function createTextBox(boxX: Number, boxY: Number, boxW: Number = 0, boxH: Number = 0): void
		{
			_id = Draw.activeDrawPanel.report.getDrawID();
			var nowTime: String = String(Draw.activeReport.getNowTime());
			var auto: Boolean = (boxW < 3 || boxH < 3) ? true : false;
			tmpBufferData = createBufferData(toolName, "new", _id, {color: fillColor, size: Draw.textSize, autoSize: auto, width: boxW, height: boxH});

			tmpBufferData.val.stroke.push({
				id: _id,
				f: nowTime,
				x: boxX,
				y: boxY
			});
			tmpBufferData.lastTime = nowTime;

			Draw.drawBuffer["simpleBuffer"][Draw.activeDrawPanel.caller.vcName][Draw.activeDrawPanel.vcName].push(tmpBufferData);
			PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: Draw.activeDrawPanel.caller.vcName, page: Draw.activeDrawPanel.vcName});

			if(Draw.drawList[Draw.activeDrawPanel.report.vcName].hasOwnProperty(_id))
			{
				Draw.drawList[Draw.activeDrawPanel.report.vcName][_id].changeMode("edit");
			}
		}

		//透明度変更
		public function PB_changeTextSize(): void
		{
			var param: Object = PostBox.get("PB_changeTextSize");
			if(param.operation == "increase" && Draw.textSize < _maxSize)
			{
				Draw.textSize = Draw.textSize + 2;
			}
			else if(param.operation == "decrease" && Draw.textSize > _minSize)
			{
				Draw.textSize = Draw.textSize - 2;
			}
		}

	}
}
