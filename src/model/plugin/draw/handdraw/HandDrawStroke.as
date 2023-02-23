package model.plugin.draw.handdraw
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.BlendMode;
	import flash.display.CapsStyle;
	public class HandDrawStroke extends MovieClip
	{
		public var target: Sprite;
		public var lineType: String;
		public var penType: String;
		public var lineColor: Number;
		public var lineAlpha: Number;
		public var thick: uint;
		public var startX: Number;
		public var startY: Number;

		private var _hitStroke: Shape;//消しゴムあたり判定用
		public function HandDrawStroke(penType: String, lineType: String, stroke: Object): void
		{
			this.penType = penType;
			this.lineType = lineType;
			this.mouseEnabled = false;
			this.mouseChildren = true;
			startX = stroke.x;
			startY = stroke.y;
			thick = stroke.thick;
			lineColor = stroke.color;
			lineAlpha = stroke.alpha;

			_hitStroke = new Shape();
			this.addChildAt(_hitStroke, 0);
		}

		public function lineStyle(thisThick: uint, thisColor: Number, thisAlpha: Number, hinting: Boolean = false, scaleMode: String = "none"): void
		{
			this.thick = thisThick;
			this.lineColor = thisColor;
			this.lineAlpha = thisAlpha;
			this.graphics.lineStyle(thisThick, thisColor, thisAlpha, hinting, scaleMode);
			_hitStroke.graphics.lineStyle(10, 0x000000, 0);
		}
		public function moveTo(thisX: Number, thisY: Number): void
		{
			this.startX = thisX;
			this.startY = thisY;
			this.graphics.moveTo(thisX, thisY);
			_hitStroke.graphics.moveTo(thisX, thisY);
		}
		public function lineTo(thisX: Number, thisY: Number): void
		{
			this.graphics.lineTo(thisX, thisY);
			_hitStroke.graphics.lineTo(thisX, thisY);
		}
		public function clear(): void
		{
			this.graphics.clear();
			_hitStroke.graphics.clear();
		}
	}
}
