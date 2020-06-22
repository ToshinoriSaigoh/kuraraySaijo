package kuraraysaijo.model.sensor
{
	import common.PaddingUtils;
	import common.StringUtils;
	import common.csv.CSVLoader;
	import common.EnterFrameProccess;
	import flash.filesystem.File;
	import flash.events.Event;
	import flash.utils.getTimer;
	import mx.utils.UIDUtil;

	public class MeetingroomInfo extends Plug
	{
		private var _file: File;//読み込み対象ファイル
		private var _csvLoader: CSVLoader;//CSVローダー
		private static var _procKey: String;//エンターフレーム処理キー
		private static var _lastTime: int;//最後に確認した時間
		private static var _currentTime: int;//現在の時間
		private static var _inputInterval: int;//読み込みインターバル//ミリ秒

		public function MeetingroomInfo()
		{
			super();
			_file = new File(Config.get("config", "kuraraySaijo", "meetingroom", "inputFile"));
			_csvLoader = new CSVLoader();
			_procKey = UIDUtil.createUID();;
			_currentTime = getTimer();
			_lastTime = 0;
			_inputInterval = int(Config.get("config", "kuraraySaijo", "meetingroom", "inputInterval"));
		}

		//制御
		public function PB_meetingroomCtrl(): void
		{
			var param: Object = PostBox.get("PB_meetingroomCtrl");
			switch(param.command)
			{
				case "start":
					EnterFrameProccess.start(_procKey, enterFrameHandler);
					break;
				case "stop":
					EnterFrameProccess.stop(_procKey);
					break;
				case "request":
					_update();
					break;
			}
		}

		//エンターフレーム処理ｃ
		private function enterFrameHandler(e: Event): void
		{
			_currentTime = getTimer();
			if(_currentTime - _lastTime >= _inputInterval)
			{
				_lastTime = _currentTime;
				_update();
			}
		}

		//会議室情報読み込み更新処理
/*SA0003.csv
空欄
日付
時刻
187	[PLC]D00000187	会議室1	【0：空き】【1：使用中】
188	[PLC]D00000188	会議室2	
189	[PLC]D00000189	会議室3	
190	[PLC]D00000190	面談室1	
191	[PLC]D00000191	面談室2	

*/
		private function _update(): void
		{
			var csv: Array = _csvLoader.load(_file);
			var i: int;
			var row: Array;
			var data: Object;
			if(csv == null) return;
			if(csv.length == 0) return;
			for(i = csv.length - 1; i >= 0; i--)
			{
				row = csv[i];
				if(row.length >= 5)
				{
					data = {};
					data.room1 = Number(row[3]);//会議室1
					data.room2 = Number(row[4]);//会議室2
					data.room3 = Number(row[5]);//会議室3
					data.room4 = Number(row[6]);//面談室1
					data.room5 = Number(row[7]);//面談室2

					PostBox.send("meetingroom", {data: data});
					break;
				}
			}
		}
	}
}