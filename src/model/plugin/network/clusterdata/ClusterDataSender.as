/*
	概要

		ファイルサイズの大きいデータを無線通信で行う際
		送信スピードなどを調整する必要が出てきた。
		このクラスはByteArrayで渡されるデータを分割して小出しに送る事を目的としている。
		受信側では、 ClusterDataReceiver を宣言して使用する。詳しくは、 ClusterDataReceiver を参照

		尚、このクラスは Channelクラスに依存している。
		送受信を行うクラスなので、通信リソースは端末につき１つのリソースと考え、static 指定にしている。

	使い方

		まずプラグインとして new してから使用する。
		次に送信処理の開始・停止など、基本的に命令(instruction)を発行して動かす形式にしている。
		送信データは一度倉庫(stock)に蓄えられ、IDが振られる。
		指定したIDを送信する仕組み

	命令の方法

		命令は Obuect型 で与える

		ClusterDataSender.setInstruction(inst: Object);

		inst.action
		inst.**(その他パラメータ)

	命令の種類(inst.action)

		"start","stop","regist","remove","send","cancel","resetStock"

	各命令のパラメータ

		"regist"の場合
			inst.stockKey (String) 倉庫に登録するためのキーを指定する
			inst.bytes (ByteArray) 元データのByteArrayを指定
			inst.separateBytes (uint) 分割Byteサイズを指定
			inst.option (Object) データの情報を格納（この情報は通信で毎回送られるので小さいデータとすること）

		"remove"の場合
			inst.stockKey (String) 倉庫に登録するためのキーを指定する

		"send"の場合
			inst.sendType (String: SequentialMethod.TYPE or RegularIntervalsMethod.TYPE)
			inst.stockKeyList (Array) 倉庫に登録するためのキーを複数を指定できる
			inst.targetList (Array) 送信先対象
				※Channelのtargetに複数指定する場合は、この中に個別に指定した target を Arrayに格納する
				例えば、ch1 と ch2 に送りたい場合は["@ch1","@ch2"]というようにする。
				["@ch1,@ch2"]とした場合は、Channelの送信間隔でデータが送信される
			inst.delayForTarget (uint) データ送信時に、送信先対象へ切り替え時間差の指定 msec ※ただしEnterFrameに依存
			inst.delayForData (uint) データ送信時に１つ１つのクラスタ化されたデータの送信間隔 msec ※ただしEnterFrameに依存
*/
package model.plugin.network.clusterdata
{
	import common.ObjectUtils;
	import common.EnterFrameProccess;
	import model.plugin.network.channel.Channel;
	import model.plugin.network.clusterdata.data.*;
	import model.plugin.network.clusterdata.sender.*;

	import flash.events.Event;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	import flash.utils.getTimer;
	import mx.utils.UIDUtil;

	public class ClusterDataSender extends Plug
	{
		private static var _procKey: String;
		private static var _workLastTime: int;//作業実行最終時間
		private static var _stock: ClusterDataStock;
		private static var _sendingFlag: Boolean;//送信中フラグ
		private static var _cancelFlag: Boolean;//送信中フラグ
		private static var _sendMethod: SendMethod;//送信方法
		private static var _sendInstructionQueue: Array;//送信命令書キュー

		public function ClusterDataSender()
		{
			super();
			_procKey = UIDUtil.createUID();
			_stock = new ClusterDataStock();
			_workLastTime = 0;
			_sendingFlag = false;
			_sendInstructionQueue = [];
		}

		//後始末処理
		public static function dispose(): void
		{
			if(_procKey != null) EnterFrameProccess.stop(_procKey);
			if(_stock != null) _stock.reset();
		}

		//命令セット
		public static function setInstruction(inst: Object): void
		{
			if(_procKey == null) return;
			if(inst != null)
			{
				if(ObjectUtils.hasOwnPropertyCheck(inst, "action") == false) return;
				switch(inst.action)
				{
					case "start":
						EnterFrameProccess.start(_procKey, _enterFrameHandler);
						break;
					case "stop":
						EnterFrameProccess.stop(_procKey);
						break;
					case "regist":
						_stock.regist(inst.stockKey, inst.bytes as ByteArray, inst.option, inst.separateBytes);
						break;
					case "remove":
						_stock.remove(inst.stockKey);
						break;
					case "send":
						_sendInstructionQueue.push(ObjectUtils.clone(inst));
						break;
					case "cancel":
						_cancelInstruction();
						break;
					case "resetStock":
						_stock.reset();
						break;
				}
			}
		}

		//キーリスト
		public static function get stockKeyList(): Array
		{
			return _stock.keyList;
		}

		//送信用 ENTER FRAME ハンドラ
		private static function _enterFrameHandler(e: Event): void
		{
			//送信開始トリガー
			if(_sendingFlag == false && _sendInstructionQueue.length > 0) _setSendInstruction();

			//送信処理
			if(_sendingFlag)
			{
				//キャンセル通信
				if(_cancelFlag)
				{
					_sendCancelMessage(_sendMethod.allTarget);
					_stopSending();
					return;
				}

				//送信処理
				if(_sendMethod != null)
				{
					_sendMethod.run();

					//送信完了
					if(_sendMethod.completeFlag)
					{
						_sendAllCompleteMessage(_sendMethod.allTarget);
						_stopSending();
					}
				}
			}
		}

		//送信開始処理
		private static function _setSendInstruction(): void
		{
			var sendDataList: Array;
			var inst: Object;

			inst = _sendInstructionQueue.shift();

			//送信データリストを作成
			sendDataList = _createSendDataList(inst.stockKeyList);
			if(sendDataList != null)
			{
				_cancelFlag = false;
				_sendMethod = _createMethod(inst.sendType);
				if(_sendMethod != null)
				{
					if(_sendMethod.init(sendDataList, inst.targetList, inst.delayForTarget, inst.delayForData, _sendClusterDataMessage, _sendTargetCompleteMessage))
					{
						_sendingFlag = true;
						_sendStartMessage(_sendMethod.allTarget);
					}
				}
			}
		}

		//送信データリストを作成
		private static function _createSendDataList(keyList: Array): Array
		{
			var list: Array = [];
			var i: uint;
			for(i = 0; i < keyList.length; i++)
			{
				list.push(_stock.getClusterData(keyList[i]));
			}
			return list;
		}

		//送信方法作成
		private static function _createMethod(type: String): SendMethod
		{
			var res: SendMethod = null;
			switch(type)
			{
				case RegularIntervalsMethod.TYPE:
					res = new RegularIntervalsMethod();
					break;
				case SequentialMethod.TYPE:
					res = new SequentialMethod();
					break;
			}
			return res;
		}

		//送信キャンセル命令
		private static function _cancelInstruction(): void
		{
			_cancelFlag = true;
		}

		//送信の停止
		private static function _stopSending(): void
		{
			_sendingFlag = false;
			_sendMethod = null;
		}

		//ファイル送信開始通知
		private static function _sendStartMessage(target: String): void
		{
			var header: Object = Channel.createHeader(target);
			var value: Object = {};
			value.command = Command.START;
			value.fileNum = _sendMethod.sendTargetList.length;
			Channel.send(header, ClusterDataCommon.MESSAGE_KEY, value);
		}

		//ファイル送信キャンセル通知
		private static function _sendCancelMessage(target: String): void
		{
			var header: Object = Channel.createHeader(target);
			var value: Object = {};
			value.command = Command.CANCEL;
			Channel.send(header, ClusterDataCommon.MESSAGE_KEY, value);
		}

		//ファイルデータ送信
		private static function _sendClusterDataMessage(target: String, clusterDataMessage: Object): void
		{
			var header: Object = Channel.createHeader(target);
			var value: Object = {};
			value.clusterData = clusterDataMessage;
			value.command = Command.CLUSTER_DATA;
			Channel.send(header, ClusterDataCommon.MESSAGE_KEY, value);
		}

		//対象毎の送信完了通知
		private static function _sendTargetCompleteMessage(target: String, dataIDList: Array): void
		{
			var header: Object = Channel.createHeader(target);
			var value: Object = {};
			value.command = Command.TARGET_COMPLETE;
			value.dataIDList = dataIDList;
			Channel.send(header, ClusterDataCommon.MESSAGE_KEY, value);
		}

		//ファイル送信完了通知
		private static function _sendAllCompleteMessage(target: String): void
		{
			var header: Object = Channel.createHeader(target);
			var value: Object = {};
			value.command = Command.ALL_COMPLETE;
			Channel.send(header, ClusterDataCommon.MESSAGE_KEY, value);
		}
	}
}