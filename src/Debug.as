package
{
	import common.*;
	import common.keyboard.*;
	import controller.App;
	import flash.ui.Keyboard;

	public class Debug
	{
		private var _kbChecker: KeyboardChecker;

		private static var _startDateString: String;
		private static var _count: uint;

		//コンストラクタ
		public function Debug()
		{
			super();
			init();
		}

		public function init(): void
		{
			var keys: Array;

			_count = 0;
			_startDateString = DateUtils.dateToString(new Date());

			_kbChecker = new KeyboardChecker();
			_kbChecker.init(App.mainStage);

			//CTRL+T:
			keys = [];
			keys.push(Keyboard.CONTROL);
			keys.push(Keyboard.T);
			_kbChecker.addFunction(keys, testRun);
		}

		private function testRun(): void
		{
			PostBox.send("clock", {date: new Date()});
		}

		private function requestSensor(): void
		{
			PostBox.send("sensorCtrl", {command:"request"});
		}
	}
}