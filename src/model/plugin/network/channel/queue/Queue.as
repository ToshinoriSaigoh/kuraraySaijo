/*
	送信受信バッファ
*/
package model.plugin.network.channel.queue
{
	import common.EnterFrameProccess;
	import flash.events.Event;
	import flash.utils.getTimer;
	public class Queue
	{
		private var _oneByeOne: Boolean;
		private var _name: String;
		private var _queue: Array;
		private var _dequeueFunction: Function;
		private var _interval: int;//処理間隔
		private var _lastProcTime: int;//最終処理時間

		//コンストラクタ
		public function Queue(name: String, dequeueFunction: Function, interval: int = 0, oneByeOne: Boolean = true)
		{
			_oneByeOne = oneByeOne;
			_name = name;
			_interval = interval;
			_dequeueFunction = dequeueFunction;
			clear();
		}

		public function set interval( value: int): void
		{
			_interval = value;
		}

		public function enqueue(header: Object, key: String, value: Object): void
		{
			_queue.push({header: header, key: key, value: value});
		}

		public function dequeue(): Object
		{
			var message: Object;
			if(_queue.length > 0)
			{
				message = _queue.shift();
			}
			return message;
		}

		public function start(): void
		{
			if(_oneByeOne)
			{
				EnterFrameProccess.start(_name, _proc);
			}
			else
			{
				EnterFrameProccess.start(_name, _procFlush);
			}
		}

		public function pause(): void
		{
			EnterFrameProccess.stop(_name);
		}
//private var _debugLog: Array = [];
		public function flush(): void
		{
//
// if(_name == "channelSenderQueue")
// {
// 	var date: Date = new Date();
// 	_debugLog.push(date.getTime() + "\t" + _queue.length);
// 	if(_debugLog.length >= 10)
// 	{
// 		Debug.save(_debugLog.join("\n"));
// 		_debugLog = [];
// 	}
// }
//
			var message: Object = dequeue();
			while(message != null)
			{
				_dequeueFunction.call(null, message.header, message.key, message.value);
				message = dequeue();
			}
		}

		public function _proc(e: Event): void
		{
			var message: Object;
			if(_queue.length > 0)
			{
				if(getTimer() - _lastProcTime >= _interval)
				{
					_lastProcTime = getTimer();
					message = dequeue();
					_dequeueFunction.call(null, message.header, message.key, message.value);
				}
			}
		}

		public function _procFlush(e: Event): void
		{
			if(_queue.length > 0)
			{
				if(getTimer() - _lastProcTime >= _interval)
				{
					_lastProcTime = getTimer();
					flush();
				}
			}
		}

		public function clear(): void
		{
			_queue = [];
		}
	}
}
