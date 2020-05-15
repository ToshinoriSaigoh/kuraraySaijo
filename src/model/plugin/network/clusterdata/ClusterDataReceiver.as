/*
	概要

		このクラスは ClusterDataSender によって送られてくる断片的な ByteArray データを受け取る

		尚、このクラスは Channelクラスに依存している。
		送受信を行うクラスなので、通信リソースは端末につき１つのリソースと考え、static 指定にしている。

	使い方

		まずプラグインとして new してから使用する。
		new するときに、通信メッセージを識別するkeyを指定する。

		message.xml にデータ受信の記述を行う

	<!-- 分割データ受信 start -->
	<message name="CHANNEL_clusterDataMessage">
		<params>
			<param>header</param>
			<param>key</param>
			<param>value</param>
		</params>
		<step type="PB" message="PB_CHANNEL_clusterDataMessage" description="ClusterDataReceiverプラグイン通信用メッセージ">
			<receiver path="model.plugin.network.clusterdata::ClusterDataReceiver"/>
		</step>
	</message>
	<message name="receivedClusterData">
		<params>
			<param>event</param>
		</params>
		<step type="PB" message="PB_receivedClusterData" description="ClusterDataReceiverプラグインから発行されるメッセージ">
			<receiver path="controller.documentroot::InitScreen"/>
		</step>
	</message>
	<!-- 分割データ受信 end -->
*/
package model.plugin.network.clusterdata
{
	import common.ObjectUtils;
	import model.plugin.network.clusterdata.data.*;

	public class ClusterDataReceiver extends Plug
	{
		public static var COMPLETE_EVENT: String = "complete"

		private static var _messageKey: String;
		private static var _stock: ClusterDataStock;

		//コンストラクタ
		public function ClusterDataReceiver()
		{
			super();
			_stock = new ClusterDataStock();
		}

		//データリセット
		public static function dispose(): void
		{
			if(_stock != null) _stock.reset();
		}

		//データ受信
		public function PB_CHANNEL_clusterDataMessage(): void
		{
			var param: Object = PostBox.get("PB_CHANNEL_clusterDataMessage");
			if(param.value.hasOwnProperty("command") == false) return;
			switch(param.value.command)
			{
				case Command.START:
					break;
				case Command.CANCEL:
					break;
				case Command.CLUSTER_DATA:
					_receiveClusterData(param.value);
					break;
				case Command.TARGET_COMPLETE:
					break;
				case Command.ALL_COMPLETE:
					break;
			}
		}

		//クラスタ化したデータ受信
		private static function _receiveClusterData(message: Object): void
		{
			var clusterData: ClusterData;
			var comparets: Date;
			if(ClusterData.validPartsData(message.clusterData) == false) return;

			//既存データが存在しているかどうか確認
			clusterData = _stock.getClusterData(message.clusterData.dataID);

			//存在しない場合は作成する
			if(clusterData == null)
			{
				clusterData = new ClusterData();
				_stock.setClusterData(message.clusterData.dataID, clusterData);
			}
			else
			{
				//同じキーで通信で飛んできたデータのタイムスタンプが新しければ作成
				comparets = new Date(Number(message.clusterData.timestamp));
				if(clusterData.timestamp != null)
				{
					if(compareDate(clusterData.timestamp, comparets) == 1)
					{
						clusterData = new ClusterData();
						_stock.setClusterData(message.clusterData.dataID, clusterData);
					}
				}
			}

			//データ設定・終了判定
			var completed: Boolean = clusterData.isComplete();
			clusterData.receivePartsData(message.clusterData)
			if(completed == false && clusterData.isComplete())
			{
				PostBox.send("receivedClusterData", {data: clusterData});
			}
		}

		//日付比較 a < b の場合 1 を返す
		public static function compareDate(a: Date, b: Date): int
		{
			if(a == null && b != null) return 1;
			if(a != null && b == null) return -1;
			if(a == null && b == null) return 0;
			if(a.getTime() < b.getTime()) return 1;
			if(a.getTime() > b.getTime()) return -1;
			return 0;
		}

		//ストック設定
		public static function getClusterData(key: String): ClusterData
		{
			return _stock.getClusterData(key);
		}
	}
}

