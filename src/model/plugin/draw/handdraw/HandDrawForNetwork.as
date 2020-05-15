package model.plugin.draw.handdraw
{
	import model.plugin.draw.*;
	import model.plugin.draw.edittool.EditBox;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.CapsStyle;

	public class HandDrawForNetwork
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

		private var _targetReportName: String;
		private var _targetPageName: String;
		private var _targetLayerName: String;
		private var _targetLayer: DrawLayer;
		private var _targetDiv: EditBox;
		private var _targetSprite: Sprite;
		private var _tmpBufferData: Object;
		private var _toolOption: Object;
		private var _undoCnt: int;

		public function HandDrawForNetwork(param: Object)
		{
			super();
			_undoCnt = 50;
			_init(param);
		}

		private function _init(param: Object): void
		{
			_targetReportName = param.report;
			_targetPageName = param.page;
			_targetLayerName = param.layer;
			if(_targetReportName == Draw.activeReport.vcName && _targetPageName == Draw.activeDrawPanel.vcName)
			{
				if(Draw.activeDrawPanel.drawLayers.hasOwnProperty(param.layer))
				{
					_targetLayer = Draw.activeDrawPanel.drawLayers[param.layer];

					if(param.div != null)
					{
						_targetDiv = Draw.drawList[Draw.activeReport.vcName][param.div];
					}
					else
					{
						_targetDiv = null;
					}

					_id = param.id;
					_toolOption = param.toolOption;
					_setOption(param);
				}
			}
		}

		public function get targetReportName(): String
		{
			return targetReportName;
		}

		public function get targetPageName(): String
		{
			return _targetPageName;
		}

		public function get targetLayerName(): String
		{
			return _targetLayerName;
		}

		private function _setOption(param: Object): void
		{
			switch(_toolOption.penType)
			{
				case "eraser":
					_color = 0x000000;
					_tmpColor = 0x000000;
					_tmpAlpha = 0.2;
					_alpha = _toolOption.alpha;
					_thick = param.thick;
					_capsStyle = CapsStyle.ROUND;
					break;
				case "marker":
					_color = param.color;
					_tmpColor = param.color;
					_tmpAlpha = _toolOption.alpha;
					_alpha = _toolOption.alpha;
					_thick = param.thick;
					_capsStyle = CapsStyle.ROUND;
					break;
				default:
					_color = param.color;
					_tmpColor = param.color;
					_tmpAlpha = _toolOption.alpha;
					_alpha = _toolOption.alpha;
					_thick = param.thick;
					_capsStyle = CapsStyle.ROUND;
					break;
			}
		}

		public function down(pointX:Number, pointY:Number): void
		{
			if(_targetLayer == null) return;

			_startX = pointX;
			_startY = pointY;
			_tmpShape = new Shape();
			if(_targetDiv != null)
			{
				_targetSprite = _targetDiv.box;
			}
			else
			{
				_targetSprite = _targetLayer.body;
			}
			_targetSprite.addChild(_tmpShape);

			_tmpShape.graphics.lineStyle(_thick, _tmpColor, _tmpAlpha, false, "normal", _capsStyle);
			_tmpShape.graphics.moveTo(_startX, _startY);

			_tmpShape.name = _id;
		}

		// 手書き移動中イベント
		public function move(pointX:Number, pointY:Number): void
		{
			if(_targetLayer == null) return;

			_thisX = pointX;
			_thisY = pointY;
			switch(_toolOption.lineType)
			{
				case "curveLine":
					_tmpShape.graphics.lineTo(_thisX, _thisY);
					break;
				case "straightLine":
					_tmpShape.graphics.clear();
					_tmpShape.graphics.lineStyle(_thick, _tmpColor, _tmpAlpha);
					_tmpShape.graphics.moveTo(_startX, _startY);
					_tmpShape.graphics.lineTo(_thisX, _thisY);
					break;
			}
		}

		// 手描き書き終わりイベント
		public function up(pointX:Number, pointY:Number): void
		{
			if(_targetSprite != null && _tmpShape != null)
			{
				_targetSprite.removeChild(_tmpShape);
			}

			// if(_id != null)
			// {
			// 	switch(_toolOption.penType)
			// 	{
			// 		case "laser":
			// 			break;
			// 		default:
			// 			_addUndoList(_id);
			// 	}
			// }
		}
		private function _addUndoList(id: String): void
		{
			Draw.activeReport.undoList.unshift(id);
			Draw.activeReport.undoList = Draw.activeReport.undoList.slice(0, _undoCnt);
		}
	}
}