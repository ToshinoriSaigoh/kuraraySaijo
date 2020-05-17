package kuraraysaijo.model.plugin.holiday
{
/**
 * クラレカレンダー休日管理用クラス.
 *
 * update 2018/07/25
 * Since 2018/07/25
 * @private
 */
	import mx.controls.DateField;
	public class Holiday extends Plug
	{
		public function Holiday()
		{
			super();
		}

		//次の業務日取得
		public static function getNextWorkDay(theDay: Date): Date
		{
			var num1Day: uint = 1000 * 60 * 60 * 24;
			return checkNextDay(new Date(theDay.valueOf() + num1Day));

			function checkNextDay(date: Date): Date
			{
				if(isHoliday(date))
				{
					checkNextDay(new Date(date.valueOf() + num1Day));
				}
				return date;
			}
		}

		//基準日からの経過業務日数
		public static function getWorkDays(theDay: Date): int
		{
			//基準日
			var baseDate: Date = DateField.stringToDate(Config.configTree.config.kuraraySaijo.duty.baseDate[0], "YYYY/MM/DD");
			var count: int;//基準日からの経過業務日数
			var difference: Number = (theDay.valueOf() / 1000 / 60 / 60 / 24) - (baseDate.valueOf() / 1000 / 60 / 60 / 24) - 1;//基準日からの経過日数
			var num1Day: Number = 1000 * 60 * 60 * 24;
			var n: Number;
			for(n = 0; n < difference; n++)
			{
				if(!isHoliday(new Date(baseDate.valueOf() + (num1Day * n))))
				{
					count++;
				}
			}
			return count;

		}
		//基準日からの経過日数
		public static function isHoliday(date: Date): Boolean
		{
			var holidayXML: XML = new XML(Config.get("holiday"));
			var year: String = date.getFullYear().toString();
			var month: String = Lib.digitNum(date.getMonth() + 1, 2);
			var day: String = Lib.digitNum(date.getDate(), 2);
			var dateString: String = year + "/" + month + "/" + day;
			if(date.getDay() == 0 || date.getDay() == 6)
			{
				return true;//土日
			}
			else
			{
				if(holidayXML.elements("day").(attribute("id") == dateString)[0] != null)
				{
					return true;//カレンダー祝日
				}
				else
				{
					return false;//平日
				}
			}
		}
	}
}
