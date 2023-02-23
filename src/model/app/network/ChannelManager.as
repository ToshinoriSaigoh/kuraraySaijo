/*
アプリケーション固有チャンネル制御処理

現在ログイン中のチャンネル名が取得できる
Global.get("currentChannelName");

*/
package model.app.network
{
	import model.plugin.network.channel.*;

	public class ChannelManager extends Plug
	{
		[Bindable]
		public static var defaultLoginChannel: String;//デフォルトログインチャンネル

		[Bindable]
		public static var memberLoginTimeout: uint;//メンバーログインタイムアウト時間

		[Bindable]
		public static var separateBytes: uint;//分割バイト数

		[Bindable]
		public static var sendDataDelayTime: uint;//送信遅延時間


		public static var currentChannelName: String;//現チャンネル

		private var _active: Boolean;

		public function ChannelManager()
		{
			defaultLoginChannel = Config.get("config", "link", "defaultLoginChannel");
			memberLoginTimeout = uint(Config.get("config", "link", "memberLoginTimeout"));
			separateBytes = uint(Config.get("config", "link", "separateBytes"));
			sendDataDelayTime = uint(Config.get("config", "link", "sendDataDelayTime"));

			Global.define("currentChannelName", ChannelManager);
			_active = false;
		}

		public function MSG_appStart_after(): void
		{
			if(defaultLoginChannel != null && defaultLoginChannel.length > 0)
			{
				PostBox.send("channelCommand", {command: "open", channelName: defaultLoginChannel, owner: Config.owner});
			}
		}

		//チャンネルコマンドメッセージ
		public function PB_channelCommand(): void
		{
			var param: Object = PostBox.get("PB_channelCommand");
			switch(param.command)
			{
				case "open":
					_open(param);
					break;
				case "close":
					_close();
					break;
			}
		}

		//ログイン
		private function _open(param: Object): void
		{
			if(_active) return;
			_active = true;
			if(Channel.isExists(param.channelName) == false)
			{
				var ownerID: String = param.owner?Channel.myID: null;
				var config: Object = {};
				config.type                 = "rtmfpSmallGroup";
				config.groupNamePrefix      = "talkie.KuraraySaijo";//グループ名接頭辞
				config.groupNum             = 1;//作成グループ数指定
				config.connectGroupIndex    = 0;//接続グループインデックス（メンバーで接続するグループ番号を指定）
				config.memberNumPerGroup    = 10;//1グループあたりのメンバー数指定
				config.multicastAddress     = "225.225.0.1";//接続グループインデックス
				config.startPort            = 50000;//開始ポート番号
				config.sendDelayTime        = 100;//グループ間チャンネル送信間隔
				Channel.open(param.channelName, config, ownerID);
			}
		}

		//ログアウト
		private function _close(): void
		{
			Channel.close();
			_active = false;
		}

		//チャンネルイベント
		public function PB_CHANNEL_event(): void
		{
			var param: Object = PostBox.get("PB_CHANNEL_event");
			switch(param.type)
			{
				case Channel.EVENT_OPEN:
					break;
				case Channel.EVENT_LOGIN_SUCCESSED:
					Global.set("currentChannelName", param.channelName);
					break;
				case Channel.EVENT_ADD_MEMBER:
					break;
				case Channel.EVENT_CLOSE:
				case Channel.EVENT_LOGIN_FAILED:
					_active = false;
					Global.set("currentChannelName", null);
					break;
			}
		}

		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			switch(param.tool)
			{
				case "timelineTool":
					Channel.queue("pauseReceiveQueue");
					break;
				default:
					Channel.queue("startReceiveQueue");
					break;
			}
		}
	}
}