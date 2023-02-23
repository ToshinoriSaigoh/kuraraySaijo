package common.storage
{
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.FileListEvent;
	import flash.events.ProgressEvent;
	import flash.events.OutputProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.errors.IOError;
	import flash.errors.IllegalOperationError;
	import flash.utils.Timer;
	import flash.utils.ByteArray;

	import common.*;

	public class FileUtils
	{
		public static function isExists( file: File, refreshFlg: Boolean=false ): Boolean
		{
			if( file != null )
			{
				if( refreshFlg )
				{
					file = new File( file.nativePath );
				}
				if( file.exists )
				{
					return true;
				}
			}
			return false;
		}

		//イベント設定
		private static function setEvents( dispacher: EventDispatcher, flag: Boolean, compHandler: Function, ioErrorHandler: Function, securityErrorHandler: Function, progressHandler: Function ): void
		{
			if( dispacher == null ) return;
			if( flag )
			{
				if( compHandler != null ) dispacher.addEventListener( Event.COMPLETE, compHandler );
				if( ioErrorHandler != null ) dispacher.addEventListener( IOErrorEvent.IO_ERROR, ioErrorHandler );
				if( securityErrorHandler != null ) dispacher.addEventListener( SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler );
				if( progressHandler != null ) dispacher.addEventListener( OutputProgressEvent.OUTPUT_PROGRESS, progressHandler );
			}
			else
			{
				if( compHandler != null ) dispacher.removeEventListener( Event.COMPLETE, compHandler );
				if( ioErrorHandler != null ) dispacher.removeEventListener( IOErrorEvent.IO_ERROR, ioErrorHandler );
				if( securityErrorHandler != null ) dispacher.removeEventListener( SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler );
				if( progressHandler != null ) dispacher.removeEventListener( OutputProgressEvent.OUTPUT_PROGRESS, progressHandler );
			}
		}

		//テキスト読み込み
		public static function loadTextFile( file: File, cmpFnc: Function ): void
		{
			var stream: FileStream;
			if( file != null )
			{
				if( file.exists )
				{
					//Log.debug( FileUtils, "loadTextFile: exists: "+file.nativePath );
					stream = new FileStream();
					setEvents( stream, true, compHandler, ioErrorHandler, securityErrorHandler, null );
					stream.openAsync( file, FileMode.READ );
				}
				else
				{
					//Log.debug( FileUtils, "loadTextFile: not exists: "+file.nativePath );
					callCmp( StorageUtils.FILE_NOT_FOUND, null );
				}
			}
			else
			{
				//Log.debug( FileUtils, "loadTextFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL, null );
			}

			//読み込み完了
			function compHandler( e: Event ): void
			{
				var txt: String;
				setEvents( stream, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				txt = stream.readUTFBytes( stream.bytesAvailable );
				stream.close();
				stream = null;
				//Log.debug( FileUtils, "loadTextFile: load complete: "+file.nativePath );
				callCmp( StorageUtils.OK, txt );
			}

			//読み込みエラー
			function ioErrorHandler( e: Event ): void
			{
				setEvents( stream, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				stream.close();
				stream = null;
				//Log.error( FileUtils, "loadTextFile: io error: "+file.nativePath );
				callCmp( StorageUtils.IO_ERROR, null );
			}

			//読み込みエラー
			function securityErrorHandler( e: Event ): void
			{
				setEvents( stream, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				stream.close();
				stream = null;
				//Log.error( FileUtils, "loadTextFile: security error: "+file.nativePath );
				callCmp( StorageUtils.SECURITY_ERROR, null );
			}

			//完了通知
			function callCmp( res: String, txt: String ): void
			{
				if( cmpFnc != null )
				{
					cmpFnc.call( null, res, txt );
				}
			}
		}

		//バイナリ読み込み
		public static function loadBinaryFile( file: File, cmpFnc: Function ): void
		{
			var stream: FileStream;
			if( file != null )
			{
				if( file.exists )
				{
					//Log.debug( FileUtils, "loadBinaryFile: exists: "+file.nativePath );
					stream = new FileStream();
					setEvents( stream, true, compHandler, ioErrorHandler, securityErrorHandler, null );
					stream.openAsync( file, FileMode.READ );
				}
				else
				{
					//Log.debug( FileUtils, "loadBinaryFile: not exists: "+file.nativePath );
					callCmp( StorageUtils.FILE_NOT_FOUND, null );
				}
			}
			else
			{
				//Log.debug( FileUtils, "loadBinaryFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL, null );
			}

			//読み込み完了
			function compHandler( e: Event ): void
			{
				var bytes: ByteArray = new ByteArray();
				setEvents( stream, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				stream.readBytes( bytes, stream.position, stream.bytesAvailable );
				stream.close();
				stream = null;
				//Log.debug( FileUtils, "loadBinaryFile: load complete: "+file.nativePath );
				callCmp( StorageUtils.OK, bytes );
			}

			//読み込みエラー
			function ioErrorHandler( e: Event ): void
			{
				setEvents( stream, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				stream.close();
				stream = null;
				//Log.error( FileUtils, "loadBinaryFile: io error: "+file.nativePath );
				callCmp( StorageUtils.IO_ERROR, null );
			}

			//読み込みエラー
			function securityErrorHandler( e: Event ): void
			{
				setEvents( stream, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				stream.close();
				stream = null;
				//Log.error( FileUtils, "loadBinaryFile: security error: "+file.nativePath );
				callCmp( StorageUtils.SECURITY_ERROR, null );
			}

			//完了通知
			function callCmp( res: String, bytes: ByteArray ): void
			{
				if( cmpFnc != null )
				{
					cmpFnc.call( null, res, bytes );
				}
			}
		}

		//オブジェクト読み込み
		public static function loadObjectFile( file: File, cmpFnc: Function ): void
		{
			var stream: FileStream;
			if( file != null )
			{
				if( file.exists )
				{
					//Log.debug( FileUtils, "loadObjectFile: exists: "+file.nativePath );
					stream = new FileStream();
					setEvents( stream, true, compHandler, ioErrorHandler, securityErrorHandler, null );
					stream.openAsync( file, FileMode.READ );
				}
				else
				{
					//Log.debug( FileUtils, "loadObjectFile: not exists: "+file.nativePath );
					callCmp( StorageUtils.FILE_NOT_FOUND, null );
				}
			}
			else
			{
				//Log.debug( FileUtils, "loadObjectFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL, null );
			}

			//読み込み完了
			function compHandler( e: Event ): void
			{
				var obj: Object;
				setEvents( stream, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				obj = stream.readObject();
				stream.close();
				stream = null;
				//Log.debug( FileUtils, "loadObjectFile: load complete: "+file.nativePath );
				callCmp( StorageUtils.OK, obj );
			}

			//読み込みエラー
			function ioErrorHandler( e: Event ): void
			{
				setEvents( stream, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				stream.close();
				stream = null;
				//Log.error( FileUtils, "loadObjectFile: io error: "+file.nativePath );
				callCmp( StorageUtils.IO_ERROR, null );
			}

			//読み込みエラー
			function securityErrorHandler( e: Event ): void
			{
				setEvents( stream, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				stream.close();
				stream = null;
				//Log.error( FileUtils, "loadObjectFile: security error: "+file.nativePath );
				callCmp( StorageUtils.SECURITY_ERROR, null );
			}

			//完了通知
			function callCmp( res: String, obj: Object ): void
			{
				if( cmpFnc != null )
				{
					cmpFnc.call( null, res, obj );
				}
			}
		}

		//テキストファイル保存
		public static function saveTextFile( file: File, txt: String, cmpFnc: Function, fileMode: String=FileMode.WRITE ): void
		{
			var stream: FileStream;
			if( file != null )
			{
				if( txt == null )
				{
					txt = "";
				}

				stream = new FileStream();
				if( txt.length > 0 )
				{
					setEvents( stream, true, null, ioErrorHandler, securityErrorHandler, progressHandler );
					stream.openAsync( file, FileMode.WRITE );
					stream.writeUTFBytes( txt );
				}
				else
				{
					try
					{
						stream.open( file, FileMode.WRITE );
						stream.writeUTFBytes( txt );
						stream.close();
						stream = null;
						//Log.debug( FileUtils, "saveTextFile: save complete: "+file.nativePath );
						callCmp( StorageUtils.OK );
					}
					catch( e: IOError )
					{
						//Log.error( FileUtils, "saveTextFile: io error: "+file.nativePath );
						callCmp( StorageUtils.IO_ERROR );
					}
					catch( e: SecurityError )
					{
						//Log.error( FileUtils, "saveTextFile: security error: "+file.nativePath );
						callCmp( StorageUtils.SECURITY_ERROR, null );
					}
				}
			}
			else
			{
				//Log.debug( FileUtils, "saveTextFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL );
			}

			//書き込み完了
			function progressHandler( e: OutputProgressEvent ): void
			{
				if( e.bytesPending == 0 )
				{
					setEvents( stream, false, null, ioErrorHandler, securityErrorHandler, progressHandler );
					stream.close();
					stream = null;
					//Log.debug( FileUtils, "saveTextFile: save complete: "+file.nativePath );
					callCmp( StorageUtils.OK );
				}
			}

			//書き込みエラー
			function ioErrorHandler( e: Event ): void
			{
				setEvents( stream, false, null, ioErrorHandler, securityErrorHandler, progressHandler );
				stream.close();
				stream = null;
				//Log.error( FileUtils, "saveTextFile: io error: "+file.nativePath );
				callCmp( StorageUtils.IO_ERROR );
			}

			//書き込みエラー
			function securityErrorHandler( e: Event ): void
			{
				setEvents( stream, false, null, ioErrorHandler, securityErrorHandler, progressHandler );
				stream.close();
				stream = null;
				//Log.error( FileUtils, "saveTextFile: security error: "+file.nativePath );
				callCmp( StorageUtils.SECURITY_ERROR, null );
			}

			//完了通知
			function callCmp( res: String ): void
			{
				if( cmpFnc != null )
				{
					cmpFnc.call( null, res );
				}
			}
		}

		//バイナリファイル保存
		public static function saveBinaryFile( file: File, ba: ByteArray, cmpFnc: Function, fileMode: String=FileMode.WRITE ): void
		{
			var stream: FileStream;
			if( file != null )
			{
				if( ba == null )
				{
					ba = new ByteArray();
				}

				stream = new FileStream();
				if( ba.length > 0 )
				{
					setEvents( stream, true, null, ioErrorHandler, securityErrorHandler, progressHandler );
					stream.openAsync( file, FileMode.WRITE );
					stream.writeBytes( ba );
				}
				else
				{
					try
					{
						stream.open( file, FileMode.WRITE );
						stream.writeBytes( ba );
						stream.close();
						//Log.debug( FileUtils, "saveByteFile: save complete: "+file.nativePath );
						callCmp( StorageUtils.OK );
					}
					catch( e: IOError )
					{
						//Log.error( FileUtils, "saveByteFile: io error: "+file.nativePath );
						callCmp( StorageUtils.IO_ERROR );
					}
					catch( e: SecurityError )
					{
						//Log.error( FileUtils, "saveByteFile: security error: "+file.nativePath );
						callCmp( StorageUtils.SECURITY_ERROR, null );
					}
				}
			}
			else
			{
				//Log.debug( FileUtils, "saveByteFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL );
			}

			//書き込み完了
			function progressHandler( e: OutputProgressEvent ): void
			{
				if( e.bytesPending == 0 )
				{
					setEvents( stream, false, null, ioErrorHandler, securityErrorHandler, progressHandler );
					stream.close();
					stream = null;
					//Log.debug( FileUtils, "saveByteFile: save complete: "+file.nativePath );
					callCmp( StorageUtils.OK );
				}
			}

			//書き込みエラー
			function ioErrorHandler( e: Event ): void
			{
				setEvents( stream, false, null, ioErrorHandler, securityErrorHandler, progressHandler );
				stream.close();
				stream = null;
				//Log.error( FileUtils, "saveByteFile: io error: "+file.nativePath );
				callCmp( StorageUtils.IO_ERROR );
			}

			//書き込みエラー
			function securityErrorHandler( e: Event ): void
			{
				setEvents( stream, false, null, ioErrorHandler, securityErrorHandler, progressHandler );
				stream.close();
				stream = null;
				//Log.error( FileUtils, "saveByteFile: security error: "+file.nativePath );
				callCmp( StorageUtils.SECURITY_ERROR, null );
			}

			//完了通知
			function callCmp( res: String ): void
			{
				if( cmpFnc != null )
				{
					cmpFnc.call( null, res );
				}
			}
		}

		//オブジェクトファイル保存
		public static function saveObjectFile( file: File, obj: Object, cmpFnc: Function, fileMode: String=FileMode.WRITE ): void
		{
			var stream: FileStream;
			if( file != null )
			{
				if( obj == null )
				{
					obj = new Object();
				}

				stream = new FileStream();
				setEvents( stream, true, null, ioErrorHandler, securityErrorHandler, progressHandler );
				stream.openAsync( file, FileMode.WRITE );
				stream.writeObject( obj );
			}
			else
			{
				//Log.debug( FileUtils, "saveObjectFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL );
			}

			//書き込み完了
			function progressHandler( e: OutputProgressEvent ): void
			{
				if( e.bytesPending == 0 )
				{
					setEvents( stream, false, null, ioErrorHandler, securityErrorHandler, progressHandler );
					stream.close();
					stream = null;
					//Log.debug( FileUtils, "saveObjectFile: save complete: "+file.nativePath );
					callCmp( StorageUtils.OK );
				}
			}

			//書き込みエラー
			function ioErrorHandler( e: Event ): void
			{
				setEvents( stream, false, null, ioErrorHandler, securityErrorHandler, progressHandler );
				stream.close();
				stream = null;
				//Log.error( FileUtils, "saveObjectFile: io error: "+file.nativePath );
				callCmp( StorageUtils.IO_ERROR );
			}

			//書き込みエラー
			function securityErrorHandler( e: Event ): void
			{
				setEvents( stream, false, null, ioErrorHandler, securityErrorHandler, progressHandler );
				stream.close();
				stream = null;
				//Log.error( FileUtils, "saveObjectFile: security error: "+file.nativePath );
				callCmp( StorageUtils.SECURITY_ERROR, null );
			}

			//完了通知
			function callCmp( res: String ): void
			{
				if( cmpFnc != null )
				{
					cmpFnc.call( null, res );
				}
			}
		}

		//ファイル削除
		public static function deleteFile( file: File, cmpFnc: Function ): void
		{
			if( file != null )
			{
				if( file.exists )
				{
					setEvents( file, true, compHandler, ioErrorHandler, securityErrorHandler, null );
					file.deleteFileAsync();
				}
				else
				{
					//Log.debug( FileUtils, "deleteFile: not exists: "+file.nativePath );
					callCmp( StorageUtils.FILE_NOT_FOUND );
				}
			}
			else
			{
				//Log.debug( FileUtils, "deleteFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL );
			}

			//削除完了
			function compHandler( e: Event ): void
			{
				setEvents( file, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				//Log.debug( FileUtils, "deleteFile: delete complete: "+file.nativePath );
				callCmp( StorageUtils.OK );
			}

			//削除エラー
			function ioErrorHandler( e: Event ): void
			{
				setEvents( file, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				//Log.error( FileUtils, "deleteFile: io error: "+file.nativePath );
				callCmp( StorageUtils.IO_ERROR );
			}

			//削除エラー
			function securityErrorHandler( e: Event ): void
			{
				setEvents( file, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				//Log.error( FileUtils, "deleteFile: security error: "+file.nativePath );
				callCmp( StorageUtils.SECURITY_ERROR, null );
			}

			//完了通知
			function callCmp( res: String ): void
			{
				if( cmpFnc != null )
				{
					cmpFnc.call( null, res );
				}
			}
		}

		//ディレクトリ削除
		public static function deleteDirectory( directory: File, cmpFnc: Function, deleteDirectoryContents: Boolean=false ): void
		{
			if( directory != null )
			{
				if( directory.exists )
				{
					setEvents( directory, true, compHandler, ioErrorHandler, securityErrorHandler, null );
					directory.deleteDirectoryAsync( deleteDirectoryContents );
				}
				else
				{
					//Log.debug( FileUtils, "deleteDirectory: not exists: "+directory.nativePath );
					callCmp( StorageUtils.FILE_NOT_FOUND );
				}
			}
			else
			{
				//Log.debug( FileUtils, "deleteDirectory: directory is null" );
				callCmp( StorageUtils.FILE_IS_NULL );
			}

			//削除完了
			function compHandler( e: Event ): void
			{
				setEvents( directory, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				trace( FileUtils, "deleteDirectory: delete complete: "+directory.nativePath );
				callCmp( StorageUtils.OK );
			}

			//削除エラー
			function ioErrorHandler( e: Event ): void
			{
				setEvents( directory, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				trace( FileUtils, "deleteDirectory: io error: "+directory.nativePath );
				callCmp( StorageUtils.IO_ERROR );
			}

			//削除エラー
			function securityErrorHandler( e: Event ): void
			{
				setEvents( directory, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				trace( FileUtils, "deleteFile: security error: "+directory.nativePath );
				callCmp( StorageUtils.SECURITY_ERROR, null );
			}

			//完了通知
			function callCmp( res: String ): void
			{
				if( cmpFnc != null )
				{
					cmpFnc.call( null, res );
				}
			}
		}

		//ファイルコピー
		public static function copyFile( src: File, dst: File, cmpFnc: Function, overwrite: Boolean=false ): void
		{
			if( src != null && dst != null )
			{
				if( src.exists )
				{
					setEvents( src, true, compHandler, ioErrorHandler, securityErrorHandler, null );
					src.copyToAsync( dst, overwrite );
				}
				else
				{
					//Log.debug( FileUtils, "copyFile: not exists: "+src.nativePath );
					callCmp( StorageUtils.FILE_NOT_FOUND );
				}
			}
			else
			{
				//Log.debug( FileUtils, "copyFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL );
			}

			//コピー完了
			function compHandler( e: Event ): void
			{
				setEvents( src, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				//Log.debug( FileUtils, "copyFile: copy complete: "+src.nativePath+" -> "+dst.nativePath );
				callCmp( StorageUtils.OK );
			}

			//コピーエラー
			function ioErrorHandler( e: Event ): void
			{
				setEvents( src, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				//Log.error( FileUtils, "copyFile: io error: "+src.nativePath+" -> "+dst.nativePath );
				callCmp( StorageUtils.IO_ERROR );
			}

			//コピーエラー
			function securityErrorHandler( e: Event ): void
			{
				setEvents( src, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				//Log.error( FileUtils, "copyFile: security error: "+src.nativePath+" -> "+dst.nativePath );
				callCmp( StorageUtils.SECURITY_ERROR, null );
			}

			//完了通知
			function callCmp( res: String ): void
			{
				if( cmpFnc != null )
				{
					cmpFnc.call( null, res );
				}
			}
		}

		//ファイル移動
		public static function moveFile( src: File, dst: File, cmpFnc: Function, overwrite: Boolean=false ): void
		{
			if( src != null && dst != null )
			{
				if( src.exists )
				{
					setEvents( src, true, compHandler, ioErrorHandler, securityErrorHandler, null );
					src.moveToAsync( dst, overwrite );
				}
				else
				{
					//Log.debug( FileUtils, "moveFile: not exists: "+src.nativePath );
					callCmp( StorageUtils.FILE_NOT_FOUND );
				}
			}
			else
			{
				//Log.debug( FileUtils, "moveFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL );
			}

			//移動完了
			function compHandler( e: Event ): void
			{
				setEvents( src, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				//Log.debug( FileUtils, "moveFile: move complete: "+src.nativePath+" -> "+dst.nativePath );
				callCmp( StorageUtils.OK );
			}

			//移動エラー
			function ioErrorHandler( e: Event ): void
			{
				setEvents( src, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				//Log.error( FileUtils, "moveFile: io error: "+src.nativePath+" -> "+dst.nativePath );
				callCmp( StorageUtils.IO_ERROR );
			}

			//移動ーエラー
			function securityErrorHandler( e: Event ): void
			{
				setEvents( src, false, compHandler, ioErrorHandler, securityErrorHandler, null );
				//Log.error( FileUtils, "moveFile: security error: "+src.nativePath+" -> "+dst.nativePath );
				callCmp( StorageUtils.SECURITY_ERROR, null );
			}

			//完了通知
			function callCmp( res: String ): void
			{
				if( cmpFnc != null )
				{
					cmpFnc.call( null, res );
				}
			}
		}

		//ベースパスを削除
		public static function splitBasePath( base: String, target: String ): String
		{
			var reg: RegExp;
			if( base != null&& target != null )
			{
				reg = new RegExp( base, "ig" );
				return target.replace( reg, "" );
			}
			return null;
		}

		//ディレクトリ取得
		public static function getCurrentDirectoryPath( str: String, ds: String="/" ): String
		{
			var matches: Array = new Array();
			var reg: RegExp = new RegExp( "( ^.*"+CommonUtils.escape( ds )+" )" );
			var res: Object = reg.exec( str );
			if ( res != null )
			{
				return String( res[1] );
			}
			return null;
		}

		//ファイル名切り出し
		public static function getFileName( file: File ): String
		{
			if( file != null )
			{
				var str: String = file.url;
				return getFileNameStr( str );
			}
			return null;
		}

		//ファイル名切り出し( String版 )
		public static function getFileNameStr( str: String, ds: String="/" ): String
		{
			var matches: Array = new Array();
			var reg: RegExp = new RegExp( CommonUtils.escape( ds )+"( [^"+CommonUtils.escape( ds )+"]* )$" );
			var res: Object = reg.exec( str );
			if ( res != null )
			{
				if( res.length >= 1 )
				{
					return res[1];
				}
			}
			return null;
		}

		//拡張子を取得
		public static function getExtension( fileName: String ): String
		{
			var reg: RegExp;
			var resReg: Object;
			var res: String;

			res = null;
			if( CommonUtils.isEmptyString( fileName ) == false )
			{
				reg = new RegExp( "\\.( [^\\.]* )$" );
				resReg = reg.exec( fileName );
				if( resReg != null )
				{
					if( resReg.length >= 1 )
					{
						res = resReg[1];
					}
				}
			}
			return res;
		}

		//拡張子を削除
		public static function removeExtension( fileName: String ): String
		{
			var reg: RegExp;
			var res: String;

			res = fileName;
			if( CommonUtils.isEmptyString( fileName ) == false )
			{
				reg = new RegExp( "\.[^\.]*$" );
				res = fileName.replace( reg, "" );
			}
			return res;
		}
	}
}