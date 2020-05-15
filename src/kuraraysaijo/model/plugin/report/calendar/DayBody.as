package kuraraysaijo.model.plugin.report.calendar
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
		public var fileBorder: Shape;
		public var border: Shape;
		public var holidayBorder: Shape;

		private var _dayField: UITextField;
		private var _nameField: UITextField;
		public function DayBody(controller: VC)
		{
			ctrlr = controller as Day;

			_dayField = new UITextField();
			_dayField.embedFonts = true;
			_dayField.mouseEnabled = false;
			var format: TextFormat = new TextFormat();
			format.color = ctrlr.transparent ? 0x222222 : 0xdddddd;
			format.font = Lib.notoSansMonoCJKJP;
			format.size = 32;
			format.align = TextFormatAlign.RIGHT;
			_dayField.defaultTextFormat = format;
			_dayField.text = ctrlr.day;
			_dayField.name = "dayField";
			_dayField.width = 40;
			_dayField.height = 50;
			_dayField.border = false;
			_dayField.type = TextFieldType.DYNAMIC;
			_dayField.background = false;
			_dayField.backgroundColor = 0xdddddd;
			this.addChild(_dayField);
			_dayField.x = 90;
			_dayField.y = ctrlr.boxHeight - 50;

			box = new Shape();
			this.addChild(box);

			fileBorder = new Shape();
			this.addChild(fileBorder);
			fileBorder.visible = false;
			border = new Shape();
			this.addChild(border);
			border.visible = false;

			//祝日枠
			_nameField = new UITextField();
			_nameField.embedFonts = true;
			_nameField.mouseEnabled = false;
			var nameFormat: TextFormat = new TextFormat();
			nameFormat.color = 0xee0000;
			nameFormat.font = Lib.notoSansMonoCJKJP;
			nameFormat.size = 20;
			nameFormat.align = TextFormatAlign.LEFT;
			_nameField.defaultTextFormat = nameFormat;
			_nameField.text = "";
			_nameField.name = "nameField";
			_nameField.width = 100;
			_nameField.height = 50;
			_nameField.border = false;
			_nameField.type = TextFieldType.DYNAMIC;
			_nameField.background = false;
			_nameField.backgroundColor = 0xdddddd;
			_nameField.x = 5;
			_nameField.y = 5;

			holidayBorder = new Shape();
			holidayBorder.visible = false;

			update();
		}

		public function update(): void
		{
			this.graphics.clear();
			this.graphics.beginFill(0xffffff, 1.0);
			this.graphics.drawRect(0, 0, ctrlr.boxWidth, ctrlr.boxHeight);
			this.graphics.endFill();
			this.graphics.moveTo(0, 0);
			this.graphics.lineStyle(ctrlr.thick , ctrlr.color, 1.0, false, "normal", "none");
			this.graphics.lineTo(ctrlr.boxWidth, 0);
			this.graphics.lineTo(ctrlr.boxWidth, ctrlr.boxHeight);
			this.graphics.lineTo(0, ctrlr.boxHeight);
			this.graphics.lineTo(0, 0);

			fileBorder.graphics.clear();
			fileBorder.graphics.moveTo(0, 0);
			fileBorder.graphics.lineStyle(ctrlr.borderThick , ctrlr.color, ctrlr.borderAlpha, false, "normal", "none");
			fileBorder.graphics.lineTo(ctrlr.boxWidth, 0);
			fileBorder.graphics.lineTo(ctrlr.boxWidth, ctrlr.boxHeight);
			fileBorder.graphics.lineTo(0, ctrlr.boxHeight);
			fileBorder.graphics.lineTo(0, 0);

			border.graphics.clear();
			border.graphics.moveTo(0, 0);
			border.graphics.lineStyle(ctrlr.borderThick , ctrlr.borderColor, ctrlr.borderAlpha, false, "normal", "none");
			border.graphics.lineTo(ctrlr.boxWidth, 0);
			border.graphics.lineTo(ctrlr.boxWidth, ctrlr.boxHeight);
			border.graphics.lineTo(0, ctrlr.boxHeight);
			border.graphics.lineTo(0, 0);

			holidayBorder.graphics.clear();
			holidayBorder.graphics.moveTo(0, 0);
			holidayBorder.graphics.lineStyle(ctrlr.borderThick , ctrlr.borderColor, ctrlr.borderAlpha, false, "normal", "none");
			holidayBorder.graphics.lineTo(ctrlr.boxWidth, 0);
			holidayBorder.graphics.lineTo(ctrlr.boxWidth, ctrlr.boxHeight);
			holidayBorder.graphics.lineTo(0, ctrlr.boxHeight);
			holidayBorder.graphics.lineTo(0, 0);

			if(ctrlr.isHoliday)
			{
				_nameField.text = ctrlr.dayName;
				holidayBorder.visible = true;
				if(_nameField.parent == null) this.addChild(_nameField);
				if(holidayBorder.parent == null) this.addChild(holidayBorder);
			}
			else
			{
				_nameField.text = "";
				holidayBorder.visible = false;
				if(_nameField.parent != null) this.removeChild(_nameField);
				if(holidayBorder.parent != null) this.removeChild(holidayBorder);
			}
		}
	}
}