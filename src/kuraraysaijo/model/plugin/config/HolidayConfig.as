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

				var targetElement: XML = Config.configTree.holiday[0];
				if(targetElement == null)
				{
trace("is NULL");
					Config.configTree.appendChild(_config.data);
				}
				else
				{
					Config.configTree.replace("holiday", _config.data);
trace("not NULL");
				}
/*
				else
				{
trace("not NULL");
					var branch: XML = Config.configTree;
					branch.replace("holiday", _config.data);
				}
trace("■DateTypeConfig.save()");
trace(Config.configTree);
*/

			}
		}
	}
}