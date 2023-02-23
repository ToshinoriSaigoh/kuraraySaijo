package common
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class TimerUtils
	{
		//遅延実行
		public static function delay(delay: uint, fnc: Function): void
		{
			var delayTimer: Timer = new Timer(delay, 1);
			delayTimer.addEventListener(TimerEvent.TIMER_COMPLETE, delayTimerHandler);
			delayTimer.start();
			function delayTimerHandler(e: TimerEvent): void
			{
				if(fnc != null)
				{
					fnc.call();
				}
			}
		}

		//遅延実行
		public static function delayWithOption(delay: uint, fnc: Function, param: Object = null): void
		{
			var delayTimer: Timer = new Timer(delay, 1);
			delayTimer.addEventListener(TimerEvent.TIMER_COMPLETE, delayTimerHandler);
			delayTimer.start();
			function delayTimerHandler(e: TimerEvent): void
			{
				if(fnc != null)
				{
					fnc.call(null, param);
				}
			}
		}

		//遅延指定回数実行
		public static function delayNumberOfTimes(delay: uint, time: uint, fnc: Function, param: Object = null): void
		{
			var counter: uint;
			var delayTimer: Timer;

			if(fnc != null)
			{
				counter = 0;
				delayTimer = new Timer(delay, time);
				delayTimer.addEventListener(TimerEvent.TIMER, delayTimerHandler);
				delayTimer.start();
			}

			function delayTimerHandler(e: TimerEvent): void
			{
				fnc.call(null, counter, param);
				counter++;
			}
		}
	}
}