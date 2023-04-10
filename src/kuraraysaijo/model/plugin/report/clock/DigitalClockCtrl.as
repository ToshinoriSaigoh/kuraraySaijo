package kuraraysaijo.model.plugin.report.clock
{
	import common.PaddingUtils;
	public class DigitalClockCtrl extends VC
	{
		private var _dayArr: Array;
		public function DigitalClockCtrl()
		{
			vcName = "digitalClock";
			elementName = "Group";
			super();

			_dayArr = ["日", "月", "火", "水", "木", "金", "土"];
		}

		public function PB_clock(): void
		{
			var param: Object = PostBox.get("PB_clock");
			var day: String = "";
			var time: String = "";
			day += PaddingUtils.zeroPadding(param.date.getFullYear(), 4);
			day += "/";
			day += PaddingUtils.zeroPadding(param.date.getMonth(), 2);
			day += "/";
			day += PaddingUtils.zeroPadding(param.date.getDate(), 2);
			//週
			day += "(" + _dayArr[param.date.getDay()] + ")";
			//
			mxml.date.text = day;
			time += PaddingUtils.zeroPadding(param.date.getHours(), 2);
			time += ":";
			time += PaddingUtils.zeroPadding(param.date.getMinutes(), 2);
			mxml.time.text = time;
		}
	}
}
