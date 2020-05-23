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
				if(row.length >= 6 )
				{
					data = {};
					data.temperature = Number(row[3]) / 10;//温度
					data.humidity = Number(row[4]) / 10;//湿度
					data.windSpeed = Number(row[5]) / 10;//風速
					PostBox.send("sensor", {data: data});
					break;
				}
			}
		}
	}
}