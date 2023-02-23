package model.plugin.report.calendar
{
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	import flash.text.TextFormatAlign;
	import flash.text.TextField;
	import mx.core.UITextField;

	public class DayBody extends Sprite
	{
		public var ctrlr: Day;
		public var box: Shape;
		public var border: Shape;
		public function DayBody(controller: VC)
		{
			ctrlr = controller as Day;

			this.graphics.beginFill(0xffffff, 1.0);
			this.graphics.drawRect(0, 0, ctrlr.boxWidth, ctrlr.boxHeight);
			this.graphics.endFill();
			this.graphics.moveTo(0, 0);
			this.graphics.lineStyle(ctrlr.thick , ctrlr.color, 1.0, false, "normal", "none");
			this.graphics.lineTo(ctrlr.boxWidth, 0);
			this.graphics.lineTo(ctrlr.boxWidth, ctrlr.boxHeight);
			this.graphics.lineTo(0, ctrlr.boxHeight);
			this.graphics.lineTo(0, 0);

			var dayField: UITextField = new UITextField();
			dayField.embedFonts = true;
			dayField.mouseEnabled = false;
			var format: TextFormat = new TextFormat();
			format.color = ctrlr.transparent ? 0x222222 : 0xdddddd;
			format.font = Lib.notoSansMonoCJKJP;
			format.size = 32;
			format.align = TextFormatAlign.RIGHT;
			dayField.defaultTextFormat = format;
			dayField.name = "yearField";
			dayField.text = ctrlr.day;
			dayField.width = 40;
			dayField.height = 50;
			dayField.border = false;
			dayField.type = TextFieldType.DYNAMIC;
			dayField.background = false;
			dayField.backgroundColor = 0xdddddd;
			this.addChild(dayField);
			dayField.x = 90;
			dayField.y = ctrlr.boxHeight - 50;

			box = new Shape();
			this.addChild(box);
			//box.width = ctrlr.boxWidth;
			//box.height = ctrlr.boxHeight;

			border = new Shape();
			border.graphics.moveTo(0, 0);
			border.graphics.lineStyle(ctrlr.borderThick , ctrlr.borderColor, ctrlr.borderAlpha, false, "normal", "none");
			border.graphics.lineTo(ctrlr.boxWidth, 0);
			border.graphics.lineTo(ctrlr.boxWidth, ctrlr.boxHeight);
			border.graphics.lineTo(0, ctrlr.boxHeight);
			border.graphics.lineTo(0, 0);
			this.addChild(border);
			border.visible = false;
		}
	}
}