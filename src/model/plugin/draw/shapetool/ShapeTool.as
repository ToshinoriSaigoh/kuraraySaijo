package model.plugin.draw.shapetool
{
	import common.*;
	import model.plugin.*;
	import model.plugin.draw.*;
	import model.app.network.ReportUtils;//m2ok

	import flash.display.Shape;
	import flash.geom.*;
	public class ShapeTool extends Draw
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
		private var _lineColor: Number;
		private var _fillColor: Number;
		private var _thick: Number;
		private var _alpha: Number;

		public function ShapeTool()
		{
			toolName = "shapeTool";
			super();
			init();
		}

		private function init(): void
		{
			toolOption = {};
			//手書き初期値
			toolOption.shapeType = "rect";
			toolOption.line = true;
			toolOption.fill = true;
			alpha = 1.0;
		}

		//描画共有データ受信
		public function PB_receiveShareDraw(): void
		{
			var param: Object = PostBox.get("PB_receiveShareDraw");
			if(param.toolName != toolName) return;
			Draw.createDrawBuffer(param.report, param.panel);
			Draw.drawBuffer["simpleBuffer"][param.report][param.panel].push(param.bufferData);
			if(ReportUtils.getPagePanel(param.report, param.panel) != null)//m2ok
			{
				PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: param.report, page: param.panel});
			}
		}

		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");

			if(param.tool == "shapeTool")
			{
				startShapeTool();
			}

			if(param.tool != "shapeTool") return;

			if(param.hasOwnProperty("mode"))
			{
				decenter = param.mode == "decenter" ? true : false;
			}
			if(param.hasOwnProperty("type"))
			{
				toolOption.shapeType = param.type;
			}
			if(param.hasOwnProperty("line"))
			{
				toolOption.line = param.line;
			}
			if(param.hasOwnProperty("fill"))
			{
				toolOption.fill = param.fill;
			}
		}
		//透明度変更
		public function PB_changeAlpha(): void
		{
			var param: Object = PostBox.get("PB_changeAlpha");
			var alphaList: Array = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];
			var nowAlpha: uint = alphaList.indexOf(alpha);
			if(param.operation == "increase" && alpha < 1)
			{
				alpha = nowAlpha < alphaList.length ? alphaList[nowAlpha + 1] : alphaList[nowAlpha];
			}
			else if(param.operation == "decrease" && alpha > 0)
			{
				alpha = nowAlpha > 0 ? alphaList[nowAlpha - 1] : alphaList[nowAlpha];
			}
		}

		protected function startShapeTool(): void
		{
			ControlPanel.controlPanel.visible = true;
			ControlPanel.eventFunction.down = down;
			ControlPanel.eventFunction.move = move;
			ControlPanel.eventFunction.up = up;
		}
		protected function stopShapeTool(): void
		{
			ControlPanel.clearEventFunction();
		}

		private function _setOption(): void
		{
			if(alpha == 0)
			{
				_lineColor = 0x000000;
				_fillColor = 0x000000;
				_alpha = 0.2;
			}
			else
			{
				_lineColor = lineColor;
				_fillColor = fillColor;
				_alpha = alpha;
			}
			_thick = thick;
		}

		override protected function down(pointX: Number, pointY: Number): void
		{
			if(Global.get("isMouseDown")) return;
			targetLayer = Draw.activeDrawPanel.activeLayer;

			_startX = pointX;
			_startY = pointY;
			_tmpShape = new Shape();
			targetLayer.body.addChild(_tmpShape);

			_setOption();
			if(toolOption.line) _tmpShape.graphics.lineStyle(_thick, _lineColor, 1.0, false, "normal", "none", "miter");

			switch(toolOption.shapeType)
			{
				case "circle":
				case "rect":
				break;
				default:
			}

			_id = Draw.activeDrawPanel.report.getDrawID();
			_tmpShape.name = _id;
			toolOption.penType = alpha == 0 ? "eraser" : "pen";
			tmpBufferData = createBufferData(toolName, "new", _id, {shapeType: toolOption.shapeType, penType: toolOption.penType, fill: toolOption.fill, line: toolOption.line});

			tmpBufferData.val.stroke.push({
				id: _id,
				f: String(Draw.activeReport.getNowTime()),
				lineColor: lineColor,
				fillColor: fillColor,
				thick: thick,
				alpha: alpha
			});

			Global.set("isMouseDown", true);
		}


		override protected function move(pointX: Number, pointY: Number): void
		{
			if(!Global.get("isMouseDown")) return;
			_thisX = pointX;
			_thisY = pointY;

			var w: Number = _thisX - _startX;
			var h: Number = _thisY - _startY;

			var adjust: Number = _thick > 0 ? _thick / 2 : 0;
			if(decenter)
			{
				_shapeX = _startX - w + (_thick / 2);
				_shapeY = _startY - h + (_thick / 2);
				_shapeW =  w * 2 + adjust;
				_shapeH = h * 2 + adjust;
			}
			else
			{
				_shapeX = w < 0 ? _thisX : _startX;
				_shapeY = h < 0 ? _thisY : _startY;
				_shapeW = w + adjust;
				if(w < 0) _shapeW *= -1;
				_shapeH = h + adjust;
				if(h < 0) _shapeH *= -1;
			}
			_tmpShape.graphics.clear();
			if(toolOption.line) _tmpShape.graphics.lineStyle(_thick, _lineColor, 1.0, false, "normal", "none", "miter");
			if(toolOption.fill) _tmpShape.graphics.beginFill(fillColor, _alpha);
			switch(toolOption.shapeType)
			{
				case "circle":
					_tmpShape.graphics.drawEllipse(_shapeX, _shapeY, _shapeW, _shapeH);
					break;
				case "rect":
					_tmpShape.graphics.drawRect(_shapeX, _shapeY, _shapeW, _shapeH);
					break;
			}

			tmpBufferData.val.stroke.push({id: _id, f: String(Draw.activeReport.getNowTime()), t: toolOption.shapeType, x: _shapeX, y: _shapeY, w: _shapeW, h: _shapeH});
		}

		override protected function up(pointX: Number, pointY:Number): void
		{
			if(!Global.get("isMouseDown")) return;
			Global.set("isMouseDown", false);
			if(_shapeX > 0)
			{
				var nowTime: String = String(Draw.activeReport.getNowTime());
				tmpBufferData.val.stroke.push({id: _id, f: nowTime, t: toolOption.shapeType, x: _shapeX, y: _shapeY, w: _shapeW, h: _shapeH});
				tmpBufferData.lastTime = nowTime;
			}
			Draw.drawBuffer["simpleBuffer"][Draw.activeDrawPanel.caller.vcName][Draw.activeDrawPanel.vcName].push(tmpBufferData);
			PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: Draw.activeDrawPanel.caller.vcName, page: Draw.activeDrawPanel.vcName});
			targetLayer.body.removeChild(_tmpShape);

			//送信
			var sendParam: Object = {
				toolName: toolName,
				action: "new",
				report: Draw.activeReport.vcName,
				panel: Draw.activeDrawPanel.vcName,
				layer: Draw.activeDrawPanel.activeLayer.body.name,
				bufferData: tmpBufferData
			};
			PostBox.send("sendShareDraw", sendParam);
		}
	}
}
