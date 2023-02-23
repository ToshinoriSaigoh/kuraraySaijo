package
{
	//device-info-util.ane
	import com.debokeh.anes.utils.DeviceInfoUtil;

	public class DeviceSSID
	{
		//SSID取得
		public static function getCurrentSSID(cmpFnc: Function): void
		{
			var txt: String;

			txt = DeviceInfoUtil.getCurrentSSID();

			if(cmpFnc != null)
			{
				cmpFnc.call(null, txt);
			}
		}
	}
}

