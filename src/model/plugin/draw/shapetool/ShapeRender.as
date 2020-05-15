package model.plugin.draw.shapetool
{
	import model.plugin.draw.*;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.BlendMode;
	import flash.display.CapsStyle;
	import flash.display.LineScaleMode;

	public class ShapeRender
	{
		public static function ready(drawPanel: Object, bufferVal: Object, completeFunc: Function = null): void
		{
			if(bufferVal.operation == "new")
			{
				var targetLayer: Object = drawPanel.drawLayers[bufferVal.layer];
				targetLayer.body.blendMode = BlendMode.LAYER;
				var shapeBox: ShapeBox;
				shapeBox = new ShapeBox(drawPanel, targetLayer, bufferVal);
				if(bufferVal.option.penType == "eraser")
				{
					shapeBox.body.blendMode = BlendMode.ERASE;
				}
				targetLayer.body.addChild(shapeBox);
				Draw.drawList[drawPanel.report.vcName][bufferVal.id] = shapeBox;
			}
			if(completeFunc != null) completeFunc.call();

		}

		public static function rendering(reportID: String, piece: Object): void
		{
			var target: * = Draw.drawList[reportID][piece.id];
			target.body.graphics.clear();
			if(piece.hasOwnProperty("thick") || piece.hasOwnProperty("lineColor") || piece.hasOwnProperty("fillColor") || piece.hasOwnProperty("alpha") || piece.hasOwnProperty("lineAlpha") || piece.hasOwnProperty("fillAlpha"))
			{
				target.thick = piece.thick;
				target.lineColor = piece.lineColor;
				target.fillColor = piece.fillColor;

				//線アルファ値設定
				//target.lineAlpha = piece.lineAlpha == 0 ? 1.0 : piece.lineAlpha;
				target.lineAlpha = 1.0;
				//塗りつぶしアルファ値設定
				target.fillAlpha = piece.alpha == 0 ? 1.0 : piece.alpha;
				target.visible = true;
			}
			else
			{

				if(target.line) target.body.graphics.lineStyle(target.thick, target.lineColor, target.lineAlpha, false, LineScaleMode.NORMAL , "none", "miter");
				if(target.fill) target.body.graphics.beginFill(target.fillColor, target.fillAlpha);
				switch(piece.t)
				{
					case "circle":
						target.body.graphics.drawEllipse(0, 0, piece.w, piece.h);
						break;
					case "rect":
						target.body.graphics.drawRect(0, 0, piece.w, piece.h);
						break;
				}
				if(target.fill) target.body.graphics.endFill();
				target.x = piece.x;
				target.y = piece.y;
			}
			target.defaultWidth = target.width;
			target.defaultHeight = target.height;
			target.centeringPoint();
		}
	}
}
