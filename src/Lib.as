package
{
	import common.*;
	import model.*;
	import controller.*;
	import flash.display.*;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.errors.IllegalOperationError;
	import flash.utils.Dictionary;
	import flash.utils.ByteArray;
	import flash.utils.setTimeout;
	import flash.utils.Timer;
	import flash.filesystem.File;
	import flash.geom.Matrix;
	import common.SVGUtils;

	public class Lib
	{
		private static var _myself: Global;
		private static var _internally: Boolean = false;
		private static var _func: *;
		public static var enterFrameFuncs: Dictionary = new Dictionary();

		public static var timerFuncs: Dictionary = new Dictionary();
		public static var timeRate: uint = 25;
		private static var _timer: Timer = new Timer(timeRate);
		public static var startTime: uint;

		public static var notoSansMonoCJKJP: String = "Noto Sans Mono CJK JP Regular";// new NotoSansMonoCJKJP().fontName;
		public function Lib()
		{
			if(!_internally)
			{
				throw new IllegalOperationError("Should not be instantiated!!");
			}
			_internally = false;
		}
		public static function getInstance(): Global
		{
			if(_myself == null)
			{
				_internally = true;
				_myself = new Global();
			}
			return _myself;
		}

		public static function getDateReportID(date: Date): String
		{
			var year: String = String(date.getFullYear());
			var month: String = String(date.getMonth() + 1);
			var day: String = String(date.getDate());
			return year + Lib.digitNum(Number(month), 2) + Lib.digitNum(Number(day), 2);
		}
		//------------------------------------------------------------------------------------------------
		/*
		//フレーム番号 → ミリ秒
		public static function getMsecFromFrame(frameID: uint): Number
		{
			return int(frameID / App.mainStage.frameRate * 1000);
		}
		//フレーム番号 → 1/10秒の数値
		public static function getTsecFromFrame(frameID: uint): Number
		{
			return int(frameID / App.mainStage.frameRate * 10);
		}
		//フレーム番号 → 秒
		public static function getSecFromFrame(frameID: uint): Number
		{
			return Math.floor(frameID / App.mainStage.frameRate);
		}
		//フレーム番号 → 1/10秒単位のフレーム数にする
		public static function formatTsecFlat(frameID: uint): Number
		{
			return Math.ceil(frameID / App.mainStage.frameRate * 10) / 10 * App.mainStage.frameRate;
		}
		//フレーム番号 → 秒単位のフレーム数にする
		public static function formatSecFlat(frameID: uint): Number
		{
			return Math.ceil(frameID / App.mainStage.frameRate) * App.mainStage.frameRate;
		}
		//秒 → フレーム番号
		public static function getFrameFromSec(sec: Number): Number
		{
			return Math.ceil(sec * App.mainStage.frameRate);
		}
		//秒 → フレーム番号
		public static function getTimeTextFromFrame(frameID: uint): Object
		{
			var msec: Number = getMsecFromFrame(frameID);
			return getTimeObject(msec);
		}
		*/
		public static function getTimeObject(msec: uint): Object
		{
			var timeObject: Object = {};
			var sec: Number = int(msec / 1000 % 60);
			var min: Number = int(msec / 1000 / 60);
			timeObject.min = min < 10 ? "0" + String(min) : String(min);
			timeObject.sec = sec < 10 ? "0" + String(sec) : String(sec);
			timeObject.hsec = ("00" + String(msec)).substr(-2, 2);
			return timeObject;
		}
		//1/10秒の数値 → 00:00.0
		public static function getMinTextFormatter(msec: uint): String
		{
			var sec: Number = int(msec / 1000 % 60);
			var min: Number = int(msec / 1000 / 60);
			var tsecTxt: String = String(msec).substr(-3, 1);
			var secTxt: String = sec < 10 ? "0" + String(sec) : String(sec);
			var minTxt: String = min < 10 ? "0" + String(min) : String(min);
			return minTxt + ":" + secTxt + "." + tsecTxt;
		}
		//1/10秒の数値 → 00:00.0
		public static function getMilisecFormatter(msec: Number): String
		{
			var date: Date = new Date(msec);
			var yearTxt: String = String(date.getFullYear());
			var monthTxt: String = String(date.getMonth() + 1);
			var dayTxt: String = String(date.getDate());
			var hourTxt: String = String(date.getHours());
			var minTxt: String = String(date.getMinutes());
			var secTxt: String = String(date.getSeconds());
			return yearTxt + "/" + monthTxt + "/" + dayTxt + " " + hourTxt + ":" + minTxt + ":" + secTxt;
		}

		//------------------------------------------------------------------------------------------------
		//現在のタイムスタンプ取得
		public static function getNowTimeStamp(): Number
		{
			return new Date().getTime();
		}
		//タイマースタート//appスタートで呼び出す//常時動作
		public static function startTimer(): void
		{
			_timer.addEventListener(TimerEvent.TIMER, _timeHandler);
			_timer.start();
		}
		//タイマーストップ//基本的に使用しない
		public static function stopTimer(): void
		{
			_timer.removeEventListener(TimerEvent.TIMER, _timeHandler);
		}
		//常時動作するタイマーのハンドラー
		private static function _timeHandler(evt: Event): void
		{
			for(_func in timerFuncs)
			{
				timerFuncs[_func].call(null, evt);
			}
		}

		//毎time実行される関数を登録する
		public static function addTimerFuncs(func: Function): void
		{
			timerFuncs[func] = func;
		}
		public static function removeTimerFuncs(func: Function): void
		{
			delete timerFuncs[func];
		}

		//------------------------------------------------------------------------------------------------
		//対象targetにSvgを貼り付ける
		//targetのサイズにフィッティングする
		/*
		[Embed(source = "icon_calendartool.svg", mimeType="application/octet-stream")]
		var Svg: Class;
		setSvg(sprite, Svg);
		*/
		public static function setSvg(target: Sprite, Svg: Class): void
		{
			var svgContainer: Sprite = new Sprite();
			var sprite: Sprite = SVGUtils.loadSVG(Svg);
			sprite = fittingSprite(target, sprite);
			target.addChild(sprite);
			target.mouseChildren = false;
		}


		public static function fittingSprite(baseSprite: Sprite, sprite: Sprite): Sprite
		{
			var baseLength: Number = baseSprite.width < baseSprite.height ? baseSprite.height : baseSprite.width;
			var length: Number = sprite.width < sprite.height ? sprite.height : sprite.width;
			if(length != baseLength)
			{
				var scale: Number = baseLength / length;
				sprite.scaleX = scale;
				sprite.scaleY = scale;
			}
			return sprite;
		}
		//最大サイズにフィッティングした画像BitmapDataを返す
		public static function fittingImage(imageLoader: Loader, fitWidth: uint, fitHeight: uint, direction: String = "horizontal"): BitmapData
		{
			var fittingSize: Object = {width: fitWidth, height: fitHeight};
			var imageH: Number = imageLoader.height / imageLoader.width;//画像Wに対するHの割合
			var scale: Number;//縮小率
			var scaleBase: String = imageH > (fitHeight / fitWidth) ? "height" : "width";//基準
			var bmpData: BitmapData;

			//サイズが小さければフィッティングしない
			if(fitWidth > imageLoader.width && fitHeight > imageLoader.height)
			{
				bmpData = ImageUtils.cloneImage(imageLoader);
			}
			else
			{
				scale = fittingSize[scaleBase] / imageLoader[scaleBase];
				var fitW: uint = Math.ceil(imageLoader.width * scale);
				var fitH: uint = Math.ceil(imageLoader.height * scale);
				bmpData = new BitmapData(fitW, fitH);
				bmpData.draw(imageLoader, new Matrix(scale, 0, 0, scale), null, null, null, true);
			}
			return bmpData;
		}
		//最大サイズにフィッティングした画像BitmapDataを返す
		public static function fittingBitmap(image: BitmapData, fitWidth: uint, fitHeight: uint): BitmapData
		{
			if(image == null) return null;
			var container: Object = { width: fitWidth, height: fitHeight }
			var imageH: Number = image.height / image.width;//Wに対するHの割合
			var containerH: Number = container.height / container.width;//パネルWに対するHの割合
			var scale: Number = 1.0;//縮小率
			var scaleBase: String = imageH > containerH ? "height" : "width";//基準
			scale = container[scaleBase] / image[scaleBase];
			var bmpData: BitmapData;
			var fitWidth: uint = Math.ceil(image.width * scale);
			var fitHeight: uint = Math.ceil(image.height * scale);
			bmpData = new BitmapData(fitWidth, fitHeight);
			bmpData.draw(image, new Matrix(scale, 0, 0, scale), null, null, null, true);
			return bmpData;
		}

		//------------------------------------------------------------------------------------------------
		//アプリデータディレクトリからの相対パス指定でファイルオブジェクトを取得
		public static function getAppFileObject(path: String = null): File
		{
			var result: File;
			result = null;
			if(PlatformUtils.osCheck(PlatformUtils.WINDOWS))      result = new File('C:/'+Config.SERVER_DATA_DIRECTORY_NAME);
			else if(PlatformUtils.osCheck(PlatformUtils.ANDROID)) result = File.documentsDirectory.resolvePath(Config.SERVER_DATA_DIRECTORY_NAME);
			else if(PlatformUtils.osCheck(PlatformUtils.IOS))     result = File.documentsDirectory.resolvePath('../Library/Caches/'+Config.SERVER_DATA_DIRECTORY_NAME);
			if(result != null && CommonUtils.isEmptyString(path) == false) result = result.resolvePath(path);
			return result;
		}

		//システムディレクトリからの相対パス指定でファイルオブジェクトを取得
		public static function getSystemFileObject(path: String = null): File
		{
			var result: File;
			result = File.applicationStorageDirectory;
			if(result != null && CommonUtils.isEmptyString(path) == false) result = result.resolvePath(path);
			return result;
		}

		/*
		// 一時保存データディレクトリからの相対パス指定でファイルオブジェクトを取得
		public static function getTemporaryFileObjectByPath(path:String=null): File
		{
			var file: File = getAppStorageFileObjectByPath("tmp");
			if(path != null) file = file.resolvePath(path);
			return file;
		}
		//------------------------------------------------------------------------------------------------
		public static function getReportXML(screen: String, reportID: String = null): XML
		{
			var structure: Array = ["dom", "screen", "panel", "list", "report"];
			var names: Array = ["documentRoot", screen, "drawPanel", "reportMap", reportID];
			return Dom.getElement(structure, names);
		}
		public static function getReport(screen: String, reportID: String = null): Object
		{
			var list: Object;
			var structure: Array = ["dom", "screen", "panel", "list", "report"];
			var names: Array = ["documentRoot", screen, "drawPanel", "reportMap", reportID];
			if(VC.vcList.hasOwnProperty(names.join(".")))
			{
				list = VC.vcList[names.join(".")];
			}
			return list;
		}

		public static function getTemplateElement(elementName: String, vcName: String): XML
		{
			var element: XML = Dom.templateTree[elementName].(attribute("name") == vcName)[0];//xml
			return element.copy();
		}

		//------------------------------------------------------------------------------------------------
		//パスのキーを配列にして返す
		public static function getPathArray(path: String): Array
		{
			path = path.replace(/\.+$/g, "");
			return path.split(".");
		}

		//配列の要素をキーにして空のオブジェクトを返す
		public static function toObject(arr: Array): Object
		{
			var obj: Object = {};
			var i: uint;
			for(i = 0; i < arr.length; i++)
			{
				obj[i] = {};
			}
			return Object;
		}

		public static function setStep(structure: Array, names: Array, flag: Boolean, includeFlag: Boolean = false): void
		{
			var i: uint;
			var path: String;
			var pathList: Array;
			var vcNamePath: String;
			pathList = Dom.getPathList(structure, names);
			if(pathList != null)
			{
				vcNamePath = names.join(".");
				for(i = 0; i < pathList.length; i++)
				{
					path = pathList[i].names.join(".");
					if(VC.vcList.hasOwnProperty(path) && (includeFlag || path != vcNamePath))
					{
						if(VC.vcList[path] != null && VC.vcList[path] != undefined)
						{
							if(flag)
							{
								VC.vcList[path].addStep();
							}
							else
							{
								VC.vcList[path].removeStep();
							}
						}
					}
				}
			}
		}

		//path以下のMCを全削除する
		//path = "app.sharedScreen.contentsPanel"
		public static function removeAllChildrenByPath(path: String): void
		{
			var target: Sprite = getBodyByPath(path);
			if(target == null) return;
			var i: uint;
			for(i = 0; i < target.numChildren; i++)
			{
				while(DisplayObjectContainer(target.getChildAt(i)).numChildren)
				{
					DisplayObjectContainer(target.getChildAt(i)).removeChildAt(0);
				}
			}
		}

		//子MCを全削除する
		public static function removeAllChildren(target: Sprite): void
		{
			if(target == null) return;
			var i: uint;
			for(i = 0; i < target.numChildren; i++)
			{
				while(DisplayObjectContainer(target.getChildAt(i)).numChildren)
				{
					DisplayObjectContainer(target.getChildAt(i)).removeChildAt(0);
				}
			}
		}

		//documentRoot以下のパスからムービークリップを返す
		//path = "app.sharedScreen.contentsPanel"
		//なければnull
		public static function getBodyByPath(path: String): Sprite
		{
			////Log.debug(Lib, "Lib.getBodyByPath >> path: " + path);
			path = path.replace(/\.+$/g, "");
			var arr: Array = path.split(".");
			var target: Sprite = Global.documentRoot;
			var i: uint;
			for(i = 0 ; i < arr.length; i++)
			{
				target = target.getChildByName(arr[i]) as Sprite;
				if(target == null) return null;
			}
			return target;
		}

		//ムービークリップのpathを取得
		public static function getPath(sp: Sprite): String
		{
			var arr: Array = [sp.name];
			getParent(sp);
			return arr.join(".");

			function getParent(sp: Sprite): void
			{
				var parent: Sprite = sp.parent as Sprite;
				if(parent != null)
				{
					if(parent.name == "root1") return;
					arr.unshift(parent.name);
					getParent(parent);
				}
			}
		}

		public static function createAndGetBodyByPath(path: String, width: Number = 0, height: Number = 0): Sprite
		{
			path = path.replace(/\.+$/g, "");
			var arr: Array = path.split(".");
			var target: Sprite = Global.documentRoot;
			var mc: Sprite;
			var i: uint;
			for(i = 0; i < arr.length; i++)
			{
				mc = target.getChildByName(arr[i]) as Sprite;
				if(mc == null)
				{
					mc = new Sprite();
					mc.name = arr[i] as String;

					mc.mouseEnabled = false;
					mc.x = 0;
					mc.y = 0;
					mc.graphics.beginFill(0xffffff, 0.01);
					mc.graphics.drawRect(0, 0, width, height);
					mc.graphics.endFill();

					target.addChildAt(mc,0);
				}
				target = mc;
			}
			return target;
		}

		//targetムービークリップにパネルを作る
		//パネルが存在していたら作らない
		//indexNumが0またはnullで最背面、-1で最前面につくる
		public static function createPanel(path: String, width: Number = 0, height: Number = 0, indexNum: Number = 0): void
		{
			if(path == null) return;
			////Log.debug(Lib, "Lib.createPanel >> path: " + path);
			path = path.replace(/\.+$/g, "");
			var arr: Array = path.split(".");
			var panelName: String = arr.pop();
			var target: Sprite = Global.documentRoot;
			var mc: Sprite;
			var i: uint;
			for(i = 0; i < arr.length; i++)
			{
				if(arr[i] == null) break;
				mc = target.getChildByName(arr[i]) as Sprite;
				if(mc == null)
				{
					mc = new Sprite();
					mc.name = arr[i] as String;
					target.addChildAt(mc, 0);
				}
				target = mc;
			}
			if(target.getChildByName(panelName) == null)
			{
				var panel: Sprite = new Sprite();
				panel.name = panelName as String;
				panel.mouseEnabled = true;
				panel.x = 0;
				panel.y = 0;
				panel.graphics.beginFill(0xffffff, 0.01);
				panel.graphics.drawRect(0, 0, width, height);
				panel.graphics.endFill();
				var idx: uint = indexNum < 0 ? target.numChildren : indexNum;
				target.addChildAt(panel, idx);
				PostBox.messenger("MSG_Lib_createPanel");
			}
		}
		//width, heightからボードの中央寄せする座標を返す
		public static function centeringPoint(w: Number, h: Number, MC: Sprite = null): Object
		{
			var targetW: Number = MC == null ? Config.BOARD_WIDTH : MC.width;
			var targetH: Number = MC == null ? Config.BOARD_HEIGHT : MC.height;
			var point: Object = {};
			point.x = (targetW / 2) - (w / 2);
			point.y = (targetH / 2) - (h / 2);
			return point;
		}

		//メインウィンドウ復活
		public static function restoreMainWindow(): void
		{
			if(NativeWindow.isSupported == false) return;
			var window: NativeWindow = Global.documentRoot.stage.nativeWindow;
			window.restore();
			window.activate();
			setTimeout(delaySetDisplayState, 500);
			function delaySetDisplayState(): void
			{
				if(Global.documentRoot.stage != null && Global.documentRoot.stage.displayState != StageDisplayState.FULL_SCREEN_INTERACTIVE)
				{
					Global.documentRoot.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
				}
			}
		}


		public static function getInvoker(): String
		{
			var res: String;
			var txt: String;
			var list: Array;
			txt = new Error().getStackTrace();
			list = CommonUtils.splitCRLFStringToList(txt);
			res = null;
			if(list != null)
			{
				if(list.length >= 4)
				{
					res = list[3];
					if(list.length >= 5)
					{
						res += list[4];
						if(list.length >= 6)
						{
							res += list[5];
						}
					}
				}
			}
			return res;
		}

		public static function flushBuffer(): void
		{
			PostBox.send("flushBuffer", { buffer: "simple" });
			PostBox.send("flushBuffer", { buffer: "report" });
			PostBox.send("flushSaveBuffer");
			PostBox.send("refreshThumb");
			PostBox.send("objectUnmark");
		}
		*/

		//オブジェクトを複製して返す
		public static function clone(data: *): *
		{
			var byte: ByteArray = new ByteArray();
			byte.writeObject(data);
			byte.position = 0;
			return byte.readObject();
		}

		//0で文字数をそろえた数字文字列を返す
		public static function digitNum(num: Number, digit: Number): String
		{
			var str: String = String(num);
			while (str.length < digit)
			{
				str = "0" + str;
			}
			return str;
		}

		//年月日曜日
		public static function getDateString(date: Date): String
		{
			var weekDayArr: Array = ["日", "月", "火", "水", "木", "金", "土"];
			var year: String = date.getFullYear().toString();
			var month: String = digitNum(date.getMonth() + 1, 2);
			var day: String = digitNum(date.getDate(), 2);
			var week: int = date.getDay();

			return year + "年" + month + "月" + day + "日" + "(" + weekDayArr[week] + ")";
		}
		//xxxx/xx/xx
		public static function getYMDString(date: Date): String
		{
			var year: String = date.getFullYear().toString();
			var month: String = digitNum(date.getMonth() + 1, 2);
			var day: String = digitNum(date.getDate(), 2);

			return year + "/" + month + "/" + day;
		}

		public static function getDateTimeString(dateObj: Date = null, short: Boolean = false): String
		{
			var dateObj: Date = dateObj == null ? new Date() : dateObj;
			var year: String = dateObj.getFullYear().toString();
			var month: String = digitNum(dateObj.getMonth() + 1, 2);
			var date: String = digitNum(dateObj.getDate(), 2);
			var week: String = digitNum(dateObj.getDay(), 2);
			var hours: String = digitNum(dateObj.getHours(), 2);
			var minutes: String = digitNum(dateObj.getMinutes(), 2);
			var seconds: String = digitNum(dateObj.getSeconds(), 2);
			if(short)
			{
				return year + month + date + "_" + hours + minutes;
			}
			else
			{
				return year + month + date + "_" + hours + minutes + seconds;
			}
		}

		public static function getDateTimeFromText(timestamp: String, short: Boolean = false): Date
		{
			var res: Date;
			var reg: RegExp;
			var regRes: Object;
			var year: Number;
			var month: Number;
			var date: Number;
			var hours: Number;
			var min: Number;
			var sec: Number;
			var timeDigit: uint = short ? 4 : 6;

			res = null;
			reg = new RegExp("^[0-9]{8}_[0-9]{" + timeDigit + "}$");
			regRes = reg.exec(timestamp);
			if(regRes != null)
			{
				year    = Number(timestamp.substr(0, 4));
				month   = Number(timestamp.substr(4, 2));
				date    = Number(timestamp.substr(6, 2));
				hours   = Number(timestamp.substr(9, 2));
				min     = Number(timestamp.substr(11, 2));
				if(short == false)
				{
					sec = Number(timestamp.substr(13, 2));
				}
				else
				{
					sec = 0;
				}

				res = new Date(year, month - 1 , date, hours, min, sec)
			}
			return res;
		}

		public static function limitString(str: String, limit: uint, continueStr: String): String
		{
			if(str != null)
			{
				if(str.length >= limit+1)
				{
					str = str.substr(0, limit);
					if(continueStr != null)
					{
						str += continueStr;
					}
				}
			}
			return str;
		}


		/////////////////////////////////////////
		public static function dump(data: Object, indent: Number = 0, outputFnc: Function = null): void
		{
			if(!indent)
			{
				indent = 0;
			}
			if(indent == 0)
			{
				trace("dump--------------------- ↓", outputFnc);
			}
			var space: String = "";
			var key: String;
			for(key in data)
			{
				var value: * = data[key];
				if(typeof(value) == "object")
				{
					space = "";
					for(var i: Number=0; i<indent*8; i++)
					{
						space += " ";
					}
					trace(space +key+" : ("+typeof(value)+") : "+getValue(value), outputFnc);
					indent++;
					dump(value, indent, outputFnc);
					indent --;
				}
				else{
					space = "";
					for(var n: Number = 0; n<indent*8; n++)
					{
						space += " ";
					}
					trace(space +key+" : ("+typeof(value)+") : "+getValue(value), outputFnc);
				}
			}
			if(typeof(data) == "string" || typeof(data) == "number" || typeof(data) == "boolean" || typeof(data) == "undefined" || typeof(data) == "null"){ trace("--------"+" : ("+typeof(data)+") : "+data); }
			if(indent==0)
			{
				trace("------------------------- ↑"+"\n", outputFnc);
			}
			function getValue(value: *): String
			{
				/*
				var bytes: ByteArray;
				bytes = value as ByteArray;
				if(bytes != null)
				{
					return CommonUtils.convertToFileSize(bytes.length);
				}
				*/
				return value;
			}
		}
	}
}
