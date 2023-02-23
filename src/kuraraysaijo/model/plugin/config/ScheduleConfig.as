package kuraraysaijo.model.plugin.config
{
	import flash.filesystem.File;
	public class ScheduleConfig
	{
		private static var _config: DateTypeConfig;
		public function ScheduleConfig()
		{
			super();
			_config = new DateTypeConfig("schedule", "schedule.xml");
		}

		//CSV取り込み
		public static function importCSVFile(csvFile: File): void
		{
			if(_config != null && csvFile != null)
			{
				_config.importCSVFile(csvFile);
				_config.save();

				var targetElement: XML = Config.configTree.schedule[0];
				if(targetElement == null)
				{
					Config.configTree.appendChild(_config.data);
				}
				else
				{
					Config.configTree.replace("schedule", _config.data);
				}
			}
		}
	}
}