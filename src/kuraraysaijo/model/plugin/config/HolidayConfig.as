package kuraraysaijo.model.plugin.config
{
	import flash.filesystem.File;
	public class HolidayConfig
	{
		private static var _config: DateTypeConfig;
		public function HolidayConfig()
		{
			super();
			_config = new DateTypeConfig("holiday", "holiday.xml");
		}

		//CSV取り込み
		public static function importCSVFile(csvFile: File): void
		{
			if(_config != null && csvFile != null)
			{
				_config.importCSVFile(csvFile);
				_config.save();
			}
		}
	}
}