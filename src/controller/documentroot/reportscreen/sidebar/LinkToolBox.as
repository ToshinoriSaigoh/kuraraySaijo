package controller.documentroot.reportscreen.sidebar
{
	import controller.documentroot.reportscreen.sidebar.linktoolbox.*;
	import model.plugin.network.channel.*;
	import spark.collections.Sort;
	import spark.collections.SortField;
	import flash.events.*;
	import mx.collections.ArrayCollection;
	import mx.binding.utils.BindingUtils;

	public class LinkToolBox extends VC
	{
		public var loginCh: String;

		private var _memberCollection: ArrayCollection;
		private var _sort: Sort;
		private var _sortField: SortField;

		private var _selectedChName: String;

		private var _now: Date;
		public function LinkToolBox()
		{
			vcName = "linkToolBox";
			elementName = "NavigatorContent";
			super();

			_sort = new Sort();
			_sortField = new SortField();
			_sortField.name = "name";
			_sortField.descending = true;
			_sortField.numeric = false;
			_sort.fields = [_sortField];

			_selectedChName = null;
			loginCh = null;
		}

		override protected function init(): void
		{
			//テキスト適用
			//mxml.loginBtn.label = Config.getText("LinkToolBox", "loginBtn");
			mxml.memberListHead.text = Config.getText("LinkToolBox", "memberListHead");

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
			//mxml.chBar.addEventListener(Event.CHANGE, _chBarChangeHandler);
			mxml.loginBtn.addEventListener(MouseEvent.CLICK, _loginBtnClickHandler);

			var sortType: Sort = new Sort();
			sortType.fields = [new SortField("index", false, true)];
			// //メンバーリスト
			// _memberCollection = new ArrayCollection([]);//test
			// _memberCollection.addItem({
			// 	id: "01234567",
			// 	ip: "192.168.0.2",
			// 	name: "太郎"
			// });
			// _memberCollection.addItem({
			// 	id: "01234568",
			// 	ip: "192.168.0.3",
			// 	name: "次郎"
			// });
			// _memberCollection.addItem({
			// 	id: "01234569",
			// 	ip: "192.168.0.4",
			// 	name: "三郎"
			// });
			// _memberCollection.addItem({
			// 	id: "01234560",
			// 	ip: "192.168.0.5",
			// 	name: "花子"
			// });
			// mxml.memberList.dataProvider = _memberCollection;

			BindingUtils.bindSetter(_updateChBtn, this, "loginCh");

			//閉じるボタン
			mxml.closeBtn.addEventListener(MouseEvent.CLICK, _btnClickHandler);

			mxml.loginTextarea.text = "";
		}

		//ボタンハンドラー
		private function _btnClickHandler(evt: MouseEvent): void
		{
			switch(evt.target.name)
			{
				case "closeBtn":
					PostBox.send("changeToolBox", {tool: null});
					break;
				default:
			}
		}

		//チャンネルイベント
		public function PB_CHANNEL_event(): void
		{
			var param: Object = PostBox.get("PB_CHANNEL_event");
			switch(param.type)
			{
				case Channel.EVENT_OPEN:
					mxml.loginTextarea.text = param.channelName + " チャンネルを開いています";
					break;
				case Channel.EVENT_LOGIN_SUCCESSED:
					mxml.loginTextarea.text = param.channelName + " チャンネルに接続しています";
					break;
				case Channel.EVENT_CLOSE:
					mxml.loginTextarea.text = param.channelName + " チャンネルを閉じました";
					break;
				case Channel.EVENT_LOGIN_FAILED:
					mxml.loginTextarea.text = param.channelName + " チャンネルへの接続に失敗しました";
					break;
			}
		}

		private function _loginBtnClickHandler(evt: MouseEvent): void
		{
			var channelInfo: Object;
			var owner: Boolean;
			if(loginCh == null)
			{
				//var ch: Object = mxml.chBar.dataProvider.getItemAt(mxml.chBar.selectedIndex);
				//ログイン処理
				loginCh = mxml.chBar.selectedIndex;
				mxml.loginBtn.label = "login";

				channelInfo = mxml.chBar.dataProvider.getItemAt(loginCh);
				mxml.memberList.dataProvider = _memberCollection = Channel.members.getChannelArrayCollection(channelInfo.text);
				PostBox.send("channelCommand", {command: "open", channelName: channelInfo.text, owner: Config.owner});
			}
			else
			{
				//ログアウト処理
				loginCh = null;
				mxml.loginBtn.label = "logout";

				PostBox.send("channelCommand", {command: "close"});
			}
			Lib.dump(mxml.chBar.dataProvider.getItemAt(loginCh));
		}
		private function _updateChBtn(txt: String): void
		{
			/*
			trace("■■■■■■■■■■■■■■■■■■■■■■■■■_updateCh", txt);
			if(txt == null)
			{
				mxml.chBar.enabled = true;
				mxml.loginBtn.label = Config.getText("button", "loginBtn");
			}
			else
			{
				mxml.chBar.enabled = false;
				mxml.loginBtn.label = Config.getText("button", "logoutBtn");
			}
			*/
		}

		//ツール選択メッセージ受け取り
		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			switch(param.tool)
			{
				case "linkTool":
					break;
				default:
					break;
			}
		}

		private function _updateMemberList(): void
		{
			/*
			var i: String;
			for(i in Report.reportTypeList)
			{
				if(i == "calendar") continue;
				_fileTypeCollection.addItem({
					index: Report.reportTypeList[i].index, type: i, name: Report.reportTypeList[i].name, color: Report.reportTypeList[i].color
				});
			}
			mxml.reportTypeList.dataProvider = _fileTypeCollection;
			mxml.reportTypeList.dataProvider.sort = sortType;
			mxml.reportTypeList.dataProvider.refresh();
			*/
		}

		//ファイルアイテムクリック時処理
		private function _chBarClickHandler(evt: MouseEvent): void
		{
			//mxml.chBar.selectedIndex;
			switch(mxml.chBar.selectedIndex)
			{
				case "0"://ファイルアイテムクリック時
					break;
				default:
			}
		}
	}
}
