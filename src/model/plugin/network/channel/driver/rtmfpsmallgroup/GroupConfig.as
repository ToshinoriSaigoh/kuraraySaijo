package model.plugin.network.channel.driver.rtmfpsmallgroup
{
	import flash.net.GroupSpecifier;

	public class GroupConfig
	{
		public var receiver: Object;//通知受けりオブジェクト
		public var name: String;//グループ名
		public var maxPeerConnections: uint;//ピアーの受信接続と送信接続の総数
		public var connectCommand: String;//接続コマンド
		public var connectArguments: Array;//接続
		public var groupSpecifier: GroupSpecifier;//グループ構築情報
		public var withAuthorizations: Boolean;//NetStream および NetGroup コンストラクターに渡すことができる権限を含めた不透明な groupspec ストリングを返します。???
	}
}

