package model.plugin.network.clusterdata.sender
{
	import model.plugin.network.clusterdata.data.ClusterData;
	import flash.utils.getTimer;

	public class RegularIntervalsMethod extends SendMethod
	{
		public static const TYPE: String = "RegularIntervalsMethod";

		private var _targetStartLastTime: int;
		private var _targetIndex: uint;
		private var _targetSendData: Object;//送信対象送信情報

		//コンストラクタ
		public function RegularIntervalsMethod()
		{
			super();
		}

		//データリセット
		override public function reset(): void
		{
			super.reset();
			_targetStartLastTime = 0;
			_targetIndex = 0;
			_targetSendData = {};
		}

		//送信用 ENTER FRAME ハンドラ
		override public function run(): void
		{
			var i: uint;
			var now: int;
			var target: String;
			var endFlag: Boolean;

			now = getTimer();

			//送信対象端末への送信遅延
			if(sendTargetList.length > _targetIndex)
			{
				if(now - _targetStartLastTime > delayForTarget)
				{
					_targetStartLastTime = now;
					target = sendTargetList[_targetIndex];
					_createTargetData(target);
					_targetIndex++;
				}
			}

			//データ送信遅延
			for(target in _targetSendData)
			{
				_runForTarget(target, now);
			}

			//終了判定
			endFlag = true;
			for(i = 0; i < sendTargetList.length; i++)
			{
				target = sendTargetList[i];
				if(_targetSendData.hasOwnProperty(target))
				{
					endFlag = endFlag && _targetSendData[target].endFlag;
				}
				else
				{
					endFlag = false;
					break;
				}
			}
			if(endFlag)
			{
				completeFlag = true;
			}
		}

		//送信対象別送信データ作成
		private function _createTargetData(target: String): void
		{
			var targetData: Object;

			if(_targetSendData == null) _targetSendData = new Object();

			targetData                 = new Object();
			targetData.lastSendTime    = 0;
			targetData.dataIndex       = 0;
			targetData.clusterIndex    = 0;
			targetData.endFlag         = false;

			_targetSendData[target] = targetData;
		}

		//送信用 ENTER FRAME ハンドラ
		private function _runForTarget(target: String, now: int): void
		{
			var targetData: Object;
			var clusterData: ClusterData;
			var clusterDataMessage: Object;

			targetData = _targetSendData[target];
			if(targetData == null) return;
			if(targetData.endFlag) return;

			//データ送信間隔が過ぎていたら送信
			if(now - targetData.lastSendTime > delayForData)
			{
				targetData.lastSendTime = now;

				//送信データを探して送信
				//終了した場合はendFlagをtrueに設定
				clusterDataMessage = null;
				while(clusterDataMessage == null && targetData.endFlag == false)
				{
					if(sendDataList.length > targetData.dataIndex)
					{
						//クラスタデータ取得
						clusterData = sendDataList[targetData.dataIndex];
						if(clusterData.length > targetData.clusterIndex)
						{
							clusterDataMessage = clusterData.createPartsData(targetData.clusterIndex);
							targetData.clusterIndex++;
						}
						else
						{
							targetData.clusterIndex = 0;
							targetData.dataIndex++;
						}
					}
					else
					{
						sendTargetComplete(target);
						targetData.endFlag = true;
					}
				}

				if(clusterDataMessage != null)
				{
					send(target, clusterDataMessage);
				}
			}
		}
	}
}
