/*
ドライバ名(name) == チャンネル名

通信処理実装クラス
　Channelでは、 config.type よってドライバタイプを指定し、
　決められたクラスをインスタンス化して使用する
*/
package model.plugin.network.channel.driver
{
	import model.plugin.network.channel.*;
	public class Driver
	{
		public var name: String;//チャンネル名
		public var config: Object;//設定値
		public var status: Object;//ステータス情報

		//コンストラクタ
		public function Driver(name: String, config: Object)
		{
			this.name = name;
			this.config = config;
			this.status = {opend: false, ready: false};
		}

		//通信回線を開く
		public function open(): void
		{
			status.opend = true;
			status.ready = false;
			Channel.event(name, Channel.EVENT_OPEN, null);
		}

		//通信回線を閉じる
		public function close(): void
		{
			status.opend = false;
			status.ready = false;
			Channel.members.setOwnerID(name, null);
			Channel.members.removeFromChannel(name);
			Channel.event(name, Channel.EVENT_CLOSE, null);
		}

		//メッセージ送信
		public function send(header: Object, key: String, value: Object): void {}
	}
}
