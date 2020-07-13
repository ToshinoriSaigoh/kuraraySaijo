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
	//import flash.system.System;

	public class SensorInfo extends Plug
	{
		private var _file: File;//読み込み対象ファイル
		private var _csvLoader: CSVLoader;//CSVローダー
		private static var _procKey: String;//エンターフレーム処理キー
		private static var _lastTime: int;//最後に確認した時間
		private static var _currentTime: int;//現在の時間
		private static var _inputInterval: int;//読み込みインターバル//ミリ秒

		public function SensorInfo()
		{
			super();
			_file = new File(Config.get("config", "kuraraySaijo", "sensor", "inputFile"));
			_csvLoader = new CSVLoader();
			_procKey = UIDUtil.createUID();;
			_currentTime = getTimer();
			_lastTime = 0;
			_inputInterval = int(Config.get("config", "kuraraySaijo", "sensor", "inputInterval"));
		}

		//制御
		public function PB_sensorCtrl(): void
		{
			var param: Object = PostBox.get("PB_sensorCtrl");
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

		//センサー情報読み込み更新処理
/*SA0002.csv
Dレジスタ, 列名, 名称, 備考
150	[PLC]D00000150	年	
151	[PLC]D00000151	月	
152	[PLC]D00000152	日	
153	[PLC]D00000153	時	
154	[PLC]D00000154	分	
155	[PLC]D00000155	秒	
156	[PLC]D00000156	曜日	
172	[PLC]D00000172	湿度	サイネージ”湿度”に表示[10]
173	[PLC]D00000173	温度	サイネージ”温度”に表示]11]
174	[PLC]D00000174	風速	サイネージ”風速”に表示[12]
175	[PLC]D00000175	予備	
179	[PLC]D00000179	温度ﾚﾍﾞﾙ	
180	[PLC]D00000180	風速ﾚﾍﾞﾙ	
182	[PLC]D00000182	事業所無災害連続日数	サイネージ”事業所無災害連続日数”に表示[16]
183	[PLC]D00000183	設技部無災害連続日数	サイネージ”設技部無災害連続日数”に表示[17]
*/
		private function _update(): void
		{
			//System.useCodePage = true;//SJIS
			var csv: Array = _csvLoader.load(_file);
			var i: int;
			var row: Array;
			var data: Object;
			if(csv == null) return;
			if(csv.length == 0) return;
			for(i = csv.length - 1; i >= 0; i--)
			{
				row = csv[i];
				if(row.length >= 6 )
				{
					data = {};
					data.humidity = Number(row[10]);//湿度
					data.temperature = Number(row[11]);//温度
					data.windSpeed = Number(row[12]);//風速
					data.recordAll = Number(row[16]);//事業所無災害連続日数
					data.recordDept = Number(row[17]);//設技部無災害連続日数
					data.WBGTLv = Number(row[14]);
					data.windLv = Number(row[15]);
					PostBox.send("sensor", {data: data});
					break;
				}
			}
		}
	}
}