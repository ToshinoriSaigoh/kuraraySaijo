package common
{
	import flash.desktop.NativeApplication;

	public class Version
	{
		public static const SAME_VERSION: String        = "same";
		public static const NEWER_VERSION: String       = "newer";
		public static const OLDER_VERSION: String       = "older";
		public static const JUDGMENT_IMPOSSIBLE: String = "judgment impossible";

		private static var _version: String;

		//バージョン番号取得
		public static function getVersionNumber(): String
		{
			var appXML: XML;
			var ns: Namespace;
			var nativeApplication: NativeApplication;

			if(_version == null)
			{
				nativeApplication = NativeApplication.nativeApplication;
				appXML = nativeApplication.applicationDescriptor;
				ns = appXML.namespace();
				if(PlatformUtils.osCheck(PlatformUtils.IOS))
				{
					_version = appXML.ns::versionLabel;
				}
				else
				{
					_version = appXML.ns::versionNumber;
				}
			}

			return _version;
		}

		//バージョンチェック
		public static function check(version: String, threshold: uint): String
		{
			var i: uint;
			var currentVersion: String;
			var currentVerDataList: Array;
			var verDataList: Array;
			var res: String;
			var defFlg: Boolean;
			var curVerNum: uint;
			var verNum: uint;

			//空文字は判定しない
			currentVersion = getVersionNumber();
			if(CommonUtils.isEmptyString(currentVersion) || CommonUtils.isEmptyString(version))
			{
				return JUDGMENT_IMPOSSIBLE;
			}

			res = JUDGMENT_IMPOSSIBLE;

			currentVerDataList = currentVersion.split(".");
			verDataList = version.split(".");

			if(currentVerDataList.length >= threshold && verDataList.length >= threshold)
			{
				defFlg = false;
				for(i = 0; i < threshold; ++i)
				{
					curVerNum = uint(currentVerDataList[i]);
					verNum    = uint(verDataList[i]);
					if(curVerNum > verNum)
					{
						res = OLDER_VERSION;
						defFlg = true;
						break;
					}
					else if(curVerNum < verNum)
					{
						res = NEWER_VERSION;
						defFlg = true;
						break;
					}
				}
				if(defFlg == false)
				{
					res = SAME_VERSION;
				}
			}

			return res;
		}
	}
}