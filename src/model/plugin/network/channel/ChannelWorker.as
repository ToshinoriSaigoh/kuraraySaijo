/*
Worker作成用のドキュメントクラス

Flash Develop の Projectペインからこのファイルを右クリックして
「Set Document Class」を実行した後、swfファイルを書き出す

binディレクトリに swf ファイルができるので、ファイル名を channelworker.swf に変更。
*/
package model.plugin.network.channel
{
	import flash.display.Sprite;
	public class ChannelWorker extends Sprite
	{
		private var _channel: Channel;
		public function ChannelWorker()
		{
			_channel = new Channel();
		}
	}
}
