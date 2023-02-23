package model.plugin.draw.stamptool
{
/*
	スタンプパレットのVCが継承する

*/
	import controller.App;
	import model.plugin.draw.Draw;
	import model.plugin.draw.stamptool.Stamp;
	import common.*;
	import common.storage.*;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	import flash.utils.setTimeout;
	import mx.collections.ArrayCollection;

	public class StampPalletBase extends VC
	{
		public static var stampTool: StampTool;

		[Bindable]
		public var stampFolderCollection: ArrayCollection;
		[Bindable]
		public var stampCollection: ArrayCollection;
		protected var thumbWidth: Number;
		protected var thumbHeight: Number;
		private var _stampBitmapList: Object;//スタンプ画像データリスト
		private var _stampDirElement: XML;//スタンプリスト構造XML

		public function StampPalletBase()
		{
			stampFolderCollection = new ArrayCollection([]);
			stampCollection = new ArrayCollection([]);
			super();
			stampTool = new StampTool();
			_stampDirElement = <directory/>;
			_stampBitmapList = {};
			Stamp.stampElement.appendChild(_stampDirElement);
			//フォルダ初期化
			_createFolderList();
		}

		override protected function init(): void
		{
			mxml.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler);
			mxml.addEventListener(MouseEvent.CLICK, _clickHandler);
			mxml.folderList.dataProvider = stampFolderCollection;
			mxml.stampList.dataProvider = stampCollection;

			setTimeout(selectFolder, 2000);
			function selectFolder(): void
			{
				_selectFolderItem(mxml.folderList.getElementAt(0).folderItem);
			}
		}

		public function PB_changeStamp(): void
		{
			var param: Object = PostBox.get("PB_changeStamp");
			loadStampDirectory(param.dir);
		}

		public function PB_showPallet(): void
		{
			var param: Object = PostBox.get("PB_showPallet");
			if(param.pallet == "stampPallet")
			{

			}
		}
		//スタンプの配置開始イベントハンドラー
		//配置開始でイメージオブジェクト作成
		private function _mouseDownHandler(evt: MouseEvent): void
		{
			evt.stopImmediatePropagation();
			switch(evt.target.name)
			{
				case "stampItem":
					PostBox.send("showPallet", {pallet: "stampPallet", value: "hide"});
					stampTool.createTmpStamp(evt.target.document.data);
					break;
				case "bg":
					_startDrag();
					break;
			}
		}

		private function _clickHandler(evt: MouseEvent): void
		{
			evt.stopImmediatePropagation();
			switch(evt.target.name)
			{
				case "folderItem":
					_selectFolderItem(evt.target);
					break;
			}
		}
		private function _startDrag(): void
		{
			App.mainStage.addEventListener(MouseEvent.MOUSE_UP, _stopDrag);
			mxml.startDrag(false);
			function _stopDrag(e: MouseEvent): void
			{
				App.mainStage.removeEventListener(MouseEvent.MOUSE_UP, _stopDrag);
				mxml.stopDrag();
			}
		}

		//dir
		private function _selectFolderItem(target: Object): void
		{
			_clearSelectItems();
			target.skin.currentState = "upAndSelected";
			target.selected = true;
			loadStampDirectory(target.document.data.name);
		}
		//選択したアイテムを解除する
		private function _clearSelectItems(): void
		{
			var i: uint;
			for(i = 0; i < mxml.folderList.dataProvider.length; i++)
			{
				mxml.folderList.getElementAt(i).folderItem.selected = false;
				mxml.folderList.getElementAt(i).folderItem.skin.currentState = "up";
			}
		}
		//フォルダコレクションに登録してフォルダ切り替えボタンをつくる
		private function _createFolderList(): void
		{
			var folders: Array = [];
			var dir: File = Lib.getAppFileObject("stamp");
			var files : Array = dir.getDirectoryListing();
			var i: int;
			for(i = 0; i < files.length; i++)
			{
				if(files[i].isDirectory)
				{
					stampFolderCollection.addItem(files[i]);
				}
			}
		}
		//スタンプフォルダの画像を読み込んでstampFIleListに追加する
		//非同期
		public function loadStampDirectory(dirName: String, completeFunc: Function = null): void
		{
			var stampFileList: Array = [];
			var dir: File = Lib.getAppFileObject("stamp/" + dirName);
			DirectoryUtils.getFileListInDirectory(dir, completeListing);
			//指定ディレクトリ内のファイルオブジェクトを取得してリスト作成
			//リストから画像を読み込んでasyncLoadImageで順番にスタンプを登録する（非同期ループ
			function completeListing(loadedFiles: Array): void
			{
				//スタンプリストクリア
				stampCollection.removeAll();
				_stampBitmapList = {};
				_stampDirElement = <directory/>;

				//スタンプ登録
				_stampDirElement.@name = dirName;
				var i: uint;
				var imgFile: File;
				if(loadedFiles != null)
				{
					for(i = 0; i < loadedFiles.length; i++)
					{
						imgFile = loadedFiles[i] as File;
						if(imgFile != null)
						{
							if(imgFile.isDirectory == false)
							{
								stampFileList.push(imgFile);
							}
						}
					}
				}
				CommonUtils.asyncLoop(stampFileList.length, asyncLoadImage, asyncLoopComplete);
			}
			//非同期画像読み込んでaddStampする
			function asyncLoadImage(counter: uint, nextCheck: Function): void
			{
				var stampFile: File = stampFileList[counter] as File;
				loadImage(completeLoadImage);
				function loadImage(cmpFnc: Function): void
				{
					ImageUtils.loadImage(stampFile, complete, err, err);
					function complete(loader: Loader, bytes: ByteArray): void
					{
						var bitmapData: BitmapData;
						bitmapData = ImageUtils.cloneImage(loader);
						ImageUtils.unloadImage(loader);
						callCmp(bitmapData);
					}
					function err(): void
					{
						callCmp(null);
					}
					function callCmp(bitmapData: BitmapData): void
					{
						if(cmpFnc != null)
						{
							cmpFnc.call(null, bitmapData);
						}
					}
				}
				function completeLoadImage(bitmapData: BitmapData): void
				{
					if(bitmapData != null)
					{
						addStamp(bitmapData);
					}
					//次の処理へ
					if(nextCheck != null)
					{
						nextCheck.call();
					}
				}
				//非同期で読み込まれた画像をスタンプパレットのリストに追加する
				function addStamp(bitmapData: BitmapData): void
				{
					if(CommonUtils.isEmptyString(stampFile.name)) return;
					_stampDirElement.appendChild(<item name={stampFile.name}/>);
					_stampBitmapList[stampFile.name] = bitmapData;

					//ファイル名順に並べ替え
					var stampItems: XMLList = _stampDirElement.children();
					var itemListArr: Array = new Array();
					var child: XML;
					for each(child in stampItems)
					{
						itemListArr.push({name: child.attribute("name"), data: child});
					}
					itemListArr.sortOn("name", Array.CASEINSENSITIVE);
					var sortedXMLList: XMLList = new XMLList();
					var i: uint;
					for(i = 0; i < itemListArr.length; i++)
					{
						sortedXMLList += itemListArr[i].data;
					}
					_stampDirElement.setChildren(sortedXMLList);

				}
			}
			//完了通知受け取り
			function asyncLoopComplete(): void
			{
				_createThumbs();
				if(completeFunc != null)
				{
					completeFunc.call();
				}
			}
		}

		//パレットリストにサムネイル作成//サムネイルが存在していたら作らない
		private function _createThumbs(): void
		{
			var stamps: XMLList = _stampDirElement.children().(elements("item"));
			if(stamps.length() == 0) return;
			var i: uint;
			for(i = 0; i < stamps.length(); i++)
			{
				var dirName: String = _stampDirElement.@name;
				var stampName: String = stamps[i].@name;
				if(_stampBitmapList.hasOwnProperty(stampName))
				{
					new Stamp(this, stampName, dirName, stamps[i], _stampBitmapList[stampName]);
				}
			}
		}
	}
}
