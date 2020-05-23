package kuraraysaijo.model.plugin.config
{
	public class WBGTConfig
	{
		[Embed(source="../../../../xml/wbgt.xml", mimeType="application/octet-stream")]
		public static const WBGT_CONFIG_XML_CLASS: Class;

		private static var _config: SensorConfig;
		public function WBGTConfig()
		{
			_config = new SensorConfig("wbgt", WBGT_CONFIG_XML_CLASS, "wbgt.xml");
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