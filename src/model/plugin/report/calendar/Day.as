package model.plugin.report.calendar
{
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
		public var id: uint;
		public var calendarMonth: String;
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
			year = String(date.getFullYear());
			month = String(date.getMonth() + 1);
			day = String(date.getDate());
			color = 0x888888;
			thick = 1;
			borderColor = 0x00ccee;
			borderThick = 4;
			borderAlpha = 0.5;
			transparent = theMonth;
			boxWidth = boxW;
			boxHeight = boxH;
			year = String(date.getFullYear());
			month = String(date.getMonth() + 1);
			day = String(date.getDate());

			_dataList = {};
			super(parent);
			body = new DayBody(this);
		}

		//ファイルリスト更新
		public function updateFileList(dayXML: XML): void
		{
			_clearFiles();
			if(transparent && dayXML != null)
			{
				_listupFiles(dayXML.files[0]);
			}
		}

		private function _clearFiles(): void
		{
			(body as DayBody).box.graphics.clear();
		}
		//保存されているファイルリストをリストアップ
		private function _listupFiles(fileListXML: XML): void
		{

			var baseX: int = 6;
			var baseY: int = 6;
			if(fileListXML != null)
			{
				var markX: int = baseX;
				var markY: int = baseY;
				var i: uint;
				for(i = 0; i < fileListXML.file.length(); i++)
				{
					(body as DayBody).box.graphics.beginFill(Report.reportTypeList[fileListXML.file[i].@type].color, 1.0);
					(body as DayBody).box.graphics.drawRect(markX, markY, 12, 12);
					(body as DayBody).box.graphics.endFill();
					if(i % 10 == 9)
					{
						markX = baseX;
						markY += 13;
					}
					else
					{
						markX += 13;
					}
					if(i == 100) break;
				}
			}
		}
	}
}