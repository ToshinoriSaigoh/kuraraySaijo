package model.plugin.clock
{
	import common.EnterFrameProccess;
	import flash.utils.getTimer;
	import flash.events.Event;
	import mx.utils.UIDUtil;

	public class Clock extends Plug
	{
		private static const ONE_SECOND: uint = 1000;
		private static var _procKey: String;
		private static var _date: Date;
		private static var _startDate: Date;
		private static var _startTime: int;
		private static var _lastTime: int;
		private static var _currentTime: int;
		private static var _waitTime: int;

		public function Clock()
		{
			super();
			_procKey = UIDUtil.createUID();;
			_date = new Date();
			_startDate = new Date();
			_startTime = _lastTime = _currentTime = getTimer();
			_waitTime = ONE_SECOND;
		}

		//リセット処理
		private static function update(): void
		{
			if(_date != null || _startDate != null)
			{
				//_date.setTime(_startDate.getTime() + (getTimer() - _startTime));
				_date = new Date();
			}
		}

		public static function get current(): Date
		{
			update();
			return _date;
		}

		//時計動作開始
		//App.asで停止中//2023.03.01
		public function PB_clockCtrl(): void
		{
			var param: Object = PostBox.get("PB_clockCtrl");
			switch(param.command)
			{
				case "start":
					EnterFrameProccess.start(_procKey, enterFrameHandler);//エンターフレームで動作するプロセスをクラスで管理する
					break;
				case "stop":
					EnterFrameProccess.stop(_procKey);
					break;
			}
		}
		//エンターフレームでローカルタイムを取得して時計更新
		//App.asで停止中//2023.03.01
		private function enterFrameHandler(e: Event): void
		{
			_currentTime = getTimer();
			if(_currentTime - _lastTime >= _waitTime)
			{
				_waitTime = ONE_SECOND - current.milliseconds;
				PostBox.send("clock", {date: current});
				_lastTime = _currentTime;
			}
		}
		//時計をcsvで更新//2023.03.01
		public function PB_clockUpdate(): void
		{
			var param: Object = PostBox.get("PB_clockUpdate");
			updateClock(param.datetime);
		}
		//時計を指定時間に更新する
		public function updateClock(currentTime: Date): void
		{
			PostBox.send("clock", {date: currentTime});
		}
	}
}