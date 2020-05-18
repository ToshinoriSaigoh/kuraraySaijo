package
{
	import common.CommonUtils;
	//ANEWiFi.ane
	import jp.co.talkie.gl50.ane.wifi.WiFiInfo;
	public class DeviceSSID
	{
		// SSID取得
		public static function getCurrentSSID(cmpFnc:Function):void
		{
			var wifiInfo:WiFiInfo = new WiFiInfo();
			var txt:String;

			txt = splitDoubleQuotation(wifiInfo.getInfo());

			if( cmpFnc != null )
			{
				cmpFnc.call(null,txt);
			}

			// Android用前後のダブルクォーテーションを削除
			function splitDoubleQuotation(txt:String):String
			{
				var res:String;
				var reg:RegExp;
				if( CommonUtils.isEmptyString(txt) == false )
				{
					reg = new RegExp('^"|"$','gi');
					res = txt.replace(reg,'');
				}
				return res;
			}
		}
	}
}

