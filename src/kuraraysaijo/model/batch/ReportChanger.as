package kuraraysaijo.model.batch
{
/**
 * レポートを切り替えるためのクラス
 *
 * update 2023/04/12
 * Since 2018/06/25
 * @public
 */
	public class ReportChanger extends Plug
	{
		private var today: Date;

		public function ReportChanger()
		{
			super();
			today = new Date();
		}

		public function PB_clock(): void
		{
			var param: Object = PostBox.get("PB_clock");
			var closeReportID: String;
			if(param.date != null)
			{
				//日付が更新されたときにレポートを開く
				if(param.date.date != today.date)
				{
trace("*changedDay*");
					closeReportID = Lib.getDateReportID(today);
					today.setTime(param.date.getTime());
					PostBox.send("closeReport", {report: closeReportID});
					PostBox.send("openTodayReport");
				}
				/*
				//日付更新でレポート切替
				//日付比較
				var day: Number = nowDateTime.getDate();
				var nowDay: Number = param.datetime.getDate();
				if(day != nowDay)
				{
					PostBox.send("changedDay");
				}
				*/

			}
			//today.setTime(0);
		}
	}
}

