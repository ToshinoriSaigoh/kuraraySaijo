package model.plugin.draw.handdraw
{
/**
* 手書き実行クラス.
*
* update 2018/03/14
* editBoxに手書きする場合、moveで枠を再描画するように変更targetEditBox.border.locked(true);
* @private
*/
	import common.ObjectUtils;
	import model.plugin.draw.*;
	import model.app.network.ReportUtils;//m2ok
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.CapsStyle;
	import flash.events.TouchEvent;
	import flash.events.MouseEvent;
	import flash.geom.*;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;

	public class HandDraw extends Draw
	{
		private var _tmpShape: Shape;
		private var _startX: Number;//描画スタートX
		private var _startY: Number;//描画スタートY
		private var _thisX: Number;//描画X
		private var _thisY: Number;//描画Y
		private var _id: String;
		private var _color: uint;
		private var _tmpColor: Number;
		private var _alpha: Number;
		private var _tmpAlpha: Number;
		private var _thick: Number;
		private var _capsStyle: String;
		private var _targetPageName: String;
		private var _isLaser: Boolean;

		private var _hands: Object;
		private var _targetSprite: Sprite;
		private var _targetPoint: Object;

		public function HandDraw()
		{
			toolName = "handDraw";
			super();
			init();
		}

		private function init(): void
		{
			toolOption = {};
			//手書き初期値
			toolOption.lineType = "curveLine";
			toolOption.toolType = "pen";
			toolOption.alpha = 1.0;

			Draw.lineColor = Number(Config.get("config", "tools", "colorLine"));
			Draw.fillColor = Number(Config.get("config", "tools", "colorFill"));

			thick = Number(Config.get("config", "tools", "penWeight"));
			_isLaser = false;
			_hands = {};
			_targetPoint = {};
		}

		//描画共有データ受信//m2ok
		public function PB_receiveShareDraw(): void
		{
			var param: Object = PostBox.get("PB_receiveShareDraw");
			var hd: HandDrawForNetwork;
			if(param.toolName != toolName) return;
			switch(param.action)
			{
				case "down":
					hd = new HandDrawForNetwork(param);
					_hands[param.id] = hd;
					hd.down(param.pointX, param.pointY);
					break;
				case "move":
					if(_hands.hasOwnProperty(param.id))
					{
						hd = _hands[param.id];
						hd.move(param.pointX, param.pointY);
					}
					break;
				case "up":
					if(_hands.hasOwnProperty(param.id))
					{
						hd = _hands[param.id];
						hd.up(param.pointX, param.pointY);
					}
					//バッファに格納＆フラッシュ
					Draw.createDrawBuffer(param.report, param.page);
					drawBuffer["simpleBuffer"][param.report][param.page].push(param.bufferData);
					if(ReportUtils.getPagePanel(param.report, param.page) != null)
					{
						PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: param.report, page: param.page});
					}
					if(_hands.hasOwnProperty(param.id)) delete _hands[param.id];
					break;
				case "undo":
					//バッファに格納＆フラッシュ
					Draw.createDrawBuffer(param.report, param.page);
					drawBuffer["simpleBuffer"][param.report][param.page].push(param.bufferData);
					if(ReportUtils.getPagePanel(param.report, param.page) != null)
					{
						PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: param.report, page: param.page});
					}
					break;
			}
		}

		public function PB_actionTool(): void
		{
			var param: Object = PostBox.get("PB_actionTool");
			if(param.tool == "penTool")
			{
				if(param.hasOwnProperty("type"))
				{
					switch(param.type)
					{
						case "undo":
							undo();
							break;
					}
				}
			}
		}

		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			if(param.tool == "penTool")
			{
				startHandDraw();
			}
			else if(param.tool != "shapeTool" && param.tool != "scrollTool")
			{
				stopHandDraw();
			}

			if(param.tool == "penTool" && param.hasOwnProperty("type"))
			{
				switch(param.type)
				{
					case "laser":
						_isLaser = true;
						toolOption.alpha = 1.0;
						toolOption.penType = param.type;
						break;
					case "pen":
					case "eraser":
						_isLaser = false;
						toolOption.alpha = 1.0;
						toolOption.penType = param.type;
						break;
					case "marker":
						_isLaser = false;
						toolOption.alpha = 0.45;
						toolOption.penType = param.type;
						break;
				}
			}
			if(param.hasOwnProperty("line"))
			{
				switch(param.line)
				{
					case "curveLine":
					case "straightLine":
						toolOption.lineType = param.line;
						break;
				}
			}
		}

		public function PB_changeThick(): void
		{
			var param: Object = PostBox.get("PB_changeThick");
			if(param.operation == "increase" && thick < 100)
			{
				thick++;
			}
			else if(param.operation == "decrease" && thick > 0)
			{
				thick--;
			}
		}
		protected function startHandDraw(): void
		{
			ControlPanel.controlPanel.visible = true;
			ControlPanel.eventFunction.down = down;
			ControlPanel.eventFunction.move = move;
			ControlPanel.eventFunction.up = up;
		}
		protected function stopHandDraw(): void
		{
			ControlPanel.clearEventFunction();
		}

		private function _setOption(): void
		{
			switch(toolOption.penType)
			{
				case "eraser":
					_color = 0x000000;
					_tmpColor = 0x000000;
					_tmpAlpha = 0.2;
					_alpha = toolOption.alpha;
					_thick = thick * 4;
					_capsStyle = CapsStyle.ROUND;
					break;
				case "marker":
					_color = Draw.lineColor;
					_tmpColor = Draw.lineColor;
					_tmpAlpha = toolOption.alpha;
					_alpha = toolOption.alpha;
					_thick = thick;
					_capsStyle = CapsStyle.ROUND;
					break;
				default:
					_color = Draw.lineColor;
					_tmpColor = Draw.lineColor;
					_tmpAlpha = toolOption.alpha;
					_alpha = toolOption.alpha;
					_thick = thick;
					_capsStyle = CapsStyle.ROUND;
					break;
			}
		}

		private var _thickFitting: Number;
		// 手書き書き始めイベント
		override protected function down(pointX: Number, pointY: Number): void
		{
			if(Global.get("isMouseDown")) return;
			if(!Draw.activeDrawPanel.activeLayer.visible) return;
			_setOption();
			_targetPageName = Draw.activeDrawPanel.vcName;
			targetLayer = Draw.activeDrawPanel.activeLayer;
			targetDiv = Draw.activeDrawPanel.targetEditBox;
			_startX = pointX;
			_startY = pointY;
			_tmpShape = new Shape();
			_thickFitting = _thick;

			if(targetDiv != null)
			{
				_targetSprite = targetDiv.box;
				_thickFitting = _thick / ((targetDiv.scaleX + targetDiv.scaleY) / 2);
				_thickFitting = _thickFitting < 1 ? 1 : _thickFitting;
			}
			else
			{
				_targetSprite = targetLayer.body;
			}

			_targetSprite.addChild(_tmpShape);
			_tmpShape.graphics.lineStyle(_thickFitting, _tmpColor, _tmpAlpha, false, "normal", _capsStyle);
			_tmpShape.graphics.moveTo(_startX, _startY);

			_id = Draw.activeDrawPanel.report.getDrawID();
			_tmpShape.name = _id;
			tmpBufferData = createBufferData(toolName, "new", _id, {lineType: toolOption.lineType, penType: toolOption.penType});
			tmpBufferData.val.stroke.push({
				id: _id,
				f: String(Draw.activeReport.getNowTime()),
				x: _startX,
				y: _startY,
				color: _color,
				thick: _thickFitting,
				alpha: _alpha,
				laser: _isLaser
			});
			Global.set("isMouseDown", true);

			//送信
			var sendParam: Object = {
				toolName: toolName,
				action: "down",
				report: Draw.activeReport.vcName,
				page: Draw.activeDrawPanel.vcName,
				layer: Draw.activeDrawPanel.activeLayer.body.name,
				div: Draw.activeDrawPanel.targetEditBox != null ? Draw.activeDrawPanel.targetEditBox.id : null,
				id: _id,
				pointX: _startX,
				pointY: _startY,
				toolOption: ObjectUtils.clone(toolOption),
				thick: _thickFitting,
				color: _color
			};
			PostBox.send("sendShareDraw", sendParam);
			return;
		}

		// 手書き移動中イベント
		override protected function move(pointX: Number, pointY: Number): void
		{
			if(!Global.get("isMouseDown")) return;
			if(!Draw.activeDrawPanel.activeLayer.visible) return;
			_thisX = pointX;
			_thisY = pointY;
			switch(toolOption.lineType)
			{
				case "curveLine":
					_tmpShape.graphics.lineTo(_thisX, _thisY);
					break;
				case "straightLine":
					_tmpShape.graphics.clear();
					_tmpShape.graphics.lineStyle(_thickFitting, _tmpColor, _tmpAlpha, false, "normal");
					_tmpShape.graphics.moveTo(_startX, _startY);
					_tmpShape.graphics.lineTo(_thisX, _thisY);
					break;
			}
			tmpBufferData.val.stroke.push({id: _id, f: String(Draw.activeReport.getNowTime()), x: _thisX, y: _thisY, laser: _isLaser});

			//送信
			var sendParam: Object = {
				toolName: toolName,
				action: "move",
				id: _id,
				pointX: _thisX,
				pointY: _thisY
			};
			PostBox.send("sendShareDraw", sendParam);

			if(Draw.activeDrawPanel.targetEditBox != null)
			{
				Draw.activeDrawPanel.targetEditBox.border.locked(true);
			}
			return;
		}
		// 手描き書き終わりイベント
		override protected function up(pointX:Number, pointY:Number): void
		{
			if(!Global.get("isMouseDown")) return;
			if(!Draw.activeDrawPanel.activeLayer.visible) return;
			Global.set("isMouseDown", false);

			_thisX = pointX;
			_thisY = pointY;
			var nowTime: String = String(Draw.activeReport.getNowTime());//String(Draw.activeDrawPanel.report.nowTime);
			/*
			switch(toolOption.penType)
			{
				case "laser":
					tmpBufferData.val.stroke.push({id: _id, f: nowTime, laser: _isLaser});
					break;
				default:
					tmpBufferData.val.stroke.push({id: _id, f: nowTime, x: _thisX, y: _thisY, laser: _isLaser});
			}
			*/
			tmpBufferData.val.stroke.push({id: _id, f: nowTime, x: _thisX, y: _thisY, laser: _isLaser});


			tmpBufferData.val.lastTime = nowTime;

			if(activeDrawPanel.report.pageList.hasOwnProperty(_targetPageName))
			{
				drawBuffer["simpleBuffer"][Draw.activeDrawPanel.caller.vcName][_targetPageName].push(tmpBufferData);
			}
			if(targetDiv != null)
			{
				targetDiv.box.removeChild(_tmpShape);
			}
			else
			{
				targetLayer.body.removeChild(_tmpShape);
			}

			PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: Draw.activeDrawPanel.caller.vcName, page: Draw.activeDrawPanel.vcName});
			switch(toolOption.penType)
			{
				case "laser":
					break;
				default:
					_addUndoList(_id);
			}

			//送信
			var sendParam: Object = {
				toolName: toolName,
				action: "up",
				report: Draw.activeReport.vcName,
				page: _targetPageName,
				layer: Draw.activeDrawPanel.activeLayer.body.name,
				div: Draw.activeDrawPanel.targetEditBox != null?Draw.activeDrawPanel.targetEditBox.id:null,
				id: _id,
				pointX: _thisX,
				pointY: _thisY,
				bufferData: ObjectUtils.clone(tmpBufferData)
			};
			PostBox.send("sendShareDraw", sendParam);
		}

		public function undo(): void
		{
			var undo: Array = Draw.activeReport.undoList.shift();
			if(undo == null || undo.length == 0) return;
			Draw.activeReport.redoList.unshift(undo);
			var nowTime: String = String(Draw.activeReport.getNowTime());
			tmpBufferData = createBufferData(toolName, "update", undo[0], {});
			tmpBufferData.val.author = activeDrawPanel.report.vcName;
			tmpBufferData.val.lastTime = nowTime;

			var __id: String;
			var visibility: Boolean;
			var i: uint;
			for(i = 0; i < undo.length; i++)
			{
				__id = undo[i];
				visibility = Draw.drawList[Draw.activeReport.vcName][__id].visible ? false : true;
				var piece: Object = {
					id: __id,
					f: nowTime,
					visible: visibility
				}
				tmpBufferData.val.stroke.push(piece);
			}


			Draw.drawBuffer["simpleBuffer"][activeDrawPanel.report.vcName][activeDrawPanel.vcName].push(tmpBufferData);
			PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: Draw.activeDrawPanel.report.vcName, page: Draw.activeDrawPanel.vcName});

			//送信
			var sendParam: Object = {
				toolName: toolName,
				action: "undo",
				report: Draw.activeReport.vcName,
				page: Draw.activeDrawPanel.vcName,
				layer: Draw.activeDrawPanel.activeLayer.body.name,
				id: __id,
				bufferData: ObjectUtils.clone(tmpBufferData)
			};
			PostBox.send("sendShareDraw", sendParam);
		}

		private function _addUndoList(id: String): void
		{
			Draw.activeReport.undoList.unshift([id]);
			Draw.activeReport.redoList = [];
			Draw.activeReport.undoList = Draw.activeReport.undoList.slice(0, Draw.undoCnt);
		}
	}
}
