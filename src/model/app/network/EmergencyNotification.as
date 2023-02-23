/*
	PostBox.send("sendEmergencyNotification", {type: type, emergency: emergency});
*/
package model.app.network
{
	import common.ObjectUtils;
	import model.plugin.network.channel.*;

	public class EmergencyNotification extends Plug
	{
		public function EmergencyNotification()
		{
			super();
		}

		public function PB_sendEmergencyNotification(): void
		{
			var param: Object = PostBox.get("PB_sendEmergencyNotification");
			var channelName: String = Global.get("currentChannelName");
			var header: Object;
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
				var sendParam: Object = ObjectUtils.clone(param);
				sendParam.author = Channel.myID;
				Channel.send(header, "emergencyNotification", sendParam);
			}
		}

		//緊急通知受信
		public function PB_CHANNEL_emergencyNotification(): void
		{
			var param: Object = PostBox.get("PB_CHANNEL_emergencyNotification");
			var channelName: String = Global.get("currentChannelName");
			var header: Object;

			if(param.value.author != Channel.myID)
			{
				PostBox.send("addReport", param.value);
			}

			//オナーの場合はそのまま全員へ送信
			if(Channel.members.isOwner(channelName))
			{
				header = Channel.createHeader("@" + channelName);
				Channel.send(header, "emergencyNotification", param.value);
			}
		}

	}
}