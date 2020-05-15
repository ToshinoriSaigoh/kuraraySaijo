package model.plugin.network.channel
{
	import common.ObjectUtils;
	import model.plugin.network.channel.queue.Queue;

	public class MessageQueue
	{
		private var _sendQueue: Queue;//送信キュー
		private var _receiveQueue: Queue;//受信キュー
		private var _receiveQueueActiveFlag: Boolean;//受信キューアクティブフラグ

		//コンストラクタ
		public function MessageQueue()
		{
			_sendQueue = new Queue("channelSenderQueue", Channel.sendToDriver, 0, false);
			_receiveQueue = new Queue("channelReceiverQueue", Channel.receiveToMainChannel, 0, false);
			_receiveQueueActiveFlag = false;

			//初期状態キュー有効化
			startSendQueue();
			startReceiveQueue();
		}

		//送信（コントローラ→ドライバ）
		public function send(header: Object, key: String, value: Object): void
		{
			var i: uint;
			var targetList: Array = ChannelTarget.stringToList(header.target);
			var chList: Array = [];
			var chNames: Object = {};
			var cloneHeader: Object;
			for(i = 0; i < targetList.length; i++)
			{
				if(Channel.isExists(targetList[i].channelName) && chNames.hasOwnProperty(targetList[i].channelName) == false )
				{
					chNames[targetList[i].channelName] = 1;
					chList.push(targetList[i].channelName);
				}
			}
			for(i = 0; i < chList.length; i++)
			{
				cloneHeader = ObjectUtils.clone(header);
				cloneHeader.targetDriver = chList[i];
				_sendQueue.enqueue(cloneHeader, key, value);
			}
		}

		//受信（ドライバ→コントローラ）
		public function receive(header: Object, key: String, value: Object): void
		{
			if(_receiveQueueActiveFlag)
			{
				Channel.receiveToMainChannel(header, key, value);
			}
			else
			{
				_receiveQueue.enqueue(header, key, value);
			}
		}

		//キューインターバル設定
		public function set sendQueueInterval(value: int): void
		{
			_sendQueue.interval = value;
		}

		//キューインターバル設定
		public function set receiveQueueInterval(value: int): void
		{
			_receiveQueue.interval = value;
		}

		//送信キュー処理開始
		public function startSendQueue(): void
		{
			_sendQueue.start();
		}

		//送信キュー処理一時停止
		public function pauseSendQueue(): void
		{
			_sendQueue.pause();
		}

		//受信キュー処理開始
		public function startReceiveQueue(): void
		{
			_receiveQueueActiveFlag = true;
			_receiveQueue.flush();
			_receiveQueue.start();
		}

		//受信キュー処理一時停止
		public function pauseReceiveQueue(): void
		{
			_receiveQueueActiveFlag = false;
			_receiveQueue.pause();
		}

		//キューのクリア
		public function clear(): void
		{
			_sendQueue.clear();
			_receiveQueue.clear();
		}
	}
}