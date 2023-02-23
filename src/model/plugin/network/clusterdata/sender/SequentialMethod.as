package model.plugin.network.clusterdata.sender
{
	import model.plugin.network.clusterdata.data.ClusterData;
	import flash.utils.getTimer;

	public class SequentialMethod extends SendMethod
	{
		public static const TYPE: String = "SequentialMethod";

		public static const STATUS_SEND: String = "send";
		public static const STATUS_WAIT: String = "wait";

		private var _sendLastTime: int;
		private var _waitTime: int;
		private var _status: String;
		private var _targetIndex: uint;
		private var _dataIndex: uint;
		private var _clusterIndex: uint;

		//コンストラクタ
		public function SequentialMethod()
		{
			super();
		}

		//データリセット
		override public function reset(): void
		{
			super.reset();
			_sendLastTime   = 0;
			_waitTime       = 0;
			_status         = STATUS_WAIT;
			_targetIndex    = 0;
			_dataIndex      = 0;
			_clusterIndex   = 0;
		}

		//送信用 ENTER FRAME ハンドラ
		override public function run(): void
		{
			var now: int = getTimer();
			if(completeFlag) return;
			if(_status == STATUS_SEND)
			{
				_sendLastTime = now;
				_sendData();
			}
			else if(_status == STATUS_WAIT)
			{
				if(now - _sendLastTime > _waitTime)
				{
					_sendLastTime = 0;
					_status = STATUS_SEND;
				}
			}
		}

		//送信
		private function _sendData(): void
		{
			var target: String;
			var clusterDataMessage: Object;
			var clusterData: ClusterData;
			var targetEndFlag: Boolean;

			target = sendTargetList[_targetIndex];

			targetEndFlag = false;

			clusterDataMessage = null;
			while(clusterDataMessage == null && targetEndFlag == false)
			{
				if(sendDataList.length > _dataIndex)
				{
					//クラスタデータ取得
					clusterData = sendDataList[_dataIndex]
					if(clusterData.length > _clusterIndex)
					{
						clusterDataMessage = clusterData.createPartsData(_clusterIndex);
						_clusterIndex++;
					}
					else
					{
						_clusterIndex = 0;
						_dataIndex++;
					}
				}
				else
				{
					targetEndFlag = true;
				}
			}

			if(clusterDataMessage != null)
			{
				_waitTime = delayForData;
				send(target, clusterDataMessage);
			}

			if(targetEndFlag)
			{
				sendTargetComplete(target);

				_waitTime = delayForTarget;
				_targetIndex++;
				_clusterIndex = 0;
				_dataIndex = 0;
				if(sendTargetList.length <= _targetIndex)
				{
					completeFlag = true;
				}
			}

			_status = STATUS_WAIT;
		}
	}
}

