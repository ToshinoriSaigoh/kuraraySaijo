package model.plugin.draw.edittool
{
/**
 * 変形用オペレーションクラス.
 *
 * update 2018/03/08 最前面に移動する機能を追加
 * Since 2018/03/08
 * @private
 */
	import controller.App;
	import model.plugin.draw.*;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import common.*;

	public class Operation
	{
		public var editFlag: Boolean;
		private var _operation: String;
		private var _tmpBufferData: Object;

		private var _startProperties: Object;
		private var _offset: Object;//move用オフセット値
		private var _startPoint: Point;//編集開始時editBox上のマウス座標
		private var _beforePoint: Point;//直前のeditBox上のマウス座標//timerHandlerで更新
		private var _nowPoint: Point;//現在のeditBox上のマウス座標
		private var _basePoint: Point;//編集開始時のeditBoxの中心点
		private var _originPoint: Point;//編集開始時のlayer上のeditBox座標

		private var _skipDegree: uint;
		private var _sizeRangeMin: Number;
		private var _sizeRangeMax: Number;
		private var _editBox: EditBox;

		public static const MOVE: String     = "move";
		public static const ROTATION: String = "rotation";
		public static const SCALE_X: String  = "scaleX";
		public static const SCALE_Y: String  = "scaleY";
		public static const SCALE_XY: String = "scaleXY";
		public static const LOCK: String = "lock";
		public static const FRONT: String = "front";

		public function Operation(editBox: EditBox): void
		{
			_sizeRangeMin = 50.0;
			_sizeRangeMax = 800.0;
			_operation = "";
			_skipDegree = 5;
			_offset = {};
			_editBox = editBox;
			_basePoint = new Point(0, 0);
			_originPoint = new Point(0, 0);
		}

		//mouseDown -> EditToll._startEdit()
		//編集開始時状態をセットする
		public function setStatus(op: String, bufferData: Object, mouseX: Number, mouseY: Number): void
		{
			_operation = op;
			_tmpBufferData = bufferData;
			_startProperties = _editBox.getProperties();
			var point: Point = new Point(mouseX, mouseY);

			//mouseの座標
			_startPoint = _editBox.targetLayer.body.globalToLocal(point);
			_beforePoint = _editBox.targetLayer.body.globalToLocal(point);
			_nowPoint = _editBox.targetLayer.body.globalToLocal(point);

			//ボックス中心点のレイヤー上座標
			point.x = _editBox.centerPointX;
			point.y = _editBox.centerPointY;
			point = _editBox.box.localToGlobal(point);
			_basePoint = _editBox.targetLayer.body.globalToLocal(point);

			//ボックス左上基準点のレイヤー上座標//原点座標計算
			point.x = 0;
			point.y = 0;
			point = _editBox.box.localToGlobal(point);
			_originPoint = _editBox.targetLayer.body.globalToLocal(point);
		}

		public function reset(): void
		{
			_operation = "";
		}

		//ストローク中、毎フレームのバッファー処理
		private function _createOneFrameBuffer(properties: Object): void
		{
			var strokeData: Object = _editBox.getProperties();
			var i: String;
			for(i in properties)
			{
				switch(i)
				{
					case "scaleX":
						strokeData["width"] = _startProperties["baseWidth"] * properties[i];
						//strokeData[i] = strokeData["width"] / _editBox.defaultWidth;
						break;
					case "scaleY":
						strokeData["height"] = _startProperties["baseHeight"] * properties[i];
						//strokeData[i] = strokeData["height"] / _editBox.defaultHeight;
						break;
					default:
						strokeData[i] = properties[i];
				}
			}
			_tmpBufferData.val.stroke = [strokeData];
			Draw.drawBuffer["simpleBuffer"][_editBox.targetPanel.caller.vcName][_editBox.targetPanel.vcName].push(_tmpBufferData);


			//送信
			var sendParam: Object = {
				toolName: "editTool",
				action: "edit",
				report: Draw.activeReport.vcName,
				page: Draw.activeDrawPanel.vcName,
				layer: Draw.activeDrawPanel.activeLayer.body.name,
				div: Draw.activeDrawPanel.targetEditBox,
				bufferData: _tmpBufferData
			};
			PostBox.send("sendShareDraw", sendParam);
		}

		//EditTool.timerHandler
		//モードによって動作を変えて実行する
		public function execute(mouseX: Number, mouseY: Number): void
		{
			_setOffset(mouseX, mouseY);
			switch(_operation)
			{
				case FRONT:
					_moveFront();
					break;
				case MOVE:
					_move();
					break;
				case ROTATION:
					_rotation();
					break;
				case SCALE_X:
					_scaleX();
					break;
				case SCALE_Y:
					_scaleY();
					break;
				case SCALE_XY:
					_scaleXY();
					break;
			}
			//ポインターの移動距離
			function _setOffset(mouseX: Number, mouseY: Number): void
			{
				_beforePoint.x = _nowPoint.x;
				_beforePoint.y = _nowPoint.y;
				_nowPoint.x = mouseX;
				_nowPoint.y = mouseY;
				_nowPoint = _editBox.targetLayer.body.globalToLocal(_nowPoint);
				_offset.x = _beforePoint.x - _nowPoint.x;
				_offset.y = _beforePoint.y - _nowPoint.y;
			}
		}

		//最前面に移動
		private function _moveFront(): void
		{
			_createOneFrameBuffer({
				front: true
			});
			PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: Draw.activeDrawPanel.caller.vcName, page: Draw.activeDrawPanel.vcName});
		}

		//移動
		private function _move(): void
		{
			if(_offset.x >= 1 || _offset.y >= 1 || _offset.x <= -1 || _offset.y <= -1)
			{
				editFlag = true;
				var targetX: Number = _nowPoint.x - _startPoint.x;
				var targetY: Number = _nowPoint.y - _startPoint.y;
				_createOneFrameBuffer({
					x: _startProperties.x + targetX,
					y: _startProperties.y + targetY
				});
			}
		}

		//回転
		private function _rotation(): void
		{
			var degree: Number;
			var radian: Number;
			var cosTheta: Number;
			var sinTheta: Number;
			var x: Number;
			var y: Number;
			var tmpX: Number;
			var tmpY: Number;
			var rect: Rectangle;

			degree = Math.floor(Math.atan2(_nowPoint.y - _basePoint.y, _nowPoint.x - _basePoint.x) * 180 / Math.PI) + 90
			while(degree < 0)
			{
				degree += 360;
			}
			while(degree > 360)
			{
				degree -= 360;
			}
			var tmp: Number;
			tmp = degree;
			if(_skipDegree > 0)
			{
				if((_skipDegree / 2) > (degree - (uint(degree / _skipDegree) * _skipDegree)))
				{
					degree = uint(degree / _skipDegree) * _skipDegree;
				}
				else
				{
					degree = (1 + uint(degree / _skipDegree)) * _skipDegree;
				}
			}

			rect = _editBox.box.getRect(_editBox.box);
			tmpX = - (rect.width / 2) * _editBox.scaleX;
			tmpY = - (rect.height / 2) * _editBox.scaleY;
			radian =  degree * (Math.PI / 180.0);
			cosTheta = Math.cos(radian);
			sinTheta = Math.sin(radian);
			x = (tmpX * cosTheta - tmpY * sinTheta) + _basePoint.x;
			y = (tmpX * sinTheta + tmpY * cosTheta) + _basePoint.y;
			_createOneFrameBuffer({
				rotation: degree,
				x: x,
				y: y
			});
		}

		//サイズ変更の計算をする
		//directionでx軸、Y軸を指定する
		private function _calcScale(direction: String): Number
		{
			var minScale: Number = direction == "x" ? _sizeRangeMin / _startProperties.width :_sizeRangeMin / _startProperties.width;
			var maxScale: Number = direction == "x" ? _sizeRangeMax / _startProperties.width :_sizeRangeMax / _startProperties.height;

			var scale: Number;
			var beforeLine: Number;//基準線
			var afterLine: Number;//移動後の線
			var radian: Number = _editBox.rotation * (Math.PI / 180.0);
			switch(direction)
			{
				case "xy":
					beforeLine = Math.sqrt(Math.pow(_startPoint.x - _startProperties.x, 2) + Math.pow(_startPoint.y - _startProperties.y, 2));//図形エリアの対角線
					afterLine = Math.sqrt(Math.pow(_nowPoint.x - _startProperties.x, 2) + Math.pow(_nowPoint.y - _startProperties.y, 2));//図形基準点からマウス座標値までの距離
					break;
				case "x":
					beforeLine = _startProperties.width;//図形エリアの横幅
					afterLine = beforeLine + ((_nowPoint.x - _startPoint.x) / Math.cos(radian));//図形エリアの横幅 + 角度に応じたマウスの移動距離
					break;
				case "y":
					beforeLine = _startProperties.height;//図形エリアの高さ
					afterLine = beforeLine + ((_nowPoint.y - _startPoint.y) / Math.cos(radian));//図形エリアの高さ + 角度に応じたマウスの移動距離
					break;
			}

			scale = afterLine / beforeLine;//拡縮率
			if(scale <= minScale)
			{
				scale = minScale;
			}
			else if(scale >= maxScale)
			{
				scale = maxScale;
			}
			return scale;

		}

		//サイズ変更XY
		private function _scaleXY(): void
		{
			var scale: Number = _calcScale("xy");
			_createOneFrameBuffer({
				scaleX: scale,
				scaleY: scale
			});
		}

		//サイズ変更X
		private function _scaleX(): void
		{
			var scale: Number = _calcScale("x");
			_createOneFrameBuffer({
				scaleX: scale
			});
		}

		//サイズ変更Y
		private function _scaleY(): void
		{
			var scale: Number = _calcScale("y");
			_createOneFrameBuffer({
				scaleY: scale
			});
		}

	}
}
