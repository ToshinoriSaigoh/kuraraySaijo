/*
汎用アクション
*/
package model.app.network
{
	import model.plugin.network.channel.*;

	public class GenericAction extends Plug
	{
		public function GenericAction()
		{
			super();
		}

		public function PB_sendGenericAction(): void
		{
			var param: Object = PostBox.get("PB_sendGenericAction");
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
				Channel.send(header, "genericAction", param);
			}
		}

		public function PB_CHANNEL_genericAction(): void
		{
			var param: Object = PostBox.get("PB_CHANNEL_genericAction");
			var channelName: String = Global.get("currentChannelName");
			var header: Object;

			if(param.value.author != Channel.myID)
			{
				switch(param.value.action)
				{
					case "addPage":
						PostBox.send("addPage", {report: param.value.report});
						break;
				}
			}

			//オーナーは全員へ配信
			if(Channel.members.isOwner(channelName))
			{
				header = Channel.createHeader("@" + channelName);
				Channel.send(header, "genericAction", param.value);
			}
		}
	}
}