package common
{
	import flash.system.Capabilities;

	public class PlatformUtils
	{
		public static const WINDOWS: String     = "windows";
		public static const ANDROID: String     = "android";
		public static const IOS: String         = "ios";

		public static function osCheck(target: String): Boolean
		{
			var res: Boolean;
			var os: String;

			res = false;

			os = Capabilities.os;
			if(target == WINDOWS)
			{
				if(os.indexOf("Windows") >= 0)
				{
					res = true;
				}
			}
			else if(target == ANDROID)
			{
				if(os.indexOf("Linux") >= 0)
				{
					res = true;
				}
			}
			else if(target == IOS)
			{
				if(os.indexOf("iPhone") >= 0 || os.indexOf("iPad") >= 0)
				{
					res = true;
				}
			}
			return res;
		}
	}
}