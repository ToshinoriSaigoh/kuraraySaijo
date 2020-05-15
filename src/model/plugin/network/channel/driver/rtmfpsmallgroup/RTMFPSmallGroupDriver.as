/*
RTMFP最小構成グループ接続ドライバ

RTMFPによるグループを複数管理する接続方法
ドライバ内に複数のグループ(MultiGroup)を持つ
１グループの最大メンバー数はmemberNumPerGroupにて指定

config.type[Channelにて使用]
config.groupNamePrefix//グループ名接頭辞
config.groupNum//作成グループ数指定
config.memberNumPerGroup//1グループあたりのメンバー数指定
config.connectGroupIndex//接続グループインデックス（メンバーで接続するグループ番号を指定）
config.multicastAddress//マルチキャストアドレス
config.startPort//開始ポート番号
config.sendDelayTime//グループ間チャンネル送信間隔
*/
package model.plugin.network.channel.driver.rtmfpsmallgroup
{
	import common.TimerUtils;
	import model.plugin.network.channel.*;
	import model.plugin.network.channel.member.Member;
	import model.plugin.network.channel.driver.Driver;
	import flash.net.GroupSpecifier;
	import flash.utils.getTimer;
	import mx.utils.UIDUtil;

	public class RTMFPSmallGroupDriver extends Driver
	{
		private var _groups: MultiGroup;//複数グループを管理・保持
		private var _connectTimestamp: uint;//connectからの経過時間

		//コンストラクタ
		public function RTMFPSmallGroupDriver(name: String, config: Object)
		{
			super(name, config);
			_groups = new MultiGroup();
			_init();
		}

		//初期化
		private function _init(): void
		{
			var i: uint;
			var groupConfig: GroupConfig;
			var nameList: Array = generateNameList(config.groupNum);
			_groups.close();
			for(i = 0; i < nameList.length; i++)
			{
				groupConfig = new GroupConfig();
				groupConfig.receiver            = this;
				groupConfig.name                = nameList[i];
				groupConfig.maxPeerConnections  = 8;
				groupConfig.connectCommand      = "rtmfp:";
				groupConfig.connectArguments    = [];
				groupConfig.groupSpecifier      = createGroupSpecifier(nameList[i], config.multicastAddress + ":" + (config.startPort + i).toString());
				groupConfig.withAuthorizations  = false;
				_groups.add(groupConfig);
			}
			function generateNameList(num: uint): Array
			{
				var i: uint;
				var res: Array = [];
				for(i = 0; i < num; i++) res.push(name + "." + config.groupNamePrefix + i.toString());
				return res;
			}
			function createGroupSpecifier(name: String, multicastAddress: String): GroupSpecifier
			{
				var groupSpecifier: GroupSpecifier;
				groupSpecifier = new GroupSpecifier(name);
				groupSpecifier.postingEnabled = true;
				groupSpecifier.routingEnabled = true;
				groupSpecifier.ipMulticastMemberUpdatesEnabled = true;
				groupSpecifier.addIPMulticastAddress(multicastAddress);
				return groupSpecifier;
			}
		}

		//通信回線を開く
		override public function open(): void
		{
			var list: Array = _groups.groupNameList;
			var connectList: Array;
			if(Channel.members.isOwner(name))
			{
				connectList = list;
			}
			else
			{
				if(config.connectGroupIndex < list.length)
				{
					connectList = [list[config.connectGroupIndex]];
				}
			}
			if(connectList != null)
			{
				_connectTimestamp = getTimer();
				_groups.open(connectList);
				super.open();
			}
		}

		//通信回線を閉じる
		override public function close(): void
		{
			_groups.close();
			super.close();
		}

		//メッセージ送信
		override public function send(header: Object, key: String, value: Object): void
		{
			var i: uint;
			var targetList: Array = ChannelTarget.stringToList(header.target);
			var chList: Array = [];
			var chNames: Object = {};
			var message: Object = {header: header, key: key, value: value};
			var member: Member;
			var groupName: String;
			for(i = 0; i < targetList.length; i++)
			{
				if(targetList[i].channelName == name)
				{
					if(targetList[i].memberID != null && targetList[i].memberID.length > 0)
					{
						member = Channel.members.getMember(name, targetList[i].memberID);
						if(member != null)
						{
							for(groupName in member.option.groupAddress)
							{
								_groups.sendToNearest(message, groupName, member.option.groupAddress[groupName]);
								break;
							}
						}
					}
					else
					{
						_groups.sendToAllNeighbors(message, _groups.groupNameList, config.sendDelayTime, null);
					}
				}
			}
		}

		//グループ接続成功
		public function groupConnectSuccess(group: Group): void
		{
			_addMember(Channel.myID, Channel.myName, Channel.myIP, group.name, group.groupAddress);

			//ログイン成功
			if(Channel.members.isOwner(name))
			{
				status.ready = true;
				Channel.event(name, Channel.EVENT_LOGIN_SUCCESSED, {owner: Channel.myID, ownerName: Channel.myName});
			}
		}

		//メンバー接続
		public function neighborConnect(group: Group, neighbor: String): void
		{
			//接続してきた端末にグループアドレスを通知
			if(Channel.members.isOwner(name)) _sendSelfIntroduction(group, neighbor);
		}

		//メンバー切断
		public function neighborDisconnect(group: Group, neighbor: String): void
		{
			//メンバー管理情報から削除
			var member: Member = _getMemberFromGroupAddress(group.name, neighbor);
			var key: String;
			var list: Array = Channel.members.getChannelMember(name);
			if(member != null)
			{
				Channel.members.remove(name, member.id);
				//オーナーが切断した場合
				if(Channel.members.isItOwner(name, member.id))
				{
					Channel.event(name, Channel.EVENT_OWNER_LOST, {owner: member.id});
				}
			}
		}

		//メッセージ受信
		public function receiveMessage(group: Group, message: Object): void
		{
			switch(message.key)
			{
				case "ownerSelfIntroduction":
					_receiveOwnerSelfIntroduction(group, message);
					break;
				case "memberSelfIntroduction":
					_receiveMemberSelfIntroduction(group, message);
					break;
				case "memberList":
					_receiveMemberList(group, message);
					break;
				default:
					Channel.receive(message.header, message.key, message.value);
					break;
			}
		}

		//オーナーの自己紹介通知送信
		private function _sendSelfIntroduction(group: Group, neighbor: String): void
		{
			var member: Member = _getMemberFromGroupAddress(group.name, neighbor);
			var result: Boolean;
			var value: Object;

			//仮メンバー登録
			result = false;
			if(member == null)
			{
				if(_countUpMemberNumInGroup(group) < config.memberNumPerGroup)
				{
					result = true;
					_addMember(UIDUtil.createUID(), "", "", group.name, neighbor);
				}
			}
			else result = true;

			//オーナー自己紹介送信
			_sendSelfIntroductionMessage("ownerSelfIntroduction", {result: result}, group, neighbor);
		}

		//オーナー自己紹介通知受信
		private function _receiveOwnerSelfIntroduction(group: Group, message: Object): void
		{
			//同時オーナーが衝突した場合は警告を出す
			if(Channel.members.isOwner(name))
			{
				Channel.event(name, Channel.EVENT_ERROR, {errorType: Channel.ERROR_OTHER_OWNER_LOGINED});
				return;
			}

			//オーナーではない場合まだオーナーが設定されていない場合のみ有効
			if(Channel.members.ownerIsEmpty(name))
			{
				//メンバー数が超えていた場合はログイン失敗
				//チャンネルを閉じる
				if(message.value.result == false)
				{
					Channel.event(name, Channel.EVENT_LOGIN_FAILED, null);
					close();
				}
				else
				{
					status.ready = true;

					//オーナーのメンバー情報を追加
					_addMember(message.value.memberID, message.value.memberName, message.value.memberIPAddress, group.name, message.value.groupAddress);

					//オーナー権限設定
					Channel.members.setOwnerID(name, message.value.memberID);

					//ログイン成功
					Channel.event(name, Channel.EVENT_LOGIN_SUCCESSED, {owner: message.value.memberID, ownerName: message.value.memberName});

					//メンバーの自己紹介送信
					_sendSelfIntroductionMessage("memberSelfIntroduction", null, group, message.value.groupAddress);
				}
			}
		}

		//メンバー自己紹介通知受信
		private function _receiveMemberSelfIntroduction(group: Group, message: Object): void
		{
			_addMember(message.value.memberID, message.value.memberName, message.value.memberIPAddress, group.name, message.value.groupAddress);
			_sendMemberList();
			Channel.event(name, Channel.EVENT_ADD_MEMBER, {memberID: message.value.memberID});
		}

		//メンバーリスト更新通知送信
		private function _sendMemberList(): void
		{
			var sendValue: Object;
			sendValue = {};
			sendValue.members = Channel.members.getMemberListData(name);
			_groups.sendToAllNeighbors({key: "memberList", value: sendValue}, _groups.groupNameList, config.sendDelayTime, null);
		}

		//メンバーリスト更新通知受信
		private function _receiveMemberList(group: Group, message: Object): void
		{
			Channel.members.setChannelMemberData(name, message.value.members);
		}

		//自己紹介メッセージ送信
		private function _sendSelfIntroductionMessage(messagegKey: String, option: Object, group: Group, neighbor: String): void
		{
			var sendValue: Object;
			var key: String;
			sendValue = {};
			sendValue.ownerFlag = Channel.members.isOwner(name);
			sendValue.memberID = Channel.myID
			sendValue.memberName = Channel.myName
			sendValue.memberIPAddress = Channel.myIP
			sendValue.groupAddress = group.groupAddress;
			if(option != null)
			{
				for(key in option)
				{
					sendValue[key] = option[key];
				}
			}
			group.sendToNearest({key: messagegKey, value: sendValue}, neighbor);
		}

		//メンバー追加
		//メンバーID,メンバー名,メンバーIPアドレス,グループ名,グループアドレス
		private function _addMember(memberID: String, memberName: String, memberIP: String, groupName: String, groupAddress: String): void
		{
			var member: Member;
			var currentMemberID: String;
			member = _getMemberFromGroupAddress(groupName, groupAddress);
			if(member != null)
			{
				currentMemberID = member.id;
			}
			else
			{
				currentMemberID = memberID;
			}
			if(member == null) member = Channel.members.getMember(name, memberID);
			if(member == null) member = Channel.members.add(name, memberID, "", "", {});
			if(member != null)
			{
				if(member.option.hasOwnProperty("groupAddress") == false) member.option.groupAddress = {};
				member.option.groupAddress[groupName] = groupAddress;
				Channel.members.update(name, currentMemberID, memberID, memberName, memberIP, member.option);
			}
		}

		//グループアドレスからメンバーを取得
		private function _getMemberFromGroupAddress(groupName: String, groupAddress: String): Member
		{
			var i: uint;
			var key: String;
			var list: Array = Channel.members.getChannelMember(name);
			if(list != null)
			{
				for(i = 0; i < list.length; i++)
				{
					for(key in list[i].option.groupAddress)
					{
						if(key == groupName && list[i].option.groupAddress[groupName] == groupAddress)
						{
							return list[i];
							break;
						}
					}
				}
			}
			return null;
		}

		//グループ内メンバー数をカウント
		private function _countUpMemberNumInGroup(group: Group): uint
		{
			var i: uint;
			var key: String;
			var list: Array = Channel.members.getChannelMember(name);
			var counter: uint = 0;
			if(list != null)
			{
				for(i = 0; i < list.length; i++)
				{
					for(key in list[i].option.groupAddress)
					{
						if(key == group.name) counter++;
					}
				}
			}
			return counter;
		}
	}
}
