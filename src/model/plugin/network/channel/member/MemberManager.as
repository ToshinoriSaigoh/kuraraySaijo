package model.plugin.network.channel.member
{
	import model.plugin.network.channel.Channel;
	import mx.collections.ArrayCollection;
	public class MemberManager
	{
		private var _members: Object;//メンバーリスト
		private var _workerFlag: Boolean;//ワーカーフラグ

		//コンストラクタ
		public function MemberManager(flag: Boolean)
		{
			_workerFlag = flag;
			reset();
		}

		//リセット
		public function reset(): void
		{
			var key: String;
			if(_members != null)
			{
				for(key in _members)
				{
					_members[key].reset();
				}
			}
			_members = {};
			if(_workerFlag) Channel.changeMemberData("reset", null);
		}

		//オーナーID設定
		public function setOwnerID(channel: String, ownerID: String): void
		{
			_createChannel(channel);
			_members[channel].ownerID = ownerID;
			if(_workerFlag) Channel.changeMemberData("ownerID", {channel: channel, ownerID: ownerID});
		}

		//オーナーID取得
		public function getOwnerID(channel: String): String
		{
			_createChannel(channel);
			return _members[channel].ownerID;
		}

		//自身がオーナーであるかどうか
		public function isOwner(channel: String): Boolean
		{
			_createChannel(channel);
			return _members[channel].isOwner();
		}

		//指定IDがオーナーであるかどうか
		public function isItOwner(channel: String, memberID: String): Boolean
		{
			_createChannel(channel);
			return _members[channel].ownerID == memberID;
		}

		//オーナーが設定されていないかどうか
		public function ownerIsEmpty(channel: String): Boolean
		{
			_createChannel(channel);
			return _members[channel].ownerID == null;
		}

		//チャンネル追加
		private function _createChannel(channel: String): void
		{
			if(_members.hasOwnProperty(channel) == false) _members[channel] = new ChannelMember();
		}

		//メンバー追加
		public function add(channel: String, memberID: String, name: String, ip: String, option: Object): Member
		{
			var member: Member;
			if(option == null) option = {};
			_createChannel(channel);
			member = _members[channel].add(memberID, ip, name, option);
			if(_workerFlag) Channel.changeMemberData("add", {channel: channel, memberID: memberID, name: name, ip: ip, option: option});
			return member;
		}

		//メンバー更新
		public function update(channel: String, currentMemberID: String, newMemberID: String, name: String, ip: String, option: Object): void
		{
			var member: Member;
			if(option == null) option = {};
			member = getMember(channel, currentMemberID);
			if(member != null)
			{
				member.id = newMemberID;
				member.name = name;
				member.ip = ip;
				member.option = option;
				if(_workerFlag) Channel.changeMemberData("update", {channel: channel, currentMemberID: currentMemberID, newMemberID: newMemberID, name: name, ip: ip, option: option});
			}
		}

		//メンバー削除
		public function remove(channel: String, memberID: String): void
		{
			_createChannel(channel);
			_members[channel].remove(memberID);
			if(_workerFlag) Channel.changeMemberData("remove", {channel: channel, memberID: memberID});
		}

		//メンバー削除
		public function removeFromChannel(channel: String): void
		{
			_createChannel(channel);
			_members[channel].reset();
			if(_workerFlag) Channel.changeMemberData("removeFromChannel", {channel: channel});
		}

		//メンバー一覧取得
		public function getChannelArrayCollection(channel: String): ArrayCollection
		{
			_createChannel(channel);
			return _members[channel].collection;
		}

		//メンバー一覧取得
		public function getChannelMember(channel: String): Array
		{
			_createChannel(channel);
			return _members[channel].getArray();
		}

		//メンバー取得
		public function getMember(channel: String, memberID: String): Member
		{
			_createChannel(channel);
			return _members[channel].getMember(memberID);
		}

		//メンバー情報作成
		public function getMemberListData(channel: String): Object
		{
			_createChannel(channel);
			return _members[channel].data;
		}

		//メンバー情報更新
		public function setChannelMemberData(channel: String, data: Object): void
		{
			_createChannel(channel);
			_members[channel].data = data;
			if(_workerFlag) Channel.changeMemberData("setChannelMemberData", {channel: channel, data: data});
		}
	}
}