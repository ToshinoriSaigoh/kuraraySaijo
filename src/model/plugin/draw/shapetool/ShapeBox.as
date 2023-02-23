package model.plugin.draw.shapetool
{
	import common.*;
	import model.plugin.draw.*;
	import model.plugin.draw.edittool.EditBox;
	import model.plugin.draw.edittool.Operation;
	import flash.display.Shape;
	import flash.events.*;
	import flash.geom.Rectangle;
	import flash.display.Graphics;

	public class ShapeBox extends EditBox
	{
		public var line: Boolean;
		public var fill: Boolean;
		public var lineColor: Number;
		public var fillColor: Number;
		public var thick: uint;
		public var lineAlpha: Number;
		public var fillAlpha: Number;

		public var startX: Number;
		public var startY: Number;

		private var _myShape: Graphics;

		public function ShapeBox(drawPanel: Object, drawLayer: Object, bufferVal: Object): void
		{
			name = bufferVal.id;
			var opList: Array = [
				Operation.ROTATION,
				Operation.SCALE_XY,
				Operation.SCALE_X,
				Operation.SCALE_Y,
				Operation.LOCK
			];
			targetPanel = drawPanel as DrawPanel;
			targetLayer = drawLayer as DrawLayer;
			super();

			line = bufferVal.option.line;
			fill = bufferVal.option.fill;
			lineAlpha = 1.0;
			fillAlpha = 1.0;

			body = new Shape();
			box.addChild(body);

			setOperation(opList);
			visible = false;
		}
	}
}
