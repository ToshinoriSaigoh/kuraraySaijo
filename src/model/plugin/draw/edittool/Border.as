package model.plugin.draw.edittool
{
	import common.*;
	import common.SVGUtils;
	import controller.App;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.ColorTransform;
	import flash.filters.DropShadowFilter;
	import flash.filters.BitmapFilterQuality;

	public class Border
	{
		private var _editBox: EditBox;
		private var _operationList: Array;

		private var _outline: Sprite;//枠描画用スプライト
		private var _pointContainer: Sprite;//制御ポイントコンテナ
		private var _pointList: Array;//制御ポイントMCリスト
		private var _hidePointNames: Object;//非表示ポイント名
		private var _pointXLine: Sprite;//削除ポイント内X印
		private var _pointLineSize: uint;//ポイント枠線幅
		private var _lineSize: uint;//ボーダー線幅
		private var _pointSize: uint;
		private var _pointHitSize: uint;
		private var _rotatePointDistance: uint;
		private var _colorTransForm: ColorTransform;
		private var _dropShadowFilter: DropShadowFilter;
		private var _dropShadowFilter2: DropShadowFilter;
		private var _boxColor: Object;
		private var _forceHidePoints: Boolean;

		[Embed(source = "icon_pentool.svg", mimeType="application/octet-stream")]
		private var _Svg: Class;

		public function Border(parent: EditBox, operationList: Array)
		{
			_editBox = parent;
			if(operationList != null)
			{
				_operationList = operationList.concat();
			}
			else
			{
				_operationList = [];
			}

			_pointLineSize          = 2;
			_lineSize               = 4;
			_pointSize              = 10;
			_pointHitSize           = 14;
			_rotatePointDistance    = 27;
			_colorTransForm = new ColorTransform();
			_boxColor = {
				normal: 0x333333,
				active: 0x0066ee,
				lock: 0x00cc00
			};
			_dropShadowFilter = new DropShadowFilter(
				0,
				0,
				0x000000,
				0.5,
				40,
				40,
				2.0,
				BitmapFilterQuality.MEDIUM,
				false,
				false,
				false
			);
			_dropShadowFilter2 = new DropShadowFilter(
				0,
				0,
				0xffffff,
				0.2,
				50,
				50,
				2.0,
				BitmapFilterQuality.MEDIUM,
				false,
				false,
				false
			);
			_boxColor = {
				normal: 0x333333,
				active: 0x0066ee,
				lock: 0x00bb00
			};
			_forceHidePoints = false;

			_outline = new Sprite();
			setChildBodyMode(_outline);
			_pointContainer = new Sprite();
			_pointContainer.mouseEnabled = false;
			setChildBodyMode(_pointContainer);

			_createXLine();

			_pointList = [];
			var i: uint;
			var point: Sprite;
			for(i = 0; i < _operationList.length; i++)
			{
				point = new Sprite();
				point.name = _operationList[i];
				_pointList.push(point);
				_pointContainer.addChildAt(point, 0);
			}

			function setChildBodyMode(child: Sprite): void
			{
				child.useHandCursor = false;
				child.buttonMode    = false;
				child.mouseEnabled  = false;
				child.mouseChildren = false;
				child.focusRect     = false;
			}
		}

		//削除
		public function dispose(): void
		{
			if(_pointContainer != null)
			{
				CommonUtils.removeFromParent(_pointContainer);
				CommonUtils.removeAllChildrenOf(_pointContainer);
				_pointContainer = null;
			}
			if(_outline != null)
			{
				CommonUtils.removeFromParent(_outline);
				CommonUtils.removeAllChildrenOf(_outline);
				_outline = null;
			}
			_pointContainer = null;
			_outline = null;
			_pointList = null;
			_hidePointNames = null;
		}

		//強制ポイント非表示フラグ
		public function set forceHidePoints(value: Boolean): void
		{
			_forceHidePoints = value;
		}

		//取り付け判定
		public function get attached(): Boolean
		{
			return _pointContainer.parent != null;
		}

		//手書き時ボーダーライン取り付け
		public function locked(mode: Boolean): void
		{
			if(mode)
			{
				detach();

				_editBox.rect = _editBox.getBounds(_editBox);
				_editBox.bg.graphics.clear();
				_editBox.bg.graphics.beginFill(0xffffff, 0.5);
				_editBox.bg.graphics.drawRect(_editBox.rect.x, _editBox.rect.y, _editBox.rect.width, _editBox.rect.height);
				_editBox.bg.graphics.endFill();
				_editBox.bg.mouseEnabled = false;
				_editBox.bg.mouseChildren = false;

			}
			else
			{
				CommonUtils.removeFromParent(_outline);
			}
		}

		//ボーダーライン取り付け
		public function attach(): void
		{
			if(_pointContainer != null) _pointContainer.visible = true;
			if(_outline != null) _outline.visible = true;
			locked(false);
			_editBox.addChild(_outline);
			_editBox.addChild(_pointContainer);
		}

		//ボーダーライン取り外し
		public function detach(): void
		{
			if(_pointContainer != null) _pointContainer.visible = false;
			if(_outline != null) _outline.visible = false;
			_editBox.bg.graphics.clear();
			CommonUtils.removeFromParent(_outline);
			CommonUtils.removeFromParent(_pointContainer);
		}

		//描画
		public function draw(): void
		{
			changeBorderState("active");
			_drawOutline();
			_drawPoint();
		}
		//枠線描画
		public function changeBorderState(state: String): void
		{
			switch(state)
			{
				case "active":
					attach();
					_colorTransForm.color = _boxColor.active;
					_editBox.bg.filters = null;
					_outline.transform.colorTransform = _colorTransForm;
					_editBox.mouseChildren = true;
					break;
				case "lock"://ロックして手書きツール開始
					/*
					_forceHidePoints = true;
					_colorTransForm.color = _boxColor.lock;
					_outline.transform.colorTransform = _colorTransForm;
					*/
					locked(true);
					_editBox.box.mouseChildren = true;
					_editBox.bg.filters = [_dropShadowFilter, _dropShadowFilter2];
					_drawPoint();
					break;
				default:
					/*
					_colorTransForm.color = _boxColor.normal;
					_outline.transform.colorTransform = _colorTransForm;
					*/
					_editBox.bg.filters = null;
					_editBox.mouseChildren = false;
					detach();
			}
		}

		//枠線描画
		private function _drawOutline(): void
		{
			_outline.graphics.clear();
			_outline.graphics.lineStyle(_lineSize * _editBox.scale , 0x0066ee);
			_outline.graphics.moveTo(_editBox.rect.x - _lineSize / 2, _editBox.rect.y - _lineSize / 2);
			_outline.graphics.lineTo(_editBox.rect.x + _editBox.rect.width + _lineSize / 2, _editBox.rect.y - _lineSize / 2);
			_outline.graphics.lineTo(_editBox.rect.x + _editBox.rect.width + _lineSize / 2, _editBox.rect.y + _editBox.rect.height + _lineSize / 2);
			_outline.graphics.lineTo(_editBox.rect.x - _lineSize / 2, _editBox.rect.y + _editBox.rect.height + _lineSize / 2);
			_outline.graphics.lineTo(_editBox.rect.x - _lineSize / 2, _editBox.rect.y - _lineSize / 2);
			_colorTransForm.color = _boxColor.active;
			_outline.transform.colorTransform = _colorTransForm;
			if(_shouldShowPoint(Operation.ROTATION) && !_forceHidePoints)
			{
				_outline.graphics.moveTo(_editBox.rect.x + (_editBox.rect.width/2), _editBox.rect.y - _lineSize / 2);
				_outline.graphics.lineTo(_editBox.rect.x + (_editBox.rect.width/2), _editBox.rect.y - _rotatePointDistance);
			}
		}

		//ポイント描画
		private function _drawPoint(): void
		{
			var i: uint;
			var point: Sprite;
			for(i = 0; i < _pointList.length; i++)
			{
				point = _pointList[i];
				if(point != null)
				{
					point.scaleX = _editBox.scale;
					point.scaleY = _editBox.scale;
					point.graphics.clear();

					switch(point.name)
					{
						case Operation.LOCK:
							point.graphics.beginFill(0xffffff, 0.01);
							point.graphics.drawCircle(_editBox.rect.x, _editBox.rect.y, 22);
							point.graphics.endFill();
							point.graphics.lineStyle(_pointLineSize, 0x333333);
							point.graphics.beginFill(0xffffff, 1.0);
							point.graphics.drawCircle(_editBox.rect.x, _editBox.rect.y, 22);
							point.graphics.endFill();

							while (point.numChildren)
							{
								point.removeChildAt(0);
							}
							var sprite: Sprite = SVGUtils.loadSVG(_Svg);
							sprite = Lib.fittingSprite(point, sprite);
							sprite.x = _editBox.rect.x - 23;
							sprite.y = _editBox.rect.y - 23;
							sprite.mouseEnabled = false;
							point.addChild(sprite);
							point.name = "lock";
							point.mouseChildren = false;
							point.mouseEnabled = true;
							break;
						default:
							point.graphics.beginFill(0xffffff, 0.01);
							point.graphics.drawCircle(0, 0, _pointHitSize);
							point.graphics.endFill();
							point.graphics.lineStyle(_pointLineSize, 0x333333);
							point.graphics.beginFill(0xffffff, 1.0);
							point.graphics.drawCircle(0, 0, _pointSize);
							point.graphics.endFill();
					}

					switch(point.name)
					{
						case Operation.ROTATION:
							point.x = _editBox.rect.x + (_editBox.rect.width/2);
							point.y = _editBox.rect.y - _rotatePointDistance;
							break;
						case Operation.SCALE_X:
						//case Operation.WIDTH:
							point.x = _editBox.rect.x + _editBox.rect.width;
							point.y = _editBox.rect.y + (_editBox.rect.height/2);
							break;
						case Operation.SCALE_Y:
						//case Operation.HEIGHT:
							point.x = _editBox.rect.x + (_editBox.rect.width/2);
							point.y = _editBox.rect.y + _editBox.rect.height;
							break;
						case Operation.SCALE_XY:
						//case Operation.WIDTHHEIGHT:
							point.x = _editBox.rect.x + _editBox.rect.width;
							point.y = _editBox.rect.y + _editBox.rect.height;
							break;
						case Operation.LOCK:
							point.x = -11;
							point.y = -11;
							break;
						//case Operation.DELETE:
							//point.x = _editBox.rect.x;
							//point.y = _editBox.rect.y;
							break;
						default:
							point.x = 0;
							point.y = 0;
							break;
					}
					point.visible = _shouldShowPoint(point.name);
							//trace("#", sprite.name);
				}
			}
		}

		//削除ボタン×マーク作成
		private function _createXLine(): void
		{
			//var scale: Number = 1.0;
			_pointXLine = new Sprite();
			drawXLine("L");
			drawXLine("R");
			function drawXLine(startV: String): void
			{
				var line: Sprite = new Sprite();
				var startPointX: Number;
				var startPointY: Number;
				var endPointX: Number;
				var endPointY: Number;
				var margin: Number = _pointSize * 0.05 * _editBox.scale;
				if(startV == "L")
				{
					startPointX = margin;
					startPointY = margin;
					endPointX = _pointSize - margin;
					endPointY = _pointSize - margin;
				}
				else
				{
					startPointX = _pointSize - margin;
					startPointY = margin;
					endPointX = margin;
					endPointY = _pointSize - margin;
				}
				line.graphics.lineStyle(2 * _editBox.scale, 0xffffff);
				line.graphics.moveTo(startPointX, startPointY);
				line.graphics.lineTo(endPointX, endPointY);
				line.scaleX = _editBox.scale;
				line.scaleY = _editBox.scale;
				line.x = _pointSize / 2 * -1;
				line.y = _pointSize / 2 * -1;
				_pointXLine.addChild(line);
			}
		}

		//ポイント表示判定
		private function _shouldShowPoint(pointName: String): Boolean
		{
			if(_forceHidePoints) return false;
			if(_operationList.indexOf(pointName) < 0) return false;
			if(CommonUtils.hasOwnPropertyCheck(_hidePointNames, pointName))
			{
				return false;
			}
			return true;
		}

		//ポイント表示設定
		private function _setShowPoint(pointName: String, flag: Boolean): void
		{
			if(flag)
			{
				if(CommonUtils.hasOwnPropertyCheck(_hidePointNames, pointName))
				{
					delete _hidePointNames[pointName];
				}
			}
			else
			{
				if(_hidePointNames == null) _hidePointNames = {};
				_hidePointNames[pointName] = 1;
			}
		}

		//制御ポイントのヒットテスト
		public function hitTestControlPoint(x: Number, y: Number): Sprite
		{
			var i: uint;
			var point: Sprite;
			if(_pointContainer.visible == false) return null;
			for(i = 0; i < _pointList.length; i++)
			{
				point = _pointList[i] as Sprite;
				if(point != null)
				{
					if(point.visible && point.hitTestPoint(x, y, false))
					{
						return point;
					}
				}
			}
			return null;
		}
	}
}