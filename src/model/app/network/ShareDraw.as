package model.app.network
{
	import model.plugin.network.channel.*;

	public class ShareDraw extends Plug
	{
		public function ShareDraw()
		{
			super();
		}

		//描画共有送信
		public function PB_sendShareDraw(): void
		{
			var param: Object = PostBox.get("PB_sendShareDraw");
			var channelName: String = Global.get("currentChannelName");
			var header: Object;
			var ownerID: String;
			if(channelName != null)
			{
				//オナーの場合はそのまま全員へ送信
				if(Channel.members.isOwner(channelName))
				{
					header = Channel.createHeader("@" + channelName);
				}
				//オーナーではない場合、まずオーナーに送信
				else
				{
					header = Channel.createHeaderToOwner(channelName);
				}
				param.author = Channel.myID;
				Channel.send(header, "shareDraw", param);
			}
		}

		//描画共有受信
		public function PB_CHANNEL_shareDraw(): void
		{
			var param: Object = PostBox.get("PB_CHANNEL_shareDraw");
			var channelName: String = Global.get("currentChannelName");
			var header: Object;

			//描画共有データDrawツールへの引き渡し
			if(param.value.author != Channel.myID) PostBox.send("receiveShareDraw", param.value);

			//オーナーは全員へ配信
			if(Channel.members.isOwner(channelName))
			{
				header = Channel.createHeader("@" + channelName);
				Channel.send(header, "shareDraw", param.value);
			}
		}
	}
}