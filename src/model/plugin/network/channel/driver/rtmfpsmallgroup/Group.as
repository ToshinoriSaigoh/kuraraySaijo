/*

config.receiver には以下の関数を用意しておく
public function groupConnectSuccess(group: Group);
public function neighborConnect(group: Group, neighbor: Strgin): void
public function neighborDisconnect(group: Group, neighbor: Strgin): void
public function receiveMessage(group: Group, message: Object): void
*/
package model.plugin.network.channel.driver.rtmfpsmallgroup
{
	import flash.net.NetConnection;
	import flash.net.NetGroup;
	import flash.net.GroupSpecifier;
	import flash.net.NetGroupSendMode;
	import flash.events.Event;
	import flash.events.NetStatusEvent;

	public class Group
	{
		private var _connection: NetConnection;//通信オブジェクト
		private var _group: NetGroup;//通信グループオブジェクト
		private var _config: GroupConfig;//設定値
		private var _groupAddress: String;//ネットワークグループアドレス
		private var _joinedGroupFlag: Boolean;//グループに参加しているかどうかのフラグ

		//コンストラクタ
		function Group(config: GroupConfig): void
		{
			super();
			reset();
			_config = config;
		}

		//リセット処理
		public function reset(): void
		{
			close();
			_connection                 = null;
			_group                      = null;
			_config                     = null;
			_groupAddress               = null;
			_joinedGroupFlag            = false;
		}

		//チャンネル取得
		public function get name(): String
		{
			return _config.name;
		}

		//GroupAddress取得
		public function get groupAddress(): String
		{
			return _groupAddress;
		}

		//接続
		public function open(): void
		{
			close();
			_connection = new NetConnection();
			_connection.maxPeerConnections = _config.maxPeerConnections;
			_connection.addEventListener(NetStatusEvent.NET_STATUS, netStatus);
			_connection.connect.apply(this, [_config.connectCommand].concat(_config.connectArguments));
		}

		//切断
		public function close(): void
		{
			if(_group != null)
			{
				_group.close();
				_group.removeEventListener(NetStatusEvent.NET_STATUS, netStatus);
				_group = null;
			}
			if(_connection != null)
			{
				_connection.close();
				_connection.removeEventListener(NetStatusEvent.NET_STATUS, netStatus);
				_connection = null;
			}
			_joinedGroupFlag = false;
			_groupAddress    = null;
		}

		//グループ初期化
		private function setupGroup(): void
		{
			var auth: String;
			if(_config.groupSpecifier != null)
			{
				if(_config.withAuthorizations) auth = _config.groupSpecifier.groupspecWithAuthorizations();
				else auth = _config.groupSpecifier.groupspecWithoutAuthorizations();
				_group = new NetGroup(_connection, auth);
				_group.addEventListener(NetStatusEvent.NET_STATUS, netStatus);
			}
		}

		//通信イベント処理
		private function netStatus(evt: NetStatusEvent): void
		{
			Log.trace("netStatus : " + evt.info.code);
			switch (evt.info.code)
			{
				case "NetConnection.Connect.Success":
					setupGroup();
					break;
				case "NetConnection.Connect.Success":
					break;
				case "NetConnection.Connect.Closed":
				case "NetConnection.Connect.Failed":
				case "NetConnection.Connect.Rejected":
				case "NetConnection.Connect.AppShutdown":
				case "NetConnection.Connect.InvalidApp":
					_joinedGroupFlag = false;
					break;

				case "NetGroup.Connect.Success":
					_joinedGroupFlag = true;
					_groupAddress = _group.convertPeerIDToGroupAddress(_connection.nearID);
					_config.receiver.groupConnectSuccess(this);
					break;
				case "NetGroup.Neighbor.Connect":
					_joinedGroupFlag = true;
					_config.receiver.neighborConnect(this, evt.info.neighbor);
					break;
				case "NetGroup.Neighbor.Disconnect":
					_joinedGroupFlag = true;
					_config.receiver.neighborDisconnect(this, evt.info.neighbor);
					break;
				case "NetGroup.Posting.Notify":
				case "NetGroup.SendTo.Notify":
					_joinedGroupFlag = true;
					_config.receiver.receiveMessage(this, evt.info.message);
					break;
				default :
					break;
			}
		}

		//接続に成功しているかどうかの判定
		public function isConnected(): Boolean
		{
			if(_connection != null && _group != null && _joinedGroupFlag)
			{
				return true;
			}
			return false;
		}

		//全端末に送信
		public function sendToAllNeighbors(obj: Object): void
		{
			if(isConnected() && obj != null)
			{
				_group.sendToAllNeighbors(obj);
			}
		}

		//特定端末に送信
		public function sendToNearest(obj: Object, target: String): void
		{
			if(isConnected() && obj != null)
			{
				_group.sendToNearest(obj, target);
			}
		}
	}
}
