package
{
	import common.CommonUtils;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.NativeProcessExitEvent;
	import flash.utils.ByteArray;
	import __AS3__.vec.Vector;
	import org.coderepos.text.encoding.Jcode;
	public class DeviceSSID
	{
		//SSID取得
		//WiFiInfo.exe
		//ManagedWifi.dll
		public static function getCurrentSSID(cmpFnc: Function): void
		{
			var nativeProcess: NativeProcess;
			var result: String;
			var resultWiFiInfoStr: String;

			exeWiFiInfo();

			//SSID取得用外部アプリ実行
			function exeWiFiInfo(): void
			{
				var info: NativeProcessStartupInfo;
				var exefile: File;

				if(NativeProcess.isSupported)
				{
					exefile = File.applicationDirectory.resolvePath("WiFiInfo.exe");

					info = new NativeProcessStartupInfo();
					info.executable = exefile;

					nativeProcess = new NativeProcess();
					nativeProcess.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, onOutputData);
					nativeProcess.addEventListener(ProgressEvent.STANDARD_INPUT_PROGRESS, onInputProgress);
					nativeProcess.addEventListener(ProgressEvent.STANDARD_ERROR_DATA, onError);
					nativeProcess.addEventListener(NativeProcessExitEvent.EXIT, onExit);
					nativeProcess.start(info);
				}
				else
				{
					callCmp();
				}
			}

			//標準出力時のイベント
			function onOutputData (event: ProgressEvent): void
			{
				var txt: String;
				var bytes: ByteArray;
				bytes = new ByteArray();

				nativeProcess.standardOutput.readBytes(bytes, 0, nativeProcess.standardOutput.bytesAvailable);
				if(bytes.length > 0)
				{
					txt = Jcode.from_sjis(bytes);
				}

				if(txt != null)
				{
					if(resultWiFiInfoStr == null)
					{
						resultWiFiInfoStr = new String();
					}
					resultWiFiInfoStr += txt;
				}
			}

			//標準入力時のイベント
			function onInputProgress(e: ProgressEvent): void
			{
			}

			//エラー時のイベント
			function onError(e: ProgressEvent): void
			{
				callCmp();
			}

			//NativeProcess終了時のイベント
			function onExit(e: NativeProcessExitEvent): void
			{
				resultWiFiInfo();
			}

			//WiFiInfo実行結果からSSID取得
			function resultWiFiInfo(): void
			{
				var ssid: String;
				ssid = extractSSIDFromText(resultWiFiInfoStr);
				if(CommonUtils.isEmptyString(ssid) == false)
				{
					result = ssid;
				}
				callCmp();
			}

			//SSIDをテキストから抽出
			function extractSSIDFromText(txt: String): String
			{
				var i: uint;
				var res: String;
				var reg: RegExp;
				var regRes: Object;
				var line: String;
				var list: Array;
				if(CommonUtils.isEmptyString(txt) == false)
				{
					reg = new RegExp("SSID=(.*)$");
					list = CommonUtils.splitCRLFStringToList(txt);
					for(i=0; i<list.length; ++i)
					{
						line = list[i];
						if(CommonUtils.isEmptyString(line) == false)
						{
							regRes = reg.exec(line);
							if (regRes != null)
							{
								res = regRes[1];
								break;
							}
						}
					}
				}
				return res;
			}

			//完了通知
			function callCmp(): void
			{
				if(cmpFnc != null)
				{
					cmpFnc.call(null, result);
					cmpFnc = null;
				}
			}
		}
	}
}

