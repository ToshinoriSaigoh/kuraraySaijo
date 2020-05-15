/*
レポートの同期通信処理

レポートファイル送信
PostBox.send("PB_shareReport", {type: "report", key: "20171006_1200000", data: bytes});

type: 他のクラスタデータと切り分けて使うための種別情報
report: レポートID



カレンダー関連
	PostBox.send("requestCalendar");

	<!-- カレンダー要求送信トリガー start -->
	<message name="requestCalendar">
		<step type="MSG" message="MSG_requestCalendar" description="カレンダー要求送信トリガー">
			<receiver path="model.app.network::Calendar"/>
		</step>
	</message>
	<!-- カレンダー要求送信トリガー start -->

	<!-- カレンダー要求受信 start -->
	<message name="CHANNEL_requestCalendar">
		<params>
			<param>header</param>
			<param>key</param>
			<param>value</param>
		</params>
		<step type="PB" message="PB_CHANNEL_requestCalendar" description="カレンダー要求メッセージ">
			<receiver path="model.app.network::Calendar"/>
		</step>
	</message>
	<!-- カレンダー要求受信 end -->

*/
package model.app.network
{
	import controller.documentroot.reportscreen.DrawContents;
	import model.plugin.draw.*;
	import model.plugin.report.*;
	import model.plugin.network.channel.*;
	import model.plugin.network.clusterdata.*;
	import model.plugin.network.clusterdata.data.*;
	import model.plugin.network.clusterdata.sender.*;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.net.FileFilter;
	import flash.utils.ByteArray;
	import flash.errors.IOError;

	public class ShareReport extends Plug
	{
		private var _currentOpenCalendar: String;//現在開こうとしているカレンダーのレポートID

		public function ShareReport()
		{
			super();
		}

		//レポート共有
		public function PB_shareReport(): void
		{
			_shareReport(PostBox.get("PB_shareReport"));
		}

		private function _shareReport(param: Object ): void
		{
			var targetList: Array = null;

			//タイプによって送信先を変更
			switch(param.type)
			{
				case "report":
					targetList = getReportTargetList();
					break;
				case "calendar":
					targetList = getCalendarTargetList();
					break;
			}

			//現在の状態を一時ディレクトリに保存
			if(targetList != null)
			{
				PostBox.send("flushBuffer", {buffer: "saveBuffer"});
				PostBox.send("saveTmpZip", {report: param.report}, complete);
			}

			function getReportTargetList(): Array
			{
				var list: Array;
				//オナーの場合はそのまま全員へ送信
				if(Channel.members.isOwner(Global.get("currentChannelName")))
				{
					list = ["@" + Global.get("currentChannelName")];
				}
				//オーナーではない場合、まずオーナーに送信
				else
				{
					//オーナーIDを取得
					var ownerID: String = Channel.members.getOwnerID(Global.get("currentChannelName"));
					if(ownerID != null) list = [ownerID + "@" + Global.get("currentChannelName")];
				}
				return list;
			}

			function getCalendarTargetList(): Array
			{
				return [param.page + "@" + Global.get("currentChannelName")];
			}

			function complete(): void
			{
				//バイナリデータで読み込み送信
				var zipFile: File = Lib.getSystemFileObject("tmp/" + param.report + ".zip");
				if(zipFile.exists)
				{
					_sendClusterData(param.report, targetList, _load(zipFile), {type: param.type, report: param.report});
				}
			}
		}

		//チャンネルイベント
		public function PB_CHANNEL_event(): void
		{
			var param: Object = PostBox.get("PB_CHANNEL_event");
			switch(param.type)
			{
				case Channel.EVENT_LOGIN_SUCCESSED:
					if(Channel.members.isOwner(Global.get("currentChannelName")) == false) MSG_requestCalendar();
					break;
			}
		}

		//カレンダー要求メッセージ送信
		public function MSG_requestCalendar(): void
		{
			var header: Object = Channel.createHeaderToOwner(Global.get("currentChannelName"));
			Channel.send(header, "requestCalendar", {});
		}

		//カレンダー要求受信
		public function PB_CHANNEL_requestCalendar(): void
		{
			var param: Object = PostBox.get("PB_CHANNEL_requestCalendar");

			var now: Date = new Date();
			_shareReport({type: "calendar", report: now.getFullYear(), page: param.header.senderID});
		}

		//クラスタ化データ送信
		private function _sendClusterData(stockKey: String, targetList: Array, bytes: ByteArray, option: Object): void
		{
			var inst: Object;
			inst = {};
			inst.action = "regist";
			inst.stockKey  = stockKey;
			inst.bytes = bytes;
			inst.separateBytes = ChannelManager.separateBytes;
			inst.option = option;
			ClusterDataSender.setInstruction(inst);

			inst = {};
			inst.action = "send";
			inst.sendType = SequentialMethod.TYPE;
			inst.stockKeyList = [stockKey];
			inst.targetList = targetList;
			inst.delayForTarget = ChannelManager.sendDataDelayTime;
			inst.delayForData = ChannelManager.sendDataDelayTime;
			ClusterDataSender.setInstruction(inst);
		}

		//クラスタ化データ受信
		public function PB_receivedClusterData(): void
		{
			var param: Object = PostBox.get("PB_receivedClusterData");
			var clusterData: ClusterData = param.data as ClusterData;
			var file: File;
			var dir: File;

			//共有レポート
			if(clusterData.option.type == "report")
			{
				file = Lib.getSystemFileObject("tmp/" + clusterData.option.report + ".zip");
				_save(file, clusterData.getByteArray());
				PostBox.send("loadTmpZip", {fileName: clusterData.option.report, mode: null, type: clusterData.option.type});

				//オーナーは全員に送信
				if(Channel.members.isOwner(Global.get("currentChannelName")))
				{
					_sendClusterData(
						clusterData.option.report,
						["@" + Global.get("currentChannelName")],
						clusterData.getByteArray(),
						clusterData.option
					);
				}
			}
			//カレンダー
			else if(clusterData.option.type == "calendar")
			{
				file = Lib.getSystemFileObject("tmp/" + clusterData.option.report + ".zip");
				_save(file, clusterData.getByteArray());

				//現在開いているカレンダーがある場合、閉じてから開く
				//開いている場合は、閉じる過程でディレクトリが削除される
				//開いていない場合は、ディレクトリだけが残っている場合があるかもしれないので
				//カレンダーディレクトリがある場合は削除してから開く
				if(ReportUtils.isOpendReport(clusterData.option.report))
				{
					PostBox.send("closeReport", {report: clusterData.option.report});
					_currentOpenCalendar = clusterData.option.report;
trace("■■■■■■■■closeReport calendar3", clusterData.option.report);
				}
				else
				{
					dir = Lib.getSystemFileObject("calendar/" + clusterData.option.report);//m2okカレンダーディレクトリを指定する方法を共通化したい
					if(dir.exists)
					{
						dir.deleteDirectory(true);
					}
					PostBox.send("loadTmpZip", {fileName: _currentOpenCalendar, mode: null, type: "calendar"});
				}
			}
		}

		//レポート削除後にレポート切り替え
		public function PB_deleteCompleteReport(): void
		{
			var param: Object = PostBox.get("PB_deleteCompleteReport");
			if(param.report == _currentOpenCalendar)
			{
				PostBox.send("loadTmpZip", {fileName: _currentOpenCalendar, mode: null, type: "calendar"});
				_currentOpenCalendar = null;
			}
		}

		private function _load(file: File): ByteArray
		{
			var stream: FileStream = new FileStream();
			var bytes: ByteArray = new ByteArray();
			try
			{
				stream.open(file, FileMode.READ);
				stream.position = 0;
				stream.readBytes(bytes, 0, 0);
				stream.close();
			}
			catch(ioError: IOError){}
			catch(securityError: SecurityError){}
			return bytes;
		}

		private function _save(file: File, bytes: ByteArray): void
		{
			var stream: FileStream = new FileStream();
			try
			{
				stream.open(file, FileMode.WRITE);
				stream.writeBytes(bytes);
				stream.close();
			}
			catch(ioError: IOError){}
			catch(securityError: SecurityError){}
		}
	}
}