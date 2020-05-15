package model.plugin.network.channel.member
{
	import model.plugin.network.channel.Channel;
	import mx.collections.ArrayCollection;

	public class ChannelMember
	{
		public var ownerID: String;//オーナーID

		[Bindable]
		public var collection: ArrayCollection;//メンバーリスト

		public function ChannelMember()
		{
			ownerID = null;
			collection = new ArrayCollection([]);
		}

		public function reset(): void
		{
			collection.removeAll();
		}

		//自身がオーナーであるかどうか
		public function isOwner(): Boolean
		{
			return ownerID != null && ownerID == Channel.myID;
		}

		//メンバー追加
		public function add(memberID: String, ip: String, name: String, option: Object = null): Member
		{
			var member: Member;
			if(option == null) option = {};
			member = new Member();
			member.id = memberID;
			member.ip = null;
			member.name = null;
			member.option = option;
			collection.addItem(member);
			return member;
		}

		//メンバー削除
		public function remove(memberID: String): void
		{
			var i: uint;
			var member: Member;
			for(i = 0; i < collection.length; i++)
			{
				member = collection.getItemAt(i) as Member;
				if(member.id == memberID)
				{
					collection.removeItemAt(i);
					break;
				}
			}
		}

		//メンバー一覧取得
		public function getArray(): Array
		{
			return collection.source;
		}

		//メンバー取得
		public function getMember(memberID: String): Member
		{
			var i: uint;
			var member: Member;
			for(i = 0; i < collection.length; i++)
			{
				member = collection.getItemAt(i) as Member;
				if(member.id == memberID) return member;
			}
			return null;
		}

		//メンバー情報更新
		public function set data(value: Object): void
		{
			ownerID = value.ownerID;
			var i: uint;
			var member: Member;
			var idList: Array = [];
			var members: Array = value.members;
			for(i = 0; i < members.length; i++)
			{
				member = getMember(members[i].id);
				if(member == null) add(members[i].id, members[i].ip, members[i].name, members[i].option);
				idList.push(members[i].id);
			}
			_removeNonexistentMembers(idList);
		}

		//メンバー情報作成
		public function get data(): Object
		{
			var members: Array = [];
			var list: Array = collection.source;
			var i: uint;
			for(i = 0; i < list.length; i++)
			{
				members.push(list[i].data);
			}
			return {ownerID: ownerID, members: members};
		}

		//指定メンバーIDリストに存在しないメンバーの削除
		private function _removeNonexistentMembers(idList: Array): void
		{
			var i: uint;
			var j: uint;
			var find: Boolean;
			var member: Member;
			var removeList: Array = [];
			if(idList == null) return;
			for(i = 0; i < collection.length; i++)
			{
				member = collection.getItemAt(i) as Member;
				find = false;
				for(j = 0; j < idList.length; j++)
				{
					if(member.id == idList[j])
					{
						find = true;
						break;
					}
				}
				if(find == false) removeList.push(member.id);
			}
			for(i = 0; i < removeList.length; i++)
			{
				remove(removeList[i]);
			}
		}
	}
}