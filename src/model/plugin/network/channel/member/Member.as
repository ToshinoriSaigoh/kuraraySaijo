/*
チャンネル（ドライバー）ごとにメンバー情報を保持する
*/
package model.plugin.network.channel.member
{
	import common.ObjectUtils;

	public class Member
	{
		public static const STATUS_CONNECT: String    = "connect";//接続状態
		public static const STATUS_DISCONNECT: String = "disconnect";//切断状態

		[Bindable]
		public var id: String;//メンバーID
		[Bindable]
		public var ip: String;//IP
		[Bindable]
		public var name: String;//名前
		[Bindable]
		public var status: String;//状態
		public var connectedFlag: Boolean;//一度でも接続したことがあるかどうか
		public var option: Object;//オプション

		//コンストラクタ
		public function Member()
		{
			reset();
		}

		//リセット
		public function reset(): void
		{
			id                    = null;
			ip                    = null;
			name                  = null;
			status                = STATUS_DISCONNECT;
			connectedFlag         = false;
			option                = null;
		}

		//データスナップショット取得
		public function set data(cloneData: Object): void
		{
			id              = cloneData.id;
			ip              = cloneData.ip;
			name            = cloneData.name;
			status          = cloneData.status;
			connectedFlag   = cloneData.connectedFlag;
			option          = cloneData.option;
		}

		//データスナップショット取得
		public function get data(): Object
		{
			var cloneData: Object = {};
			cloneData.id                    = id;
			cloneData.ip                    = ip;
			cloneData.name                  = name;
			cloneData.status                = status;
			cloneData.connectedFlag         = connectedFlag;
			cloneData.option                = ObjectUtils.clone(option);
			return cloneData;
		}
	}
}