package common.storage
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.FileListEvent;
	import flash.events.ProgressEvent;
	import flash.events.OutputProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.filesystem.*;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.errors.IllegalOperationError;
	import flash.utils.Timer;
	import flash.utils.ByteArray;

	import common.CommonUtils;

	public class DirectoryUtils
	{
		function DirectoryUtils()
		{
		}

		//ディレクトリ作成
		//ファイル存在チェック機能付
		public static function createDirectory( dir: File, compFunc: Function, errFunc: Function ): void
		{
			//すでに存在していれば終了
			if( dir.exists )
			{
				if( compFunc != null )
				{
					compFunc.call();
				}
				return;
			}

			//３回トライして駄目だったらエラー
			var errorCount: int = 0;
			var dirCreateSuccess: Boolean = false;
			while( dirCreateSuccess==false )
			{
				try
				{
					dir.createDirectory();
					dirCreateSuccess = true;
				}
				catch( error: Error )
				{
					//Log.error( DirectoryUtils, "ERROR DirectoryUtils createDirectory: " + error.errorID + ", " + error.name + ", " + error.message );
					errorCount++;
					if( errorCount > 3 )
					{
						break;
					}
				}
			}

			//エラーのときは終了
			if( dirCreateSuccess==false )
			{
				if( errFunc != null )
				{
					errFunc.call();
				}
				return;
			}

			//ファイルができたか存在チェック
			var delayTimer: Timer = new Timer( 500, 0 );
			delayTimer.addEventListener( TimerEvent.TIMER, delayDirCreateTimerHandler );
			delayTimer.start();

			function delayDirCreateTimerHandler( e: TimerEvent ): void
			{
				if( dir.exists )
				{
					delayTimer.removeEventListener( TimerEvent.TIMER, delayDirCreateTimerHandler );
					delayTimer.stop();
					//完了
					if( compFunc != null )
					{
						compFunc.call();
					}
				}
			}
		}

		//ディレクトリファイル一覧取得
		public static function getFileListInDirectory( directory: File, cmpFnc: Function ): void
		{
			if( directory != null )
			{
				if ( directory.exists )
				{
					directory.addEventListener( FileListEvent.DIRECTORY_LISTING, DirectoryGetListAsyncFunc );
					directory.addEventListener( IOErrorEvent.IO_ERROR , DirectoryGetListAsyncIOErrorFunc );
					directory.getDirectoryListingAsync();
					return;
				}
			}
			callCmp( null );

			function DirectoryGetListAsyncFunc( event: FileListEvent ): void
			{
				var files: Array = event.files;
				directory.removeEventListener( FileListEvent.DIRECTORY_LISTING, DirectoryGetListAsyncFunc );
				directory.removeEventListener( IOErrorEvent.IO_ERROR , DirectoryGetListAsyncIOErrorFunc );
				callCmp( files );
			}

			function DirectoryGetListAsyncIOErrorFunc( event: IOErrorEvent ): void
			{
				directory.removeEventListener( FileListEvent.DIRECTORY_LISTING, DirectoryGetListAsyncFunc );
				directory.removeEventListener( IOErrorEvent.IO_ERROR , DirectoryGetListAsyncIOErrorFunc );
				callCmp( null );
			}

			//完了通知
			function callCmp( list: Array ): void
			{
				if( cmpFnc != null )
				{
					cmpFnc.call( null, list );
				}
			}
		}

		//ディレクトリファイル一覧取得
		public static function getFileListInDirectoryDeeply( directory: File, cmpFnc: Function, resultList: Array=null ): void
		{
			getFileListInDirectory( directory, result );

			function result( files: Array ): void
			{
				var dirList: Array;
				var file: File;
				var i: uint;

				if( files != null )
				{
					dirList = new Array();
					for( i=0; i<files.length; ++i )
					{
						file = files[i];

						//結果格納リスト
						if( resultList == null )
						{
							resultList = new Array();
						}

						if( file.isDirectory )
						{
							dirList.push( file );
						}
						resultList.push( file );
					}

					//下位ディレクトリの探索
					deepDirectory( dirList, callCmp );
				}
				else
				{
					callCmp();
				}
			}

			//下位ディレクトリの探索
			function deepDirectory( dirList: Array, cmpDeepFnc: Function ): void
			{
				var limit: uint;
				var counter: uint;
				var dir: File;

				limit = dirList.length;

				counter = 0;
				proc();

				//処理
				function proc(): void
				{
					if( limit > counter )
					{
						dir = dirList[counter] as File;
						getFileListInDirectoryDeeply( dir, nextCheck, resultList );
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
						callDeepCmp();
					}
					else
					{
						proc();
					}
				}

				//完了通知
				function callDeepCmp(): void
				{
					if( cmpDeepFnc != null )
					{
						cmpDeepFnc.call();
					}
				}
			}

			//完了通知
			function callCmp(): void
			{
				if( cmpFnc != null )
				{
					cmpFnc.call( null, resultList );
				}
			}
		}

		//更新日付順ソート
		public static function sortTimeStampList( allList: Array, newer: Boolean = false ): Array
		{
			if( allList == null )
			{
				return null;
			}

			var i: int;
			var sortList: Array = new Array();
			for ( i=0; i<allList.length; i++ )
			{
				var file: File = allList[i] as File;
				if( file != null )
				{
					var time: Number;

					//更新日付と作成日付の新しい方の日付を取得
					if( newer )
					{
						if ( file.creationDate.getTime() > file.modificationDate.getTime() )
						{
							time = file.creationDate.getTime();
						}
						else
						{
							time = file.modificationDate.getTime();
						}
					}
					else
					{
						time = file.modificationDate.getTime();
					}
					sortList.push( { "time": time, "file": file } );
				}
			}

			sortList.sortOn( "time", Array.DESCENDING|Array.NUMERIC );
			var resultAry: Array=new Array();
			for ( i=0; i<sortList.length; i++ )
			{
				resultAry.push( sortList[i].file );
			}

			return resultAry;
		}
	}
}

