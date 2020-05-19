package kuraraysaijo.model.plugin.config
{
	import flash.filesystem.File;
	public class DutyConfig
	{
		private static var _config: DateTypeConfig;
		public function DutyConfig()
		{
			super();
			_config = new DateTypeConfig("duty", "duty.xml");
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