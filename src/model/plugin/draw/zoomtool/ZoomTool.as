package model.plugin.draw.zoomtool
{
	import controller.*;
	import model.plugin.draw.Draw;
	import flash.display.*;
	import flash.events.*;

	import flash.geom.Point;
	import flash.geom.Matrix;

	import mx.core.FlexGlobals;

	public class ZoomTool extends Draw
	{
		public static var scaleArr: Array;
		public static var target: Sprite;
		private static var _maxZoomRate: Number;
		private static var _minZoomRate: Number;
		public function ZoomTool()
		{
			scaleArr = [0.5, 1.0, 1.5, 2.0, 3.0, 4.0, 5.0];
			super();
			_maxZoomRate = scaleArr[scaleArr.length - 1];
			_minZoomRate = scaleArr[0];
		}

		public function PB_changeThick(): void
		{
			var param: Object = PostBox.get("PB_changeThick");
			if(param.operation == "increase" && thick < 100)
			{
				thick++;
			}
			else if(param.operation == "decrease" && thick > 1)
			{
				thick--;
			}
		}

		public function PB_changeScale(): void
		{
			var param: Object = PostBox.get("PB_changeScale");
			var scaleIndex: uint = getScaleIndex();
			var stageX: Number = FlexGlobals.topLevelApplication.width / 2;
			var stageY: Number = FlexGlobals.topLevelApplication.height / 2;
			if(param.operation == "reset")
			{
				//scaleIndex = 1;
				reset();
				return;
			}
			else if(param.operation == "increase" && scaleArr.length - 1 > scaleIndex)
			{
				scaleIndex++;
			}
			else if(param.operation == "decrease" && scaleIndex > 0)
			{
				scaleIndex--;
			}
			var scale: Number = scaleArr[scaleIndex] / activeDrawPanel.scale;
			_zoom(scale, scale, stageX, stageY);

			function getScaleIndex(): uint
			{
				var nowScaleIndex: uint = 0;
				var i: uint;
				for(i = 0; i < scaleArr.length; i++)
				{
					if(scaleArr[i] < activeDrawPanel.scale)
					{
						nowScaleIndex++;
					}
					else
					{
						break;
					}
				}
				return nowScaleIndex;
			}
		}

		public static function reset(): void
		{
			if(activeDrawPanel == null) return;
			activeDrawPanel.setScale(1.0);
			PostBox.send("windowResize");
		}

		public static function gestureZoomHandler(evt: TransformGestureEvent): void
		{
			if(activeDrawPanel == null) return;
			_zoom(evt.scaleX, evt.scaleY, evt.stageX, evt.stageY);
		}

		private static function _zoom(offsetScaleX: Number, offsetScaleY: Number, stageX: Number, stageY: Number): void
		{
			/*
			//拡縮後パネル位置 - ((拡縮後パネルサイズ) * ((拡縮中心点 - 拡縮前パネル位置) / 拡縮前パネルサイズ)) - 拡縮中心点
			//activeDrawPanel.x = - ((activeDrawPanel.width * offsetScaleX) * ((stageX - activeDrawPanel.x) / activeDrawPanel.width)) - stageX;
			*/
			var tempScaleX: Number = activeDrawPanel.scaleX * offsetScaleX;
			switch(true)
			{
				case tempScaleX <= _minZoomRate:
					activeDrawPanel.x = - (((activeDrawPanel.width / activeDrawPanel.scaleX * _minZoomRate) * ((stageX - activeDrawPanel.x) / activeDrawPanel.width)) - stageX);
					activeDrawPanel.scaleX = _minZoomRate;
					break;
				case tempScaleX >= _maxZoomRate:
					activeDrawPanel.x = - (((activeDrawPanel.width / activeDrawPanel.scaleX * _maxZoomRate) * ((stageX - activeDrawPanel.x) / activeDrawPanel.width)) - stageX);
					activeDrawPanel.scaleX = _maxZoomRate;
					break;
				default:
					activeDrawPanel.x = - ((activeDrawPanel.width * offsetScaleX * ((stageX - activeDrawPanel.x) / activeDrawPanel.width)) - stageX);
					activeDrawPanel.scaleX = tempScaleX;
			}
			var tempScaleY: Number = activeDrawPanel.scaleY * offsetScaleY;
			switch(true)
			{
				case tempScaleY <= _minZoomRate:
					activeDrawPanel.y = - (((activeDrawPanel.height / activeDrawPanel.scaleY * _minZoomRate) * ((stageY - activeDrawPanel.y) / activeDrawPanel.height)) - stageY);
					activeDrawPanel.scaleY = _minZoomRate;
					break;
				case tempScaleY >= _maxZoomRate:
					activeDrawPanel.y = - (((activeDrawPanel.height / activeDrawPanel.scaleY * _maxZoomRate) * ((stageY - activeDrawPanel.y) / activeDrawPanel.height)) - stageY);
					activeDrawPanel.scaleY = _maxZoomRate;
					break;
				default:
					activeDrawPanel.y = - ((activeDrawPanel.height * offsetScaleY * ((stageY - activeDrawPanel.y) / activeDrawPanel.height)) - stageY);
					activeDrawPanel.scaleY = tempScaleY;
			}
			activeDrawPanel.setDragArea();
			activeDrawPanel.setScale(tempScaleX);
		}
	}
}
