package kuraraysaijo.model.plugin.report.calendar
{
	import kuraraysaijo.model.plugin.holiday.Holiday;
	import model.plugin.report.Report;

	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	import flash.text.TextFormatAlign;
	import flash.events.*;
	import flash.filesystem.File;

	public class Day extends VC
	{
		//kuraray
		public var isHoliday: Boolean;
		public var dayName: String;
		public var _file: Boolean;
		//Sharin.Day
		public var id: uint;
		public var calendarMonth: String;
		public var myDate: Date;
		[Bindable]
		public var year: String;
		[Bindable]
		public var month: String;
		[Bindable]
		public var day: String;

		public var boxWidth: Number;
		public var boxHeight: Number;
		public var transparent: Boolean;
		public var color: Number;
		public var thick: Number;
		//境界線
		public var borderColor: Number;
		public var borderThick: uint;
		public var borderAlpha: Number;

		private var _dataList: Object;

		public function Day(parent: VC, calendarMonth: uint, d: uint, date: Date, boxW: uint, boxH: uint, theMonth: Boolean = true)
		{
			vcName = "dayBox";
			elementName = "dayBox";
			id = d;
			this.calendarMonth = String(calendarMonth + 1);
			myDate = date;
			year = String(date.getFullYear());
			month = String(date.getMonth() + 1);
			day = String(date.getDate());
			color = 0x888888;
			thick = 1;
			borderColor = 0x444444;//0x00ccee;
			borderThick = 4;
			borderAlpha = 0.8;
			transparent = theMonth;
			boxWidth = boxW;
			boxHeight = boxH;
			isHoliday = false;
			dayName = null;

			_dataList = {};
			setDayName();
			body = new DayBody(this);
			super(parent);

			_file = false;
		}

		//ファイルリスト更新
		public function updateFileList(dayXML: XML): void
		{
			if(transparent && dayXML != null && dayXML.files[0] != null && dayXML.files[0].elements("file").length() > 0)
			{
				_file = true;
				(body as DayBody).fileBorder.visible = true;
			}
			else
			{
				_file = false;
				(body as DayBody).fileBorder.visible = false;
			}
		}

		public function hasOwnReport(): Boolean
		{
			return _file;
		}

		public function setDayName(): void
		{
			var dateString: String = year + "/" + Lib.digitNum(Number(month), 2) + "/" + Lib.digitNum(Number(day), 2);
			if(Holiday.isHoliday(new Date(myDate)))
			{
				var holidayXML: XML = new XML(Config.get("holiday"));
				var dayData: XML = holidayXML.elements("day").(attribute("id") == dateString)[0];
				dayName = dayData != null ? dayData : null;
				borderColor = 0xee0000;
				isHoliday = true;
			}
			else
			{
				dayName = null;
				borderColor = 0x444444; //0x00ccee;
				isHoliday = false;
			}
		}

		public function updateBody(): void
		{
			setDayName();
			(body as DayBody).update();
		}
	}
}