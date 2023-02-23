package kuraraysaijo.model.batch
{
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
					closeReportID = Lib.getDateReportID(today);
					today.setTime(param.date.getTime());
					PostBox.send("closeReport", {report: closeReportID});
					PostBox.send("openTodayReport");
				}
			}
			//today.setTime(0);
		}
	}
}

