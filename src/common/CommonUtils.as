package common
{
	import flash.system.ApplicationDomain;
	import flash.text.Font;
	import flash.display.NativeWindow;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.errors.IllegalOperationError;
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.ByteArray;
	import flash.geom.Rectangle;

	public class CommonUtils
	{
		private static var instance: CommonUtils = new CommonUtils();

		//フォント記憶オブジェクト
		private var fonts: Object;

		//コンストラクタ
		function CommonUtils()
		{
			super();
			if( instance != null )
			{
				throw new IllegalOperationError( "Should not be instantiated!!" );
			}
			else
			{
				fonts = new Object();
			}
		}

		//インスタンス取得
		public static function getInstance(): CommonUtils
		{
			return instance;
		}

		//空文字チェック（nullとlength==0）
		public static function isEmptyString( txt: String ): Boolean
		{
			if( txt == null )
			{
				return true;
			}
			else
			{
				if( txt.length == 0 )
				{
					return true;
				}
			}
			return false;
		}

		//空Arrayチェック（nullとlength==0）
		public static function isEmptyArray( list: Array ): Boolean
		{
			if( list == null )
			{
				return true;
			}
			else
			{
				if( list.length == 0 )
				{
					return true;
				}
			}
			return false;
		}

		//遅延実行
		public static function delayRun( delay: uint, fnc: Function, param: Object = null ): void
		{
			var delayTimer: Timer = new Timer( delay, 1 );
			delayTimer.addEventListener( TimerEvent.TIMER_COMPLETE, delayTimerHandler );
			delayTimer.start();

			function delayTimerHandler( e: TimerEvent ): void
			{
				if( fnc != null )
				{
					fnc.call( null, param );
				}
			}
		}

		//遅延実行
		public static function delayRunNoData( delay: uint, fnc: Function ): void
		{
			if( fnc != null )
			{
				delayRun( delay, run );
			}
			function run( param: Object ): void
			{
				fnc.call();
			}
		}

		//遅延指定回数実行
		public static function delayRunNumberOfTimes( delay: uint, time: uint, fnc: Function, param: Object = null ): void
		{
			var counter: uint;
			var delayTimer: Timer;

			if( fnc != null )
			{
				counter = 0;
				delayTimer = new Timer( delay, time );
				delayTimer.addEventListener( TimerEvent.TIMER, delayTimerHandler );
				delayTimer.start();
			}

			function delayTimerHandler( e: TimerEvent ): void
			{
				fnc.call( null, counter, param );
				counter++;
			}
		}

		//単位配列
		private static var units: Array = [" B", " KB", " MB", " GB", " TB"];

		//ファイルサイズ変換処理
		public static function convertToFileSize( size: Number ): String
		{
			for ( var i: int = 0; size > 1024; ++i )
			{
				size /= 1024;
			}
			return Math.round( size * 100 ) / 100 + units[i];
		}

		//日付文字列変換処理( 表示用 )
		public static function convertDateToString( date: Date, flg: Boolean = true ): String
		{
			if( date != null )
			{
				var res: String = zeroPadding( date.fullYear, 4 ) + "/" + zeroPadding( date.month+1, 2 ) + "/" + zeroPadding( date.date, 2 );
				if( flg )
				{
					res += " " + zeroPadding( date.hours, 2 ) + ":" + zeroPadding( date.minutes, 2 ) + ":" + zeroPadding( date.seconds, 2 );
				}
				return res;
			}
			return "null";
		}

		//フォント名取得
		public static function getFontName( class_name: String ): String
		{
			var inst: CommonUtils = getInstance();

			if( inst.fonts.hasOwnProperty( class_name ) )
			{
				return inst.fonts[class_name];
			}

			var loadedFont: Font = new Font();
			var LoadFontClass: Class=ApplicationDomain.currentDomain.getDefinition( class_name ) as Class;
			Font.registerFont( LoadFontClass );
			loadedFont = new LoadFontClass();
			inst.fonts[class_name] = loadedFont.fontName;
			return loadedFont.fontName;
		}

		//ユニークID生成
		public static function generateUniqueID( length: int ): String
		{
			var txt: String = "0123456789abcdefghijklmnopqrstuvwxyz";
			var uni: String = "";
			var i: uint;
			for ( i=0; i<length; ++i )
			{
				uni +=  txt.charAt( Math.floor( Math.random() * txt.length ) );
			}
			return uni;
		}

		//String --> Number 変換
		public static function stringToNumber( txt: String ): Number
		{
			if( isEmptyString( txt ) == false )
			{
				return Number( txt );
			}
			return  0;
		}

		//Boolean --> String 変換
		public static function booleanToString( flg: Boolean ): String
		{
			var res: String;
			if( flg )
			{
				return "1";
			}
			return  "0";
		}

		//String --> Boolean 変換
		public static function stringToBoolean( txt: String ): Boolean
		{
			var res: Boolean;
			res = false;
			if( isEmptyString( txt ) == false )
			{
				if( txt == "1" )
				{
					res = true;
				}
			}
			return  res;
		}

		//Date --> String 変換（主にセーブデータ・番号付け用に変換）
		public static function dateToString( d: Date ): String
		{
			var res: String = "";
			if( d != null )
			{
				res += zeroPadding( d.fullYear, 4 );
				res += zeroPadding( d.month + 1, 2 );
				res += zeroPadding( d.date, 2 );
				res += zeroPadding( d.hours, 2 );
				res += zeroPadding( d.minutes, 2 );
				res += zeroPadding( d.seconds, 2 );
				res += zeroPadding( d.milliseconds, 3 );
			}
			else
			{
				res = "null";
			}
			return res;
		}

		//String --> Date（主にセーブデータ・番号付け用を変換）
		public static function stringToDate( txt: String ): Date
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
			var msec: Number;

			res = null;
			reg = new RegExp( "^[0-9]{17}$" );
			regRes = reg.exec( txt );
			if( regRes != null )
			{
				year    = Number( txt.substr( 0, 4 ) );
				month   = Number( txt.substr( 4, 2 ) );
				date    = Number( txt.substr( 6, 2 ) );
				hours   = Number( txt.substr( 8, 2 ) );
				min     = Number( txt.substr( 10, 2 ) );
				sec     = Number( txt.substr( 12, 2 ) );
				msec    = Number( txt.substr( 14, 3 ) );

				res = new Date( year, month - 1 , date, hours, min, sec, msec )
			}
			return res;
		}

		//Date --> String
		public static function dateYMDToString( date: Date, dataDelimiter: String=" ", dateDelimiter: String="-", timeDelimiter: String=":" ): String
		{
			var res: String;
			if( date != null )
			{
				res  = date.fullYear + dateDelimiter + zeroPadding( ( date.month+1 ), 2 ) + dateDelimiter + zeroPadding( date.date, 2 );
				res += dataDelimiter;
				res += zeroPadding( date.hours, 2 ) + timeDelimiter + zeroPadding( date.minutes, 2 ) + timeDelimiter + zeroPadding( date.seconds, 2 );
				return res;
			}
			return "";
		}

		//String --> Date（主にセーブデータ・番号付け用を変換）
		public static function stringToDateYMD( txt: String, dataDelimiter: String=" ", dateDelimiter: String="-", timeDelimiter: String=":" ): Date
		{
			var res: Date;
			var dataList: Array;
			var dl: Array;
			var tl: Array;
			if( txt != null )
			{
				dataList = txt.split( dataDelimiter );
				if( dataList.length >= 2 )
				{
					dl = dataList[0].split( dateDelimiter );
					tl = dataList[1].split( timeDelimiter );
					if( dl.length >= 3 && tl.length >= 3 )
					{
						res = new Date( Number( dl[0] ), Number( dl[1] )-1, Number( dl[2] ), Number( tl[0] ), Number( tl[1] ), Number( tl[2] ) );
					}
				}
			}
			return res;
		}

		//任意の区切り文字で区切られた文字列をリスト化
		public static function stringToList( str: String, delimiter: String, type: String ): Array
		{
			var res: Array;
			var tmp: Array;
			var i: uint;
			res = null;
			if( isEmptyString( str ) == false )
			{
				tmp = str.split( delimiter );
				if( type == "uint" )
				{
					res = new Array();
					for( i=0; i<tmp.length; ++i )
					{
						res.push( uint( tmp[i] ) );
					}
				}
				else
				{
					res = tmp;
				}
			}
			return res;
		}

		//ゼロ埋め
		public static function zeroPadding( number: Number, size: uint ): String
		{
			var txt: String = number.toString( 10 );
			if( txt.length > size )
			{
				txt = txt.substr( -size, size );
			}
			while ( txt.length < size ) {
				txt = "0" + txt;
			}
			return txt;
		}

		//ゼロ埋め
		public static function zeroPaddingString( txt: String, size: uint ): String
		{
			if( txt.length > size )
			{
				txt = txt.substr( -size, size );
			}
			while ( txt.length < size ) {
				txt = "0" + txt;
			}
			return txt;
		}

		//日付比較
		//a == b :  0
		//a <  b :  1
		//a >  b : -1
		public static function compareDate( a: Date, b: Date ): int
		{
			if( a == null && b != null )
			{
				return 1;
			}
			if( a != null && b == null )
			{
				return -1;
			}
			if( a.getTime() < b.getTime() )
			{
				return 1;
			}
			if( a.getTime() > b.getTime() )
			{
				return -1;
			}
			return 0;
		}

		/**
		 * 2つのDateクラスの差を求め、日、時、分、秒、ミリ秒、を取得
		 * @data1 ターゲットDate
		 * @data2 対象Date
		 * @debug トレース出力有り無し
		 * @return Object d, h, m, s, msが入っている。
		 *
		 * @example :
		 *  <listing version="3.0">
		 *  //現在の時刻から2012/1/1 0: 0: 0 までの差( 日/時/分/秒/ミリ秒 )を求める
		 *  import com.romatica.utils.DateUtil;
		 *  var nowDate : Date = new Date();
		 *  var trgDate : Date = new Date( 2011, 1 - 1, 1, 0, 0, 0, 0 );
		 *  var diffDate : Object = DateUtil.diff( trgDate, nowDate, true );
		 *  //trace( "[残り]"  + diffDate["d"]+"日 "
		 *  					+ diffDate["h"]+"時間 "
		 *  					+ diffDate["m"]+"分 "
		 *  					+ diffDate["s"]+"秒 "
		 *  					+ diffDate["ms"]+"ミリ秒 " );
		 *  </listing>
		 */
		public static function diffDate( date1: Date, date2: Date, debug: Boolean = false ): Object
		{
			if( debug )trace( "-　DIFF DATE　---------------------------" );
			var obj: Object=new Object();
			var trg1MillSecond : Number = date1.getTime();
			var trg2MillSecond : Number = date2.getTime();

			if( debug )trace( "	[ " +date2.getFullYear()+"."
									+( date2.getMonth()+1 )+"."
									+date2.getDate()+" / "
									+date2.getHours()+":"
									+date2.getMinutes()+":"
									+date2.getSeconds()+":"
									+date2.getMilliseconds()+" ]"+"　から" );

			if( debug )trace( "	[ " +date1.getFullYear()+"."
									+( date1.getMonth()+1 )+"."
									+date1.getDate()+" / "
									+date1.getHours()+":"
									+date1.getMinutes()+":"
									+date1.getSeconds()+":"
									+date1.getMilliseconds()+" ]"+"　まで、残り" );

			var diffMillSec : Number = trg1MillSecond - trg2MillSecond;//残り総ミリ秒
			var diffDate : int = diffMillSec / ( 24*60*60*1000 );//残り総日数
			var diffHour : int = diffMillSec / ( 60*60*1000 );//残り総時間
			var diffMin : int = diffMillSec / ( 60*1000 );//残り総分
			var diffSec : int = diffMillSec / 1000;//残り総秒

			//-----------------------------------------------------------------
			//
			//　　総時間から残りの、日、時、分、秒、ミリ秒に変換
			//
			obj["d"] = diffDate;
			obj["h"] = int( diffHour - ( diffDate * 24 ) );
			obj["m"] = int( diffMin - ( diffHour * 60 ) );
			obj["s"] = int( diffSec - ( diffMin * 60 ) );
			obj["ms"] = int( diffMillSec - ( diffSec * 1000 ) );

			if( debug )trace( "	[　"+obj["d"]+"日 "
									+obj["h"]+"時間 "
									+obj["m"]+"分 "
									+obj["s"]+"秒 "
									+obj["ms"]+"ミリ秒"+" ]" );

			return obj;
		}

		//秒から時：分：秒文字列に変換変換
		public static function convertSecondsToHMSString( seconds: uint ): String
		{
			var date_obj: Date = new Date( seconds * 1000 );
			var time: String= "";
			time += CommonUtils.zeroPadding( date_obj.getUTCHours(), 2 );
			time += ":";
			time += CommonUtils.zeroPadding( date_obj.getMinutes(), 2 );
			time += ":";
			time += CommonUtils.zeroPadding( date_obj.getSeconds(), 2 );
			return time;
		}

		//テキストの整数データ（10進）から int の Arrayを生成
		public static function parseIntArray( txt: String, partsLength: int ): Array
		{
			var i: uint;
			var res: Array;
			var dataLength: uint;
			var dataStr: String;
			var data: int;

			res = new Array();
			if( isEmptyString( txt ) == false )
			{
				dataLength = int( txt.length / partsLength );
				for( i=0; i<dataLength; ++i )
				{
					dataStr = txt.substr( i*partsLength, partsLength );
					data = parseInt( dataStr );
					res.push( data );
				}
			}
			return res;
		}

		//テキストの整数データ（10進）から uint の Arrayを生成
		public static function parseUintArray( txt: String, partsLength: int ): Array
		{
			var i: uint;
			var res: Array;
			var dataLength: uint;
			var dataStr: String;
			var data: uint;

			res = new Array();
			if( isEmptyString( txt ) == false )
			{
				dataLength = int( txt.length / partsLength );
				for( i=0; i<dataLength; ++i )
				{
					dataStr = txt.substr( i*partsLength, partsLength );
					data = uint( dataStr );
					res.push( data );
				}
			}
			return res;
		}

		//テキストの整数データ（10進）から Number の Arrayを生成
		public static function parseNumberArray( txt: String, partsLength: int ): Array
		{
			var i: uint;
			var res: Array;
			var dataLength: uint;
			var dataStr: String;
			var data: Number;

			res = new Array();
			if( isEmptyString( txt ) == false )
			{
				dataLength = int( txt.length / partsLength );
				for( i=0; i<dataLength; ++i )
				{
					dataStr = txt.substr( i*partsLength, partsLength );
					data = new Number( dataStr );
					res.push( data );
				}
			}
			return res;
		}

		//テキストの整数データ（16進）から uint の Arrayを生成
		public static function parseHexArray( txt: String, partsLength: int ): Array
		{
			var i: uint;
			var res: Array;
			var dataLength: uint;
			var dataStr: String;
			var data: uint;

			res = new Array();
			if( isEmptyString( txt ) == false )
			{
				dataLength = int( txt.length / partsLength );
				for( i=0; i<dataLength; ++i )
				{
					dataStr = txt.substr( i*partsLength, partsLength );
					data = uint( "0x"+dataStr );
					res.push( data );
				}
			}
			return res;
		}

		//文字を切り出しArrayを生成
		public static function parseStrArray( txt: String, partsLength: int ): Array
		{
			var i: uint;
			var res: Array;
			var dataLength: uint;
			var dataStr: String;

			res = new Array();
			if( isEmptyString( txt ) == false )
			{
				dataLength = int( txt.length / partsLength );
				for( i=0; i<dataLength; ++i )
				{
					dataStr = txt.substr( i*partsLength, partsLength );
					res.push( dataStr );
				}
			}
			return res;
		}

		//ディスプレイオブジェクトのコピー
		//WAS Flash 9 bug where returned scale9Grid is 20x larger than assigned
		//rect.x /= 20, rect.y /= 20, rect.width /= 20, rect.height /= 20;
		public static function duplicateDisplayObject( target: DisplayObject ): DisplayObject
		{
			var targetClass: Class;
			var duplicate: DisplayObject;
			var className: String;

			targetClass = Object( target ).constructor;
			duplicate = new targetClass();
			duplicate.blendMode = target.blendMode;
			duplicate.transform = target.transform;
			duplicate.filters = target.filters;
			duplicate.cacheAsBitmap = target.cacheAsBitmap;
			duplicate.opaqueBackground = target.opaqueBackground;

			if ( target.scale9Grid )
			{
				var rect: Rectangle = target.scale9Grid;
				duplicate.scale9Grid = rect;
			}

			copyGraphics( target, duplicate );

			return duplicate;
		}

		//Graphicsのコピー
		public static function copyGraphics( src: DisplayObject, dst: DisplayObject ): void
		{
			var srcShape: Shape;
			var dstShape: Shape;
			var srcSprite: Sprite;
			var dstSprite: Sprite;

			srcShape = src as Shape;
			dstShape = dst as Shape;
			if( srcShape != null && dstShape != null )
			{
				dstShape.graphics.copyFrom( srcShape.graphics );
			}

			srcSprite = src as Sprite;
			dstSprite = dst as Sprite;
			if( srcSprite != null && dstSprite != null )
			{
				dstSprite.graphics.copyFrom( srcSprite.graphics );
			}
		}

		//直下の子オブジェクトをremoveChildAt
		public static function removeAllChildrenOf( doc: DisplayObjectContainer, removeProc: Function = null ): void
		{
			var dispObj: DisplayObject;
			if( doc != null )
			{
				if( doc.numChildren!=0 )
				{
					var k: int = doc.numChildren;
					while( k -- )
					{
						dispObj = doc.removeChildAt( k );
						if( removeProc != null )
						{
							removeProc.call( null, dispObj );
						}
					}
				}
			}
		}

		//直下子オブジェクトをremoveChildAtした時に呼ばれるデフォルトの処理
		//bitmap, loaderの削除処理に対応
		//例: CommonUtils.removeAllChildrenOf( container, CommonUtils.removeChildDefaultProcess );
		public static function removeChildDefaultProcess( dispObj: DisplayObject ): void
		{
			var bmp: Bitmap;
			var bmpData: BitmapData;
			var loader: Loader;

			//ビットマップの場合
			bmp = dispObj as Bitmap;
			if( bmp != null )
			{
				bmpData = bmp.bitmapData;
				bmpData.dispose();
				bmpData = null;
			}

			//ローダの場合
			loader = dispObj as Loader;
			if( loader && loader.content )
			{
				bmp = loader.content as Bitmap;
				if( bmp != null )
				{
					bmpData = bmp.bitmapData;
					bmpData.dispose();
					bmpData = null;
					loader.unload();
					loader = null;
				}
				else
				{
					loader.unload();
					loader = null;
				}
			}
		}

		//自分自身をremoveChild
		public static function removeFromParent( dispObj: DisplayObject ): void
		{
			if( dispObj != null )
			{
				if( dispObj.parent != null )
				{
					dispObj.parent.removeChild( dispObj );
				}
			}
		}
		/*
		//NativeWindow閉じる処理
		public static function closeNativeWindow( nw: NativeWindow ): void
		{
			if( nw != null )
			{
				removeAllChildrenOf( nw.stage );
				nw.close();
				nw = null;
			}
		}
		*/

		//ランダムなint作成
		public static function getRandomInt( minNum: int, maxNum: int ): int
		{
			var rndNum: int = Math.floor( Math.random()*( maxNum-minNum+1 ) )+minNum;
			return rndNum;
		}

		//ランダムなint作成
		//数字の範囲
		//parentSet : 数字の母集団
		//listSize  : 抽出する数字の個数
		public static function getRandomIntUniqueArray( parentSet: Array, listSize: uint ): Array
		{
			var i: uint;
			var find: Boolean;
			var index: uint;
			var numList: Array = new Array();
			var resultList: Array = new Array();
			if( parentSet.length < listSize )
			{
				listSize = parentSet.length;
			}
			for( i=0;i<listSize;++i )
			{
				find=false;
				while( find==false )
				{
					index = CommonUtils.getRandomInt( 0, parentSet.length-1 );
					if( numList.indexOf( index ) == -1 )
					{
						find = true;
						numList.push( index );
						resultList.push( parentSet[index] );
					}
				}
			}
			return resultList;
		}

		//LoaderのBitmapデータを削除
		public static function deleteBitmapFromLoader( loader: Loader ): void
		{
			var bmp: Bitmap = loader.content as Bitmap;
			if( bmp != null )
			{
				var bmpData: BitmapData = bmp.bitmapData;
				bmpData.dispose();
				bmpData = null;
				bmp = null;
			}
		}

		//ハッシュの指定プロパティ値を取得
		public static function getPropertyValue( obj: Object, key: String, defaultValue: * ): *
		{
			if( hasOwnPropertyCheck( obj, key ) )
			{
				return obj[key];
			}
			return defaultValue;
		}

		//ハッシュに指定のプロパティがあるかどうか
		public static function hasOwnPropertyCheck( obj: Object, key: String ): Boolean
		{
			if( obj != null )
			{
				if( isEmptyString( key ) === false )
				{
					if( obj.hasOwnProperty( key ) )
					{
						return true;
					}
				}
			}
			return false;
		}

		//ハッシュに指定のプロパティがあるかどうか
		//またそのハッシュ値が空文字でないかのチェック
		public static function hasOwnPropertyNotEmptyString( obj: Object, key: String ): Boolean
		{
			if( hasOwnPropertyCheck( obj, key ) )
			{
				if( isEmptyString( obj[key] ) === false )
				{
					return true;
				}
			}
			return false;
		}

		//ハッシュに指定のプロパティがすべてあるか
		public static function hasOwnPropertyInList( obj: Object, plist: Array ): Boolean
		{
			var i: uint;
			if( obj != null )
			{
				if( plist != null )
				{
					for( i=0; i<plist.length; ++i )
					{
						if( obj.hasOwnProperty( plist[i] ) === false )
						{
							return false;
						}
					}
				}
				return true;
			}
			return false;
		}

		//ハッシュに指定のプロパティの削除
		public static function deleteProperty( obj: Object, key: String ): void
		{
			if( hasOwnPropertyCheck( obj, key ) )
			{
				delete obj[key];
			}
		}

		//オブジェクトクローン
		public static function cloneObject( obj: Object, option: Object = null ): Object
		{
			var bytes: ByteArray;
			if( obj != null )
			{
				bytes = new ByteArray();
				bytes.writeObject( obj );
				bytes.position = 0;
				return bytes.readObject();
			}
			return null;
		}

		//ハッシュにプロパティをマージ
		//BのプロパティをAにマージする
		//targetList を指定すると、そのキーのみをコピーする
		//Aのプロパティを上書きされたくない場合は ignoreListA にキーを追加
		//Bのプロパティをコピーしたくない場合は ignoreListB にキーを追加
		public static function shallowMergeObject( objA: Object, objB: Object, option: Object = null ): void
		{
			var key: String;
			var addFlg: Boolean;
			var targetList: Array;
			var ignoreListA: Array;
			var ignoreListB: Array;

			//nullチェック
			if( objA != null && objB != null )
			{
				//オプションチェック
				if( option != null )
				{
					if( option.hasOwnProperty( "targetList" ) )
					{
						targetList = option["targetList"] as Array;
					}
					if( option.hasOwnProperty( "ignoreListA" ) )
					{
						ignoreListA = option["ignoreListA"] as Array;
					}
					if( option.hasOwnProperty( "ignoreListB" ) )
					{
						ignoreListB = option["ignoreListB"] as Array;
					}
				}

				//マージ
				for( key in objB )
				{
					addFlg = true;

					//targetListが指定されていているがリスト内に存在しないときは追加しない
					if( targetList != null )
					{
						if( targetList.indexOf( key ) == -1 )
						{
							addFlg = false;
						}
					}
					//無視リスト
					if( ignoreListA != null )
					{
						if( ignoreListA.indexOf( key ) != -1 )
						{
							addFlg = false;
						}
					}
					if( ignoreListB != null )
					{
						if( ignoreListB.indexOf( key ) != -1 )
						{
							addFlg = false;
						}
					}

					if( addFlg )
					{
						objA[key] = objB[key];
					}
				}
			}
		}

		//オブジェクトの要素数を返す
		public static function getObjectNum( obj: Object ): uint
		{
			var res: uint;
			var key: String;

			res = 0;

			if( obj != null )
			{
				for( key in obj )
				{
					res++;
				}
			}

			return res;
		}

		//ハッシュキーリストと値をtraceに表示
		public static function tracePropertyList( obj: Object, valueVisible: Boolean = false, limit: uint=0, startTxt: String = null, endTxt: String = null, outputFnc: Function = null ): void
		{
			var i: uint;
			var key: String;
			var keyList: Array;
			var objStr: String;
			var bytes: ByteArray;

			if( startTxt != null )
			{
				output( startTxt, outputFnc );
			}

			if( obj != null )
			{
				keyList = new Array();
				for( key in obj )
				{
					keyList.push( key );
				}
				keyList.sort();

				if( valueVisible == false )
				{
					for( i=0; i<keyList.length; ++i )
					{
						key = keyList[i];
						output( key, outputFnc );
					}
				}
				else
				{
					for( i=0; i<keyList.length; ++i )
					{
						key = keyList[i];

						bytes = obj[key] as ByteArray;
						if( bytes == null )
						{
							if( obj[key] != null )
							{
								objStr = obj[key].toString();
							}
							else
							{
								objStr = "null";
							}

							if( limit > 0 && objStr != null )
							{
								output( key+":"+objStr.substring( 0, limit ), outputFnc );
							}
							else
							{
								output( key+":"+objStr, outputFnc );
							}
						}
						else
						{
							output( key+": binary data "+convertToFileSize( bytes.length ), outputFnc );
						}
					}
				}
			}
			else
			{
				output( "null", outputFnc );
			}
			if( endTxt != null )
			{
				output( endTxt, outputFnc );
			}
		}

		//ログ出力
		public static function output( txt: String, outputFnc: Function = null ): void
		{
			if( outputFnc == null )
			{
				trace( txt );
			}
			else
			{
				outputFnc.call( null, txt );
			}
		}


		//ビットマップを指定サイズに中央フィッティングする
		public static function fitBitmapInView( bmp: Bitmap, viewWidth: Number, viewHeight: Number ): void
		{
			var resizeData: Object;
			var bmpData: BitmapData;
			if( bmp != null )
			{
				if( bmp.bitmapData != null )
				{
					bmpData = bmp.bitmapData;
					resizeData = calcFitSizeInView( bmpData.width, bmpData.height, viewWidth, viewHeight );
					bmp.x = resizeData.x
					bmp.y = resizeData.y
					bmp.scaleX = bmp.scaleY = 1.0;
					bmp.scaleX = bmp.scaleY = resizeData.scale;
				}
			}
		}

		//ビットマップを指定サイズに中央フィッティングする
		public static function calcFitSizeInView( orgWidth: Number, orgHeight: Number, viewWidth: Number, viewHeight: Number ): Object
		{
			var res: Object = new Object;
			res.x      = 0;
			res.y      = 0;
			res.width  = 0;
			res.height = 0;
			res.scale  = 1.0;

			var xper: Number = orgWidth / viewWidth;
			var yper: Number = orgHeight / viewHeight;
			if( xper < yper )
			{
				res.width = orgWidth / yper;
				res.height = orgHeight / yper;
				res.x = -( res.width-viewWidth )/2;
				res.scale = 1 / yper;
			}
			else
			{
				res.width = orgWidth / xper;
				res.height = orgHeight / xper;
				res.y = -( res.height-viewHeight )/2;
				res.scale = 1 / xper;
			}
			return res;
		}

		//矩形指定の拡大縮小平行移動値計算
		public static function calcZoomByRect(
												baseWidth: Number,
												baseHeight: Number,
												viewX: Number,
												viewY: Number,
												viewWidth: Number,
												viewHeight: Number,
												minScale: Number,
												maxScale: Number
												): Object
		{
			var res: Object;
			var targetLength: Number;
			var baseLength: Number;
			var scale: Number;
			var baseWidth: Number;
			var baseHeight: Number;
			var tmpWidth: Number;
			var tmpHeight: Number;
			var tmpX: Number;
			var tmpY: Number;
			var centerX: Number;
			var centerY: Number;

			//デフォルト値
			res = new Object;
			res.x      = 0;
			res.y      = 0;
			res.scale  = 1.0;

			//中心計算
			centerX = viewX + viewWidth / 2;
			centerY = viewY + viewHeight / 2;

			//基準の長さを決定
			if( viewWidth > viewHeight )
			{
				targetLength = viewWidth;
				baseLength = baseWidth;
			}
			else
			{
				targetLength = viewHeight;
				baseLength = baseHeight;
			}

			//拡大率と拡大した後の領域を計算
			scale = baseLength / targetLength;
			if( scale>maxScale )
			{
				scale = maxScale;
			}
			else if( scale<minScale )
			{
				scale = minScale;
			}
			tmpWidth  = baseWidth / scale;
			tmpHeight = baseHeight / scale;

			//拡大している矩形の左上隅の座標を計算
			tmpX = centerX - tmpWidth / 2;
			tmpY = centerY - tmpHeight / 2;

			res.x    = -tmpX * scale;
			res.y    = -tmpY * scale;
			res.scale=  scale;
			return res;
		}


		//ボタンデフォルト設定
		public static function setDefaultButtonMode( btn: Sprite, flg: Boolean=true ): void
		{
			if( btn != null )
			{
				btn.useHandCursor = flg;
				btn.buttonMode    = flg;
				btn.mouseEnabled  = flg;
				btn.mouseChildren = false;
				btn.focusRect     = false;
			}
			else
			{
				//trace( "Common Utils ERROR setDefaultButtonMode btn is null!" );
			}
		}

		//ボタンデフォルト設定
		public static function setDefaultButtonModeList( btnList: Array, flg: Boolean=true ): void
		{
			var i: uint;
			var tmpBtn: MovieClip;
			if( btnList != null )
			{
				for ( i=0; i<btnList.length; ++i )
				{
					tmpBtn = btnList[i] as MovieClip;
					setDefaultButtonMode( tmpBtn, flg );
				}
			}
		}

		//一定時間イベントリスナーを無効化する
		public static function disableEventTimer( e: Event, handler: Function, span: uint ): void
		{
			var target: EventDispatcher;
			target = e.currentTarget as EventDispatcher;
			disableEventTimerFor( target, e.type, handler, span );
		}

		//一定時間イベントリスナーを無効化する
		public static function disableEventTimerFor( target: EventDispatcher, type: String, handler: Function, span: uint ): void
		{
			if( target != null )
			{
				target.removeEventListener( type, handler );
				delayRun( span, run );
			}
			function run( param: Object ): void
			{
				target.addEventListener( type, handler );
			}
		}

		//全角スペースを半角スペースに変換
		public static function convertHalfWidthSpace( str: String ): String
		{
			var reg: RegExp = new RegExp( "　", "ig" );
			str = str.replace( reg, " " );
			return str;
		}

		//改行コードを取り除く
		public static function stripReturnCode( str: String ): String
		{
			if( str == null ) return null;
			var reg: RegExp = new RegExp( "(\\r|\\n)", "ig" );
			str = str.replace( reg, "" );
			return str;
		}

		//数字全角→半角変換
		public static function zenkakuConvert( str: String ): String
		{
			var zenkaku: Array = new Array( "０", "１", "２", "３", "４", "５", "６", "７", "８", "９" );
			var returnStr: String = "";
			var i: uint;
			for( i=0;i<str.length;++i )
			{
				if( zenkaku.indexOf( str.substr( i, 1 ) )>-1 )
				{
					returnStr += zenkaku.indexOf( str.substr( i, 1 ) );
				}
				else
				{
					returnStr += str.substr( i, 1 );
				}
			}
			return returnStr;
		}

		//半角数字→全角数字変換
		public static function hankakuToZenkakuConvert( str: String ): String
		{
			var zenkaku: Array = new Array( "０", "１", "２", "３", "４", "５", "６", "７", "８", "９" );
			var hankaku: Array = new Array( "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" );
			var returnStr: String = "";
			var i: uint;
			var index: int;
			var oneStr: String;
			for( i=0;i<str.length;++i )
			{
				oneStr = str.substr( i, 1 );
				index = hankaku.indexOf( oneStr );
				if( index >= 0 )
				{
					returnStr += zenkaku[index];
				}
				else
				{
					returnStr += oneStr;
				}
			}
			return returnStr;
		}

		//数字全角→半角変換
		//数値以外が入っている場合: null
		public static function onlyNumberConvert( str: String ): String
		{
			var zenkaku: Array = new Array( "０", "１", "２", "３", "４", "５", "６", "７", "８", "９" );
			var hankaku: Array = new Array( "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "." );
			var space: Array = new Array( " ", "　" );
			var returnStr: String = "";
			var oneStr: String;
			var i: uint;
			for( i=0;i<str.length;++i )
			{
				oneStr = str.substr( i, 1 );
				if( zenkaku.indexOf( oneStr )>-1 )
				{
					returnStr += zenkaku.indexOf( oneStr );
				}
				else if( oneStr == "．" )
				{
					returnStr += ".";
				}
				else if( hankaku.indexOf( oneStr )>-1 )
				{
					returnStr += oneStr;
				}
				else if( space.indexOf( oneStr )>-1 )
				{
					//空白を削除
				}
				else
				{
					returnStr = null;
					break;
				}
			}
			return returnStr;
		}

		//通し番号を埋めた配列を返す
		//endNumをオーバーすると
		//
		public static function fillNumberAry( length: uint, startNum: uint=0, endNum: uint=0 ): Array
		{
			var res: Array = new Array();
			var i: uint;
			for( i=0;i<length;++i )
			{
				if( endNum != 0 )
				{
					if( endNum >= startNum+i )
					{
						res.push( startNum+i );
					}
				}
				else
				{
					res.push( startNum+i );
				}
			}
			return res;
		}


		//配列単純比較
		public static function arrayDiff( aryA: Array, aryB: Array ): Boolean
		{
			//trace( "arrayDiff A"+aryA.toString() );
			//trace( "arrayDiff B"+aryB.toString() );
			var i: uint;
			if( aryA.length != aryB.length )
			{
				return false;
			}
			for( i=0; i<aryA.length; ++i )
			{
				if( aryA[i] != aryB[i] )
				{
					return false;
				}
			}
			return true;
		}

		//配列内容比較
		public static function arrayContentsDiff( aryA: Array, aryB: Array ): Boolean
		{
			//trace( "arrayDiff A"+aryA.toString() );
			//trace( "arrayDiff B"+aryB.toString() );
			var i: uint;
			var j: uint;
			var find: Boolean;
			if( aryA.length != aryB.length )
			{
				return false;
			}
			for( i=0; i<aryA.length; ++i )
			{
				find = false;
				for( j=0; j<aryB.length; j++ )
				{
					if( aryA[i] == aryB[j] )
					{
						find = true;
					}
				}
				if( find == false )
				{
					return false;
				}
			}
			return true;
		}

		//重複する配列要素を削除
		public static function uniqueArray( array: Array ): Array
		{
			var res: Array;
			var hashObj: Object;
			var num: uint;
			var i: uint;
			var value: Object;

			res = new Array();
			hashObj = new Object();
			num = array.length;

			for( i = 0; i<num; ++i )
			{
				value = array[i];
				hashObj["HID"+value] = false;
			}
			for( i = 0; i<num; ++i )
			{
				value = array[i];
				if( hashObj["HID"+value] == false )
				{
					hashObj["HID"+value] = true;
					res.push( value );
				}
			}
			return res;
		}

		//配列要素拡張
		public static function expandArray( array: Array, length: uint, fillData: * ): Array
		{
			var i: uint;
			var addCount: uint;

			if( array == null )
			{
				array = new Array();
			}

			if( array.length < length )
			{
				addCount = length - array.length;
				for( i = 0; i < addCount; i++ )
				{
					array.push( fillData );
				}
			}

			return array;
		}

		//区切り文字が最後についていなければ付けて返却
		public static function addSeparator( str: String, sep: String="/" ): String
		{
			var reg: RegExp;
			var res: Object;

			if( isEmptyString( str ) == false )
			{
				reg = new RegExp( escape( sep )+"$" );
				res = reg.exec( str );
				if( res == null )
				{
					str += sep;
				}
			}
			else
			{
				str = sep;
			}
			return str;
		}

		//区切り文字が最後についていれば削除して返却
		public static function delLastSeparator( str: String, sep: String="/" ): String
		{
			var reg: RegExp;
			var res: String;

			if( isEmptyString( str ) == false )
			{
				reg = new RegExp( escape( sep )+"$" );
				res = str.replace( reg, "" );
			}
			return res;
		}

		//正規表現エスケープ
		public static function escape( value: String ): String
		{
			if( value == null )
			{
				return null;
			}
			return value.replace( /(?=(\(|\)|\^|\$|\\|\.|\*|\+|\?|\[|\]|\{|\}|\|))/g, "\\" );
		}

		//改行コードを統一
		public static function unifyLineFeedCode( str: String ): String
		{
			var CR: String = String.fromCharCode( 13 );
			var LF: String = String.fromCharCode( 10 );
			str = str.split( CR+LF ).join( LF );
			str = str.split( CR ).join( LF );
			return str;
		}

		//改行コードで区切られた文字列をリスト化
		public static function splitCRLFStringToList( str: String ): Array
		{
			var res: Array;
			var reg: RegExp;
			var LF: String = String.fromCharCode( 10 );

			if( isEmptyString( str ) == false )
			{
				str = unifyLineFeedCode( str );
				res = str.split( LF );
			}
			return res;
		}

		//文字の前後の全角半角空白タブ文字を削除
		public static function trimSpaceAndTabString( str: String ): String
		{
			var res: String;
			var reg: RegExp;
			res = str;
			if( isEmptyString( res ) == false )
			{
				reg = new RegExp( "^[\\s　]+", "g" );
				res = res.replace( reg, "" );
				reg = new RegExp( "[\\s　]+$", "g" );
				res = res.replace( reg, "" );
			}
			return res;
		}

		//ヒットテスト
		public static function hitTestList( list: Array, posX: Number, posY: Number ): DisplayObject
		{
			var i: uint;
			var target: DisplayObject;
			if( list != null )
			{
				for( i=0; i<list.length; ++i )
				{
					target = list[i] as DisplayObject;
					if( target != null )
					{
						if( target.hitTestPoint( posX, posY, false ) )
						{
							return target;
						}
					}
				}
			}
			return null;
		}

		//レイヤー間移動
		public static function moveLayer( target: DisplayObject, list: Array, upLayer: DisplayObjectContainer, downLayer: DisplayObjectContainer, ignoreList: Array = null ): void
		{
			var i: uint;
			var j: uint;
			var dispObj: DisplayObject;
			var moveFlg: Boolean;
			if( target != null && list != null )
			{
				for ( i=0; i<list.length; ++i )
				{
					moveFlg = false;
					dispObj = list[i] as DisplayObject;
					if( ignoreList != null )
					{
						for ( j=0; j<ignoreList.length; ++j )
						{
							if( dispObj == ignoreList[j] )
							{
								moveFlg = false;
							}
						}
					}
					if( moveFlg )
					{
						if( dispObj.parent != null && downLayer != dispObj.parent )
						{
							dispObj.parent.removeChild( dispObj );
						}

						if( target == dispObj )
						{
							upLayer.addChild( dispObj );
						}
						else if( dispObj.parent == null )
						{
							downLayer.addChild( dispObj );
						}
					}
				}
			}
		}

		//拡張子変換
		public static function convertExtension( path: String, ext: String, addExtFlag: Boolean=true ): String
		{
			var res: String;
			var matches: Array;
			var reg: RegExp;
			var regRes: Object;
			var cnvFlg: Boolean;
			reg = new RegExp( "^(.*)\\.([^\\.]*)$", "g" );
			regRes = reg.exec( path );

			if( CommonUtils.isEmptyString( ext ) )
			{
				return path;
			}

			cnvFlg = false;
			if( regRes != null )
			{
				matches = regRes as Array;
				if( matches != null )
				{
					if( matches.length >= 3 )
					{
						res = matches[1] + "." + ext;
						cnvFlg = true;
					}
				}
			}
			if( cnvFlg == false && addExtFlag )
			{
				res = path + "." + ext;
			}
			return res;
		}

		//近似値のIndexを返す
		public static function approximateIndex( list: Array, value: Number ): int
		{
			var i: uint;
			var res: int;
			var min: Number;
			var diff: Number;
			res = -1;
			min = Number.MAX_VALUE;
			for( i=0; i<list.length; ++i )
			{
				diff = Math.abs( list[i] - value );
				if( min > diff )
				{
					min = diff;
					res = i;
				}
			}
			return res;
		}

		//非同期ループ
		public static function asyncLoop( limit: uint, asyncFnc: Function, cmpFnc: Function ): void
		{
			var counter: uint;

			counter = 0;
			if( asyncFnc != null )
			{
				proc();
			}
			else
			{
				callCmp();
			}

			//処理
			function proc(): void
			{
				if( limit > counter )
				{
					asyncFnc.call( null, counter, nextCheck );
					return;
				}
				callCmp();
			}

			//継続判定
			function nextCheck(): void
			{
				counter++;
				if( limit <= counter )
				{
					callCmp();
				}
				else
				{
					proc();
				}
			}

			//完了通知
			function callCmp(): void
			{
				if( cmpFnc != null )
				{
					cmpFnc.call();
				}
			}
		}
	}
}