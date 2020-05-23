package kuraraysaijo.model.plugin.config
{
	public class AnemometerConfig
	{
		[Embed(source="../../../../xml/anemometer.xml", mimeType="application/octet-stream")]
		public static const ANEMOMETER_CONFIG_XML_CLASS: Class;

		private static var _config: SensorConfig;
		public function AnemometerConfig()
		{
			_config = new SensorConfig("anemometer", ANEMOMETER_CONFIG_XML_CLASS, "anemometer.xml");
		}
		//警告情報取得
		public static function getWarningInfo(level: uint): WarningInfo
		{
			if(_config != null) return _config.getWarningByID(level.toString());
			return null;
		}
		//警告情報取得
		public static function getWarning(value: Number): WarningInfo
		{
			if(_config != null) return _config.getWarning(value);
			return null;
		}
	}
}