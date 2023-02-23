package model.plugin.network.channel.driver.rtmfpsmallgroup
{
	import common.TimerUtils;
	import flash.net.NetConnection;
	import flash.net.NetGroup;
	import flash.net.GroupSpecifier;
	import flash.net.NetGroupSendMode;
	import flash.events.Event;
	import flash.events.NetStatusEvent;

	public class MultiGroup
	{
		private var _groupList: Array;//グループリスト
		private var _groupNameList: Array;//グループ名リスト
		private var _connectFlag: Boolean;//接続状態--->STATUSにするか？

		//コンストラクタ
		function MultiGroup(): void
		{
			super();
			reset();
		}

		//リセット処理
		public function reset(): void
		{
			close();
			_groupList             = [];
			_groupNameList         = null;
			_connectFlag           = false;
		}

		//全グループに対する処理
		public function walkInGroupList(fnc: Function): void
		{
			var i: uint;
			if(_groupList == null) return;
			for(i=0; i<_groupList.length; i++)
			{
				if( fnc.call(null, _groupList[i])) break;
			}
		}

		//グループ追加
		public function add(config: GroupConfig): void
		{
			var group: Group;
			if(config == null) return;
			group = getGroup(config.name);
			if(group != null)
			{
				remove(group.name);
			}
			group = new Group(config);
			_groupList.push(group);
			_updateGroupNameList();
		}

		//グループ削除
		public function remove(groupName: String): void
		{
			var i: uint;
			var group: Group;
			for(i=0; i < _groupList.length; i++)
			{
				if(groupName == _groupList[i].name)
				{
					_groupList[i].reset();
					_groupList.removeAt(i);
					break;
				}
			}
			_updateGroupNameList();
		}

		public function get groupNameList(): Array
		{
			if(_groupNameList == null) _updateGroupNameList();
			return _groupNameList;
		}

		//グループ名リスト取得
		private function _updateGroupNameList(): void
		{
			_groupNameList = [];
			walkInGroupList(proc);
			function proc(group: Group): Boolean
			{
				_groupNameList.push(group.name);
				return false;
			}
		}

		//対象グループ判定
		private function _isTargetGroup(group: Group, groupNameList: Array): Boolean
		{
			if(group == null || groupNameList == null) return false;
			if(groupNameList.indexOf(group.name) >= 0) return true;
			return false;
		}

		//接続
		public function open(groupNameList: Array = null): void
		{
			close(groupNameList);
			_connectFlag = true;
			walkInGroupList(proc);
			function proc(group: Group): Boolean
			{
				if(_isTargetGroup(group, groupNameList)) group.open();
				return false;
			}
		}

		//切断
		public function close(groupNameList: Array = null): void
		{
			walkInGroupList(proc);
			_connectFlag = false;
			function proc(group: Group): Boolean
			{
				if(groupNameList == null || _isTargetGroup(group, groupNameList))
				{
					group.close();
				}
				return false;
			}
		}

		//接続状態にかどうかの判定
		public function isConnecting(): Boolean
		{
			return _connectFlag;
		}

		//全端末が接続状態になったかどうかの判定
		public function isAllConnected(groupNameList: Array = null): Boolean
		{
			var res: Boolean;
			res = true;
			walkInGroupList(proc);
			return res;
			function proc(group: Group): Boolean
			{
				if(_isTargetGroup(group, groupNameList))
				{
					if(group.isConnected() == false)
					{
						res = false;
						return true;
					}
				}
				return false;
			}
		}

		//全グループ時間差配信
		public function sendToAllNeighbors(message: Object, targetGroups: Array, delay: uint, cmpFnc: Function): void
		{
			var limit: uint;
			var counter: uint;
			limit = targetGroups.length;
			counter = 0;
			proc();
			function proc(): void
			{
				var group: Group;
				if(limit > counter)
				{
					group = getGroup(targetGroups[counter]);
					if(group != null)
					{
						group.sendToAllNeighbors(message);
						nextCheck();
					}
					else
					{
						nextCheck();
					}
					return;
				}
				callCmp();
			}
			function nextCheck(): void
			{
				counter++;
				if(limit <= counter) callCmp();
				else TimerUtils.delay(delay, proc);
			}
			function callCmp(): void
			{
				if(cmpFnc != null) cmpFnc.call()
			}
		}

		//特定グループに送信
		public function sendToAllNeighborsAtGroup(message: Object, groupName: String): void
		{
			walkInGroupList(proc);
			function proc(group: Group): Boolean
			{
				if(groupName == group.name)
				{
					group.sendToAllNeighbors(message);
					return true;
				}
				return false;
			}
		}

		//特定端末に送信
		public function sendToNearest(message: Object, groupName: String, target: String): void
		{
			walkInGroupList(proc);
			function proc(group: Group): Boolean
			{
				if(groupName == group.name)
				{
					group.sendToNearest(message, target);
					return true;
				}
				return false;
			}
		}

		//グループ取得
		public function getGroup(groupName: String): Group
		{
			var res: Group = null;
			walkInGroupList(proc);
			return res;
			function proc(group: Group): Boolean
			{
				if(groupName == group.name)
				{
					res = group;
					return true;
				}
				return false;
			}
		}

		// //グループのネットグループアドレスを取得
		// private function getGroupAddress(groupName: String): String
		// {
		// 	var group: Group;
		// 	group = getGroup(groupName);
		// 	if(group != null)
		// 	{
		// 		return group.groupAddress;
		// 	}
		// 	return null
		// }
	}
}




