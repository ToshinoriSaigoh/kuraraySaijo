package controller.documentroot.reportscreen.sidebar.settingsbox
{
	import common.TimerUtils;
	import model.app.network.*;
	import controller.documentroot.reportscreen.sidebar.settingsbox.settingslinkcontainer.ChMenuItem;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.collections.ArrayCollection;

	public class SettingsLinkContainer extends VC
	{
		public function SettingsLinkContainer()
		{
			vcName = "settingsLinkContainer";
			elementName = "NavigatorContent";
		}

		override protected function init(): void
		{
			//チャンネルbuttonBar
			mxml.chBar.dataProvider = new ArrayCollection([
				new ChMenuItem("chA", "A", 50, 44, 0x222222, 1.0),
				new ChMenuItem("chB", "B", 50, 44, 0x222222, 1.0),
				new ChMenuItem("chC", "C", 50, 44, 0x222222, 1.0),
				new ChMenuItem("chD", "D", 50, 44, 0x222222, 1.0),
				new ChMenuItem("chE", "E", 50, 44, 0x222222, 1.0),
				new ChMenuItem("chF", "F", 50, 44, 0x222222, 1.0)
			]);
			mxml.chBar.addEventListener(MouseEvent.CLICK, _chBarClickHandler);

			//ラベル設定
			mxml.channel.text                       = Config.getText("Settings", "link", "channel");
			mxml.sendingDataHead.text               = Config.getText("Settings", "link", "sendingDataHead");
			mxml.sendingDataDelayTime.text          = Config.getText("Settings", "link", "sendingDataDelayTime");
			mxml.sendingDataDelayTimeDefault.text   = Config.getText("Settings", "link", "sendingDataDelayTimeDefault");
			mxml.sendingDataSplitSize.text          = Config.getText("Settings", "link", "sendingDataSplitSize");
			mxml.sendingDataSplitSizeDefault.text   = Config.getText("Settings", "link", "sendingDataSplitSizeDefault");
			mxml.memberLoginHead.text               = Config.getText("Settings", "link", "memberLoginHead");
			mxml.memberLoginTimeout.text            = Config.getText("Settings", "link", "memberLoginTimeout");
			mxml.memberLoginTimeoutDefault.text     = Config.getText("Settings", "link", "memberLoginTimeoutDefault");

			mxml.saveBtn.addEventListener(MouseEvent.CLICK, _saveBtnClickHandler);

			_setChBarConfigValue();
		}

		//チャンネルボタンバーの設定ファイル値をUIに反映
		private function _setChBarConfigValue(): void
		{
			var i: uint;
			var data: ChMenuItem;
			var index: int = -1;
			for(i = 0; i < mxml.chBar.dataProvider.length; i++)
			{
				data = mxml.chBar.dataProvider.getItemAt(i) as ChMenuItem;
				if(data.text == ChannelManager.defaultLoginChannel)
				{
					index = i;
					break;
				}
			}
			if(index >= 0)
			{
				mxml.chBar.selectedIndex = index;
			}
		}

		//チャンネルボタンバークリック操作
		private function _chBarClickHandler(evt: MouseEvent): void
		{
			var data: ChMenuItem;
			if(mxml.chBar.selectedIndex >= 0)
			{
				data = mxml.chBar.dataProvider.getItemAt(mxml.chBar.selectedIndex) as ChMenuItem;
				ChannelManager.defaultLoginChannel = data.text;
			}
			else
			{
				ChannelManager.defaultLoginChannel = "";
			}
		}

		//送信遅延時間変更時の処理
		public function sendingDataDelayTimeChange(): void
		{
			var value: uint = uint(mxml.inputSendingDataDelayTime.text);
			if(ChannelManager.sendDataDelayTime != value)
			{
				ChannelManager.sendDataDelayTime = value;
			}
		}

		//分割バイト数変更時の処理
		public function sendingDataSplitSizeChange(): void
		{
			var value: uint = uint(mxml.inputSendingDataSplitSize.text);
			if(ChannelManager.separateBytes != value)
			{
				ChannelManager.separateBytes = value;
			}
		}

		//メンバーログインタイムアウト時間変更時の処理
		public function memberLoginTimeoutChange(): void
		{
			var value: uint = uint(mxml.inputMemberLoginTimeout.text);
			if(ChannelManager.memberLoginTimeout != value)
			{
				ChannelManager.memberLoginTimeout = value;
			}
		}

		//保存ボタン処理
		private function _saveBtnClickHandler(evt: MouseEvent): void
		{
			Config.set("config", "link", "defaultLoginChannel", ChannelManager.defaultLoginChannel);
			Config.set("config", "link", "memberLoginTimeout", ChannelManager.memberLoginTimeout.toString());
			Config.set("config", "link", "separateBytes", ChannelManager.separateBytes.toString());
			Config.set("config", "link", "sendDataDelayTime", ChannelManager.sendDataDelayTime.toString());
			Config.saveConfigXML(Config.configTree.config[0], "config.xml");
		}
	}
}
