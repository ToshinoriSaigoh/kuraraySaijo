package model.plugin.network.clusterdata.sender
{
	import flash.utils.getTimer;

	public class SendMethod
	{
		private var _sendIndex: uint;//送信データインデックス
		private var _completeFlag: Boolean;//送信対象
		private var _sendDataList: Array;//送信データリスト
		private var _sendTargetList: Array;//送信先リスト
		private var _dataSendFunction: Function;//送信関数
		private var _targetCompleteFunction: Function;//一つの対象への送信完了関数

		protected var delayForTarget: uint;//送信対象毎の遅延時間(ミリ秒)
		protected var delayForData: uint;//１クラスタデータ送信遅延(ミリ秒)

		//コンストラクタ
		public function SendMethod()
		{
			reset();
		}

		//リセット処理
		public function reset(): void
		{
			_sendIndex = 0;
			_completeFlag = false;
			_sendDataList = null;
			_sendTargetList = null;

			delayForTarget = 0;
			delayForData = 0;
			_dataSendFunction = null;
			_targetCompleteFunction = null;
		}

		//後始末処理
		public function dispose(): void
		{
			reset();
		}

		//送信中かどうかの判定
		public function set completeFlag(value: Boolean): void
		{
			_completeFlag = value;
		}

		//送信中かどうかの判定
		public function get completeFlag(): Boolean
		{
			return _completeFlag;
		}

		protected function get sendDataList(): Array
		{
			return _sendDataList;
		}

		public function get sendTargetList(): Array
		{
			return _sendTargetList;
		}

		public function get allTarget(): String
		{
			return _sendTargetList.join(",");
		}

		protected function send(target: String, clusterDataMessage: Object): void
		{
			if(_dataSendFunction != null)
			{
				_dataSendFunction.call(null, target, clusterDataMessage);
			}
		}

		protected function sendTargetComplete(target: String): void
		{
			var i: uint;
			var dataIDList: Array;
			if(_targetCompleteFunction != null)
			{
				dataIDList = [];
				for(i = 0; i < _sendDataList.length; i++)
				{
					dataIDList.push(_sendDataList[i].dataID);
				}
				_targetCompleteFunction.call(null, target, dataIDList);
			}
		}

		//初期化
		public function init(dataList: Array, targetList: Array, dft: uint, dfd: uint, sendFunction: Function, targetCompleteFunction: Function): Boolean
		{
			reset();
			if(dataList == null) return false;
			if(dataList.length  == 0) return false;
			if(targetList == null) return false;
			if(targetList.length  == 0) return false;

			_sendDataList = dataList;
			_sendTargetList = targetList;
			delayForTarget = dft;
			delayForData = dfd;
			_dataSendFunction = sendFunction;
			_targetCompleteFunction = targetCompleteFunction;

			return true;
		}

		//送信処理
		public function run(): void {}
	}
}
