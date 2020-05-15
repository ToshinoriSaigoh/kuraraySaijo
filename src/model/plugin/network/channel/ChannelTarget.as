/*
送信先の生成・解析を行う
list[
		{
			memberID: "member1",
			channelName: "ch1",
		},
		{
			memberID: "member2",
			channelName: "ch2",
		},
		{
			memberID: "",
			channelName: "ch3",
		},
]
*/
package model.plugin.network.channel
{
	public class ChannelTarget
	{
		//単体ターゲット文字列作成
		public static function create(memberID: String, channelName: String): String
		{
			var target: String;
			if(memberID == null) memberID = "";
			if(channelName == null) channelName = "";
			target = memberID + "@" +channelName;
			return target;
		}

		//対象リストにリスト形式で追加
		public static function addToList(list: Array, memberID: String, channelName: String): Array
		{
			list.push({memberID: memberID, channelName: channelName});
			return list;
		}

		//リスト形式から文字列へ変換
		public static function listToString(list: Array): String
		{
			var i: uint;
			var target: Array = [];
			for(i = 0; i < list.length; i++)
			{
				target.push(create(list[i].memberID, list[i].channelName));
			}
			return list.join(",");
		}

		//リスト形式から文字列へ変換
		public static function stringToList(target: String): Array
		{
			var i: uint;
			var list: Array = [];
			var targetList: Array;
			var tmpList: Array;
			targetList = target.split(",");
			for(i = 0; i < targetList.length; i++)
			{
				tmpList = targetList[i].split("@");
				if(tmpList.length >= 2)
				{
					addToList(list, tmpList[0], tmpList[1]);
				}
			}
			return list;
		}
	}
}
