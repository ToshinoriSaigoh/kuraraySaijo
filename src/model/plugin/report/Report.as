package model.plugin.report
{
/**
 * 複数のページを含んだレポートクラス.
 * ページの操作をする。
 * calendarなど、タイプの異なるレポートはこれを継承して作る。
 *
 * update 2018/01/24
 * Since 2018/01/24
 * @private
 */
	import common.db.DB;
	import common.StorageUtils;
	import common.storage.DirectoryUtils;
	import controller.*;
	import controller.documentroot.reportscreen.DrawContents;
	import model.plugin.draw.Draw;
	import model.plugin.draw.DrawPlayer;
	import model.plugin.network.channel.Channel;
	import flash.filesystem.File;
	import flash.utils.setTimeout;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import mx.collections.ArrayCollection;
	public class Report extends VC
	{
		public static var reportList: Object = [];//開いているレポートthisリスト
		public static var reportMap: Object = {};//開いているレポートthisマップ
		public static var reportTypeList: Object = {//レポート色分け用タイプリスト
			"kuraraysaijo": {name: 0, title: "レポート", color: 0xffffff},
			"calendar": {name: 0, title: "カレンダー", color: 0xffffff},
			"default": {name: 1, title: "ホワイトボード", color: 0xbbbbbb},
			"document": {name: 2, title: "資料", color: 0xeecc00},
			"meeting": {name: 3, title: "ミーティング", color: 0x00bbee},
			"conference": {name: 4, title: "会議", color: 0x009922},
			"trouble": {name: 5, title: "トラブル", color: 0xeeee00},
			"emergency": {name: 6, title: "緊急", color: 0xee0000}
		};

		[Bindable]
		public var playState: String;//現在のステータス(再生中、停止中)
		[Bindable]
		public var id: String;//レポートID
		[Bindable]
		public var reportName: String;//レポート名
		[Bindable]
		public var reportType: String;//reportTypeList.name
		[Bindable]
		public var saveDate: String;
		[Bindable]
		public var baseTime: Number;//レポート中の最初の書き込み時間
		[Bindable]
		public var firstTime: Number;//常に0//スライダー用にバインド
		[Bindable]
		public var lastTime: Number;//スライダー用にバインド
		[Bindable]
		public var nowTime: Number;//現在の時間 1/50秒単位//nowTimeをセットしてplayerでcue()する
		public var playStartTime: Number;//再生開始nowTime
		[Bindable]
		public var playStartTimeStamp: Number;//再生時間計測用
		[Bindable]
		public var dateText: String;//再生日付テキスト
		[Bindable]
		public var timeText: String;//再生時間テキスト
		[Bindable]
		public var totalText: String;//動画トータル時間テキスト

		public var pageList: Object;
		public var pageCollection: ArrayCollection;
		public var maxPageCnt: uint;
		public var viewIndex: uint;//pager操作用index
		public var myDataElement: XML;
		public var reportDir: File;
		public var reportDB: DB;
		public var save: Save;
		public var activePageID: uint;//Page.vcName
		public var openMode: String;//playモードは書き込み禁止
		public var undoList: Object;
		public var redoList: Object;
		public var viewWidth: Number;
		public var viewHeight: Number;

		private var _createdPagesNum: int;
		private var _drawID: uint = 0;

		public function Report(parent: VC, reportID: String, dataElement: XML = null, type: String = "default", mode: String = null)
		{
			maxPageCnt = 30;
			playStartTime = 0;
			playStartTimeStamp = 0;
			id = reportID;
			vcName = reportID;
			elementName = "report";
			reportType = type;
			pageCollection = new ArrayCollection([]);
			pageList = {};
			reportList.push(this);
			reportMap[vcName] = this;
			playState = "stop";
			Draw.drawList[vcName] = {};
			undoList = [];
			redoList = [];
			openMode = mode;
			if(openMode == "play")
			{
				baseTime = dataElement.hasOwnProperty("@baseTime") ? Number(dataElement.@baseTime) : Lib.getNowTimeStamp();
			}
			else
			{
				if(dataElement != null && dataElement.hasOwnProperty("@baseTime") && Number(dataElement.@baseTime) < Lib.getNowTimeStamp())
				{
					baseTime = Number(dataElement.@baseTime);
				}
				else
				{
					baseTime = Lib.getNowTimeStamp();
				}
			}

			//ビューサイズ設定
			viewWidth = Number(Config.get("config", "report", "defaultViewWidth"));
			viewHeight = Number(Config.get("config", "report", "defaultViewHeight"));;
			if(dataElement != null && dataElement.hasOwnProperty("@viewWidth") && dataElement.hasOwnProperty("@viewHeight"))
			{
				viewWidth = Number(dataElement.@viewWidth);
				viewHeight = Number(dataElement.@viewHeight);
			}

			firstTime = 0;
			nowTime = 0;
			super(parent);

			createBody();
			body = mxml.body;

			DrawContents.reportCollection.addItemAt(this, DrawContents.reportCollection.length);
			caller.mxml.drawContentsViewStack.addElement(mxml);//ビューにレポートを登録
			viewIndex = caller.mxml.drawContentsViewStack.getElementIndex(mxml);//ビューのインデックス番号//不要?

			if(dataElement == null)
			{
				myDataElement = getElement();
			}
			else
			{
				myDataElement = dataElement;
			}
			caller.myDataElement.appendChild(myDataElement);
			_init();
		}
		protected function getElement(): XML
		{
			return <{elementName} id={id} name={vcName} type={reportType} baseTime={baseTime.toString()}>
				<record/>
				<page id="0" name="0">
					<layer id="0" name="0"/>
					<layer id="1" name="1"/>
				</page>
			</{elementName}>;
		}
		protected function createBody(): void
		{
			mxml = new ReportBody(this);
		}
		protected function _init(): void
		{
			//lastTime設定
			if(openMode == "play")
			{
				lastTime = Number(myDataElement.@lastTime);
			}
			else if(myDataElement.@lastTime != null && Number(myDataElement.@lastTime) > nowTime)
			{
				lastTime = Number(myDataElement.@lastTime);
			}
			else
			{
				lastTime = getElapsedTime();
			}
			//reportDir作成
			reportDir = getReportDir();
			DirectoryUtils.createDirectory(reportDir.resolvePath("data"), comp, error);
			function comp(): void
			{
				//DB登録
				reportDB = new DB(reportDir, "sync");
				//save作成
				newSave();
				//チャプター作成
				//chapter = new Chapter(myself);
				//createChapters();
				createPages();
			}
			function error(): void
			{
				trace("■ error ■ Report.create comp()");
			}
		}
		protected function newSave(): void
		{
				save = new Save(this as Report);
		}

		public function checkTime(): void
		{
			trace("#", id, baseTime, "f:", firstTime, "n:", nowTime, "l:", lastTime);
		}


		public function getReportDir(): File
		{
			return Lib.getSystemFileObject("report/" + id);
		}
		//レポート完成時処理
		public function creationComplete(): void
		{
			PostBox.send("changePage", {report: vcName, page: getFirstPageID()});
			if(GroupWork.hasOwnWork("GW_openReport"))
			{
				GroupWork.done("GW_openReport");
			}
			else
			{
				PostBox.send("creationCompleteReport", {report: vcName});
			}
			//chapter.changeChapter("0");//movie用
		}

		//
		public function closeReport(fnc: Function = null): void
		{
			trace("■1 Report.closeReport()", id);
			deleteMyself(compDelReport);
			function compDelReport(): void
			{
			trace("■2 Report.compDelReport()", id);
				var n: String;
				if(reportList.length == 0)
				{
					if(fnc != null) fnc.call(null);
				}
			}
		}

		//レポート削除処理
		override public function deleteMyself(compFunc: Function = null): void
		{
			//buffer削除
			DrawPlayer.createBufferMap(id);
			//DB close
			DB.close(reportDB.dbConn);
			//dir削除
			StorageUtils.deleteDirectory(reportDir, deleteFileComplete, true);

			function deleteFileComplete(): void
			{
				var i: uint;
				for(i = 0; i < DrawContents.reportCollection.length; i++)
				{
					if(DrawContents.reportCollection.getItemAt(i).id == id)
					{
						DrawContents.reportCollection.removeItemAt(i);
						break;
					}
				}
				for(i = 0; i < reportList.length; i++)
				{
					if(reportList[i].id == id)
					{
						reportList.removeAt(i);
						break;
					}
				}
				if(reportMap.hasOwnProperty(vcName))
				{
					delete reportMap[vcName];
				}
				//レポートコレクションから削除
				removeStep();
				if(myElement != null) Dom.removeMyself(myElement);
				if(vcList.hasOwnProperty(vcNamePath)) delete vcList[vcNamePath];
				//レポートリストXMLから削除
				delete myDataElement.parent().children()[myDataElement.childIndex()];
				//コンテンツ表示リストから削除
				caller.mxml.drawContentsViewStack.removeElement(mxml);
				if(compFunc != null)
				{
					compFunc.call();
				}
				PostBox.send("deleteCompleteReport", {report: vcName});
			}
		}

		public function setNowTime(time: Number = 0): void
		{
			nowTime = time != 0 ? time : Lib.getNowTimeStamp() - baseTime;
		}
		public function setLastTime(): void
		{
			lastTime = openMode == "play" ? lastTime : getElapsedTime();
		}

		public function getNowTime(): Number
		{
			return openMode == "play" ? lastTime : getElapsedTime();
		}
		//レポート開始baseTimeからの経過時間を返す
		public function getElapsedTime(): Number
		{
			return Lib.getNowTimeStamp() - baseTime;
		}

		//時間表示//DrawPlayer._play()から呼び出す
		public function setDateTimeText(): void
		{
			var date: Date = new Date(baseTime + nowTime);
			dateText = String(date.getFullYear()) + "/" + String(date.getMonth() + 1) + "/" + String(date.getDate());
			timeText = String(date.getHours()) + ":" + String(date.getMinutes()) + ":" + String(date.getSeconds());
		}
		//総時間表示
		public function setTotalText(): void
		{
			totalText = '';
		}

		public function setDrawID(val: uint): void
		{
			_drawID = val;
		}
		public function getDrawID(): String
		{
			_drawID++;
			return String(Channel.myID + "_" + _drawID);
		}

		//ページ操作////////////////////////////////////////////////////
		//レイヤー作成完了ごとにレイヤーから呼び出す
		public function creationCompletePage(): void
		{
			var pageXMLList: XMLList = myDataElement.page;
			if(pageXMLList != null)
			{
				_createdPagesNum++;
				if(pageXMLList.length() == _createdPagesNum)//全ページ作成完了時の処理
				{
					_createdPagesNum = 0;
					var targetPage: Page = pageCollection.getItemAt(0) as Page;
					creationComplete();
				}
			}
		}
		//閉じる
		public function PB_closeReport(): void
		{
			var param: Object = PostBox.get("PB_closeReport");
			if(id != param.report) return;
			deleteMyself();
		}
		//zip圧縮前準備
		public function GW_saveZip_before(): void
		{
			var param: Object = PostBox.get("GW_saveZip_before");
			if(id != param.report)
			{
				GroupWork.done("GW_saveZip_before");
				return;
			}
			GroupWork.done("GW_saveZip_before");
		}
		//zip圧縮
		public function GW_saveZip(): void
		{
			var param: Object = PostBox.get("GW_saveZip");
			if(id != param.report)
			{
				GroupWork.done("GW_saveZip");
				return;
			}
			//_pleaseWait();
			save.saveDataTree(complete);
			function complete(): void
			{
				setTimeout(run, 100);
				function run(): void
				{
					save.saveZip("GW_saveZip");
				}
			}
		}

		public function GW_saveTmpZip(): void
		{
			var param: Object = PostBox.get("GW_saveTmpZip");
			if(id != param.report)
			{
				GroupWork.done("GW_saveTmpZip");
				return;
			}

			save.saveDataTree(complete);
			function complete(): void
			{
				setTimeout(run, 100);
				function run(): void
				{
					save.saveTmpZip("GW_saveTmpZip");
				}
			}
		}

		//ムービー実行
		public function PB_actionMovie(): void
		{
			var param: Object = PostBox.get("PB_actionMovie");
			switch(param.action)
			{
				case "rec":
					//chapter.deleteChapterAfter(String(nowTime));
					//PostBox.send("addChapter", {report: vcName, chapter: String(nowTime)});
					break;
			}
		}

		/********* page **********/
		public function PB_addPage(): void
		{
			var param: Object = PostBox.get("PB_addPage");
			if(vcName != param.report) return;
			_addPage();
		}
		//ページ切り替え
		public function PB_changePage(): void
		{
			PostBox.send("flushBuffer", {buffer: "saveBuffer"});
			var param: Object = PostBox.get("PB_changePage");
			if(param.report != vcName) return;
			changePage(param.page);
			PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: param.report, page: param.panel});
		}

		public function createPages(): void
		{
			var pageXMLList: XMLList = myDataElement.page;
			var i: uint;
			if(pageXMLList != null)
			{
				for(i = 0; i < pageXMLList.length(); i++)
				{
					createPage(pageXMLList[i].@name, pageXMLList[i]);
				}
			}
		}

		//ページ作成
		protected function createPage(pageID: uint, dataElement: XML = null): void
		{
			new Page(this, pageID, dataElement);
		}

		//ページ名指定なしでページ追加
		private function _addPage(): void
		{
			createPage(getNewPageID());
		}

		protected function changePage(pageID: uint): void
		{
			activePageID = pageID;
			var i: uint;
			for(i = 0; i < pageCollection.source.length; i++)
			{
				if(pageCollection.source[i].id == pageID)
				{
					pageCollection.source[i].visible = true;
					if(Draw.activeDrawPanel != pageCollection.source[i])
					{
						Draw.activeDrawPanel = pageCollection.getItemAt(i);
					}
					//録画中のページ移動
					if((Draw.activeDrawPanel.caller.playState == "rec"))
					{
						var record: XML = myDataElement.record[0];
						if(record != null)
						{
							record.appendChild(<operation type="change" frame={String(getNowTime())} page={pageID} layer=""/>);
						}
					}
				}
				else
				{
					pageCollection.source[i].visible = false;
				}
			}
		}

		public function hasOwnPage(pageID: uint): Boolean
		{
			if(myDataElement.page.(attribute("name") == String(pageID))[0] != null)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		//dataXMLtreeから端末内のページリストXMLを取得する
		//有効なページだけ取得する場合はtrue
		public function getPageXMLList(): XMLList
		{
			//myDataElement = caller.myDataElement.report.(attribute("name") == vcName)[0];
			return myDataElement.page;
		}

		public function getNewPageID(): uint
		{
			var pageXMLList: XMLList = getPageXMLList();
			var pageLength: int = pageXMLList.length();
			return pageLength;
		}

		public function getFirstPageID(): uint
		{
			var firstPage: String;
			var pageList: XMLList = getPageXMLList();
			if(pageList.length() > 0)
			{
				firstPage = pageList[0].@name;
			}
			else
			{
				firstPage = null;
			}
			return firstPage as uint;
		}

		public function getNextPageID(pageName: String): uint
		{
			var nextID: String;
			var thisIndex: Number;
			var currentPage: String = pageName;
			var pageXMLList: XMLList = getPageXMLList();
			var pageLength: int = pageXMLList.length();
			var i: int;
			for(i = 0; i < pageLength; i++)
			{
				if(pageXMLList[i].@name == currentPage)
				{
					thisIndex = Number(pageXMLList[i].@name);
					nextID = pageLength - 1 == i ? null : pageXMLList[i + 1].@name;
				}
			}
			return nextID as uint;
		}

		public function getFirstPage(): uint
		{
			var firstPage: String;
			var pageList: XMLList = getPageXMLList();
			if(pageList.length() > 0)
			{
				firstPage = pageList[0].@name;
			}
			else
			{
				firstPage = "0";
			}
			return firstPage as uint;
		}

		public function getPage(pageID: uint): Page
		{
			var i: uint;
			for(i = 0; i < pageCollection.source.length; i++)
			{
				if(pageCollection.source[i].id == pageID)
				{
					return pageCollection.source[i];
				}
			}
			return null;
		}
	}
}
