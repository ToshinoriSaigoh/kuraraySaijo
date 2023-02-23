/*
チャンネルの概念

・チャンネルには１人必ずオーナーが存在する
・チャンネル内の自分自身を表すid(myID)がプラグイン作成時と同時に作成される
・チャンネルで宛先を指定する場合は id@チャンネル名で指定できる

■ヘッダーはオブジェクト型 target パラメータを持つ
　経路情報などの付加情報を付けられるようにする

var header: Object = Channel.createHeader(target);
var value: Object = {};
Channel.send(header, "KEY", value);

■メッセージ構造はオブジェクト型に変換した形は以下の通り

var data: Object = {};
data.header = {taraget: "", senderID: _myID};
data.key    = "";
data.value  = value;

■open
name: チャンネル名(String)
config: チャンネル設定(Object)
	type: チャンネル種別(String)
	その他: 種別毎の設定
owner: オーナーメンバーID(String)


■チャンネルイベント通知

	<!-- チャンネルイベント start -->
	<message name="CHANNEL_event">
		<params>
			<param>channelName</param>
			<param>type</param>
			<param>data</param>
		</params>
		<step type="PB" message="PB_CHANNEL_event" description="チャンネルイベント">
			<receiver path="controller.documentroot::InitScreen"/>
		</step>
	</message>
	<!-- チャンネルイベント end -->

■チャンネルメッセージ受け取り

	<!-- テストデータ受信 start -->
	<message name="CHANNEL_testMessge">
		<params>
			<param>header</param>
			<param>key</param>
			<param>value</param>
		</params>
		<step type="PB" message="PB_CHANNEL_testMessge" description="テスト通信用メッセージ">
			<receiver path="controller.documentroot::InitScreen"/>
		</step>
	</message>
	<!-- テストデータ受信 end -->


*/
package model.plugin.network.channel
{
	import common.device.IPAddress;
	import model.plugin.network.channel.member.*;
	import model.plugin.network.channel.driver.rtmfpsmallgroup.RTMFPSmallGroupDriver;

	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.utils.ByteArray;
	import flash.errors.IOError;
	import flash.system.Worker;
	import flash.system.WorkerDomain;
	import flash.system.WorkerState;
	import flash.system.MessageChannel;
	import mx.utils.UIDUtil;

	public class Channel
	{
		public static var EVENT_OPEN: String                = "open";
		public static var EVENT_CLOSE: String               = "close";
		public static var EVENT_LOGIN_SUCCESSED: String     = "loginSuccessed";
		public static var EVENT_LOGIN_FAILED: String        = "loginFailed";
		public static var EVENT_OWNER_LOST: String          = "ownerLost";
		public static var EVENT_ADD_MEMBER: String          = "addMember";
		public static var EVENT_ERROR: String               = "error";

		public static var ERROR_OTHER_OWNER_LOGINED: String    = "other owner logined";

		private static var _subWorker: Worker;
		private static var _msgChFromMain: MessageChannel;
		private static var _msgChFromSub: MessageChannel;

		private static var _myID: String = null;
		private static var _myName: String = null;
		private static var _myIP: String = null;
		private static var _drivers: Object = null;
		private static var _members: MemberManager;//メンバー管理
		private static var _messageQueue: MessageQueue;//メンバー管理

		//コンストラクタ
		public function Channel()
		{
			super();

			//メンバー情報はメインとサブでそれぞれ生成し、MessageChannelにより共有
			_members = new MemberManager(!Worker.current.isPrimordial);

			if(Worker.current.isPrimordial)
			{
				_initMain();
			}
			else
			{
				_initSub();
			}
		}

		//メインワーカー初期化
		private static function _initMain(): void
		{
			//サブワーカーswf読み込み
			var file: File = File.applicationDirectory.resolvePath("channelworker.swf");
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

			if(bytes.length > 0)
			{
				//サブワーカー作成
				_subWorker = WorkerDomain.current.createWorker(bytes, true);
				_subWorker.addEventListener(Event.WORKER_STATE, _workerStateHandler);

				//メイン・サブワーカー間のメッセージチャンネル作成
				_msgChFromMain = Worker.current.createMessageChannel(_subWorker);
				_msgChFromSub = _subWorker.createMessageChannel(Worker.current);
				_msgChFromSub.addEventListener(Event.CHANNEL_MESSAGE, _fromSubChannelMessageHandler);
				_subWorker.setSharedProperty("msgChFromMain", _msgChFromMain);
				_subWorker.setSharedProperty("msgChFromSub", _msgChFromSub);

				//IPアドレス取得&myID,myNameを設定
				updateIPAddress();
				_subWorker.setSharedProperty("myID", _myID);
				_subWorker.setSharedProperty("myName", _myName);
				_subWorker.setSharedProperty("myIP", _myIP);

				//サブワーカー開始
				_subWorker.start();
			}
		}

		//サブワーカー初期化
		private static function _initSub(): void
		{
			_msgChFromMain = Worker.current.getSharedProperty("msgChFromMain");
			_msgChFromSub = Worker.current.getSharedProperty("msgChFromSub");
			_msgChFromMain.addEventListener(Event.CHANNEL_MESSAGE, _fromMainChannelMessageHandler);

			_myID = Worker.current.getSharedProperty("myID");
			_myName = Worker.current.getSharedProperty("myName");
			_myIP = Worker.current.getSharedProperty("myIP");

			_drivers = {};
			_messageQueue = new MessageQueue()
		}

		//ワーカーステータス
		private static function _workerStateHandler(evt: Event): void
		{
		}

		//メイン-->サブへのメッセージ
		private static function _fromMainChannelMessageHandler(evt: Event): void
		{
			switch(evt.type)
			{
				case Event.CHANNEL_MESSAGE:
					_actionFromMainChannelMessage(_msgChFromMain.receive(true));
					break;
			}
		}

		//サブワーカーが実行するコマンド
		private static function _actionFromMainChannelMessage(data: Object): void
		{
			switch(data.channelCommand)
			{
				case "open":
					open(data.name, data.config, data.owner);
					break;
				case "close":
					close(data.name);
					break;
				case "send":
					send(data.header, data.key, data.value);
					break;
				case "queue":
					queue(data.operation);
					break;
			}
		}

		//サブ-->メインへのメッセージ
		private static function _fromSubChannelMessageHandler(evt: Event): void
		{
			switch(evt.type)
			{
				case Event.CHANNEL_MESSAGE:
					_actionFromSubChannelMessage(_msgChFromSub.receive(true));
					break;
			}
		}

		//メインが実行するコマンド
		private static function _actionFromSubChannelMessage(data: Object): void
		{
			switch(data.channelCommand)
			{
				case "receive":
					receive(data.header, data.key, data.value);
					break;
				case "event":
					event(data.name, data.type, data.data);
					break;
				case "changeMemberData":
					changeMemberData(data.operation, data.data);
					break;
			}
		}

		//IDを取得
		public static function updateIPAddress(): void
		{
			var ipList: Array = IPAddress.getActiveIPv4Address();
			_myIP = null;
			if(ipList != null && ipList.length > 0)
			{
				_myIP = ipList[0];
			}
			_myID = _getIDFromIP(_myIP);//UIDUtil.createUID();
			_myName = _myIP;
		}

		private static function _getIDFromIP(ip: String): String
		{
			if(ip == null) return null;
			var i: uint;
			var data: Array = ip.split(".");
			if(data.length >= 4) return data[3];
			return ip;
		}

		//IDを取得
		public static function get myID(): String
		{
			return _myID;
		}

		//名前を取得
		public static function get myName(): String
		{
			return _myName;
		}

		//IPアドレスを取得
		public static function get myIP(): String
		{
			return _myIP;
		}

		//メンバー情報を取得
		public static function get members(): MemberManager
		{
			return _members;
		}

		//チャンネル開く
		public static function open(name: String, config: Object, owner: String): void
		{

			if(Worker.current.isPrimordial)
			{
				if(_msgChFromMain != null) _msgChFromMain.send({channelCommand: "open", name: name, config: config, owner: owner});
			}
			else
			{
				if(_drivers == null) return;
				close(name);
				_members.setOwnerID(name, owner);
				switch(config.type)
				{
					case "rtmfpSmallGroup":
						_drivers[name] = new RTMFPSmallGroupDriver(name, config);
						_drivers[name].open();
						break;
					case "tcp":
						break;
				}
			}
		}

		//チャンネル閉じる
		public static function close(name: String = null): void
		{
			var key: String;
			if(Worker.current.isPrimordial)
			{
				if(_msgChFromMain != null) _msgChFromMain.send({channelCommand: "close", name: name});
			}
			else
			{
				if(_drivers == null) return;
				if(name != null)
				{
					if(_drivers.hasOwnProperty(name))
					{
						_drivers[name].close();
						delete _drivers[name];
					}
				}
				else
				{
					for(key in _drivers)
					{
						_drivers[key].close();
					}
					_drivers = {};
				}
			}
		}

		//キュー操作
		public static function queue(operation: String): void
		{
			if(Worker.current.isPrimordial)
			{
				if(_msgChFromMain != null) _msgChFromMain.send({channelCommand: "queue", operation: operation});
			}
			else
			{
				if(_messageQueue == null) return;
				switch(operation)
				{
					case "startSendQueue":
						_messageQueue.startSendQueue()
						break;
					case "pauseSendQueue":
						_messageQueue.pauseSendQueue()
						break;
					case "startReceiveQueue":
						_messageQueue.startReceiveQueue()
						break;
					case "pauseReceiveQueue":
						_messageQueue.pauseReceiveQueue()
						break;
					case "clear":
						_messageQueue.clear()
						break;
				}
			}
		}

		//チャンネルが登録されているか確認
		public static function isExists(name: String): Boolean
		{
			if(_drivers == null) return false;
			if(name != null)
			{
				if(_drivers.hasOwnProperty(name))
				{
					return true;
				}
			}
			return false;
		}

		//チャンネルステータス取得
		public static function getStatus(name: String): Object
		{
			if(_drivers == null) return null;
			if(name != null)
			{
				if(_drivers.hasOwnProperty(name))
				{
					return _drivers[name].status;
				}
			}
			return null;
		}

		//送信ヘッダーオブジェクト作成
		public static function createHeader(target: String): Object
		{
			return {target: target, senderID: _myID};
		}

		//オーナーへの送信ヘッダーオブジェクト作成
		public static function createHeaderToOwner(name: String): Object
		{
			return createHeader(ChannelTarget.create(Channel.members.getOwnerID(name), name));
		}

		//送信（コントローラ→ドライバ）
		public static function send(header: Object, key: String, value: Object): void
		{
			if(Worker.current.isPrimordial)
			{
				if(_msgChFromMain != null) _msgChFromMain.send({channelCommand: "send", header: header, key: key, value: value});
			}
			else
			{
				if(_messageQueue != null) _messageQueue.send(header, key, value);
			}
		}

		//送信データのドライバーへの受け渡し
		public static function sendToDriver(header: Object, key: String, value: Object): void
		{
			if(_drivers != null && _drivers.hasOwnProperty(header.targetDriver))
			{
				_drivers[header.targetDriver].send(header, key, value);
			}
		}

		//受信（ドライバ→コントローラ）
		public static function receive(header: Object, key: String, value: Object): void
		{
			if(Worker.current.isPrimordial)
			{
				PostBox.send("CHANNEL_" + key, {header: header, key: key, value: value});
			}
			else
			{
				if(_messageQueue != null) _messageQueue.receive(header, key, value);
			}
		}

		public static function receiveToMainChannel(header: Object, key: String, value: Object): void
		{
			if(_msgChFromSub != null) _msgChFromSub.send({channelCommand: "receive", header: header, key: key, value: value});
		}

		//イベント発行
		public static function event(name: String, type: String,  data: Object): void
		{
			if(Worker.current.isPrimordial)
			{
				PostBox.send("CHANNEL_event", {channelName: name, type: type, data: data});
			}
			else
			{
				if(_msgChFromSub != null) _msgChFromSub.send({channelCommand: "event", name: name, type: type, data: data});
			}
		}

		//メンバー更新
		public static function changeMemberData(operation: String, data: Object): void
		{
			if(Worker.current.isPrimordial)
			{
				switch(operation)
				{
					case "add":
						_members.add(data.channel, data.memberID, data.name, data.ip, data.option);
						break;
					case "update":
						_members.update(data.channel, data.currentMemberID, data.newMemberID, data.name, data.ip, data.option);
						break;
					case "remove":
						_members.remove(data.channel, data.memberID);
						break;
					case "removeFromChannel":
						_members.removeFromChannel(data.channel);
						break;
					case "reset":
						_members.reset();
						break;
					case "setChannelMemberData":
						_members.setChannelMemberData(data.channel, data.data);
						break;
					case "ownerID":
						_members.setOwnerID(data.channel, data.ownerID);
						break;
				}
			}
			else
			{
				if(_msgChFromSub != null) _msgChFromSub.send({channelCommand: "changeMemberData", operation: operation, data: data});
			}
		}
	}
}
