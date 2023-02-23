package common.storage
{
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
	import flash.errors.IllegalOperationError;
	import flash.utils.Timer;
	import flash.utils.ByteArray;

	import common.*;

	public class MemoryFileUtils
	{
		private var data: Object;

		//コンストラクタ
		function MemoryFileUtils()
		{
			super();
			reset();
		}

		//リセット
		public function reset(): void
		{
			data = new Object();
		}

		//ファイル一覧を取得
		public function getFileList( directory: File ): Array
		{
			var key: String;
			var target: String;
			var targetList: Array;

			//ディレクトリでフィルタリング
			if( directory != null )
			{
				target = directory.url;
				targetList = new Array();
				for( key in data )
				{
					if( key.indexOf( target ) >= 0 )
					{
						targetList.push( data[key].file );
					}
				}
			}
			//全データ取得
			else
			{
				targetList = new Array();
				for( key in data )
				{
					targetList.push( data[key].file );
				}
			}
			return targetList;
		}

		//ファイル追加
		public function addFile( file: File, bytes: ByteArray ): void
		{
			var obj: Object;
			if( file != null && bytes != null )
			{
				obj = new Object();
				obj.file  = file;
				obj.bytes = bytes;
				data[file.url] = obj;
			}
		}

		//ファイルバイトデータ取得
		public function getFileBytes( file: File ): ByteArray
		{
			var obj: Object;
			if( file != null )
			{
				if( data.hasOwnProperty( file.url ) )
				{
					obj = data[file.url];
					if( obj != null )
					{
						if( obj.hasOwnProperty( "bytes" ) )
						{
							return obj.bytes;
						}
					}
				}
			}
			return null;
		}

		//データ存在確認
		public function isExists( file: File, refreshFlg: Boolean=false ): Boolean
		{
			if( file != null )
			{
				if( data.hasOwnProperty( file.url ) )
				{
					return true;
				}
			}
			return false;
		}

		//テキスト読み込み
		public function loadTextFile( file: File, cmpFnc: Function ): void
		{
			if( file != null )
			{
				if( isExists( file ) )
				{
					//Log.debug( MemoryFileUtils, "MEMORY loadTextFile: exists: "+file.nativePath );
					compHandler( getFileBytes( file ) );
				}
				else
				{
					//Log.debug( MemoryFileUtils, "MEMORY loadTextFile: not exists: "+file.nativePath );
					callCmp( StorageUtils.FILE_NOT_FOUND, null );
				}
			}
			else
			{
				//Log.debug( MemoryFileUtils, "MEMORY loadTextFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL, null );
			}

			//読み込み完了
			function compHandler( stream: ByteArray ): void
			{
				var txt: String;
				stream.position = 0;
				txt = stream.readUTFBytes( stream.bytesAvailable );

				//Log.debug( MemoryFileUtils, "MEMORY loadTextFile: load complete: "+file.nativePath );
				callCmp( StorageUtils.OK, txt );
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
		public function loadBinaryFile( file: File, cmpFnc: Function ): void
		{
			if( file != null )
			{
				if( isExists( file ) )
				{
					//Log.debug( MemoryFileUtils, "MEMORY loadBinaryFile: exists: "+file.nativePath );
					compHandler( getFileBytes( file ) );
				}
				else
				{
					//Log.debug( MemoryFileUtils, "MEMORY loadBinaryFile: not exists: "+file.nativePath );
					callCmp( StorageUtils.FILE_NOT_FOUND, null );
				}
			}
			else
			{
				//Log.debug( MemoryFileUtils, "MEMORY loadBinaryFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL, null );
			}

			//読み込み完了
			function compHandler( stream: ByteArray ): void
			{
				var bytes: ByteArray = new ByteArray();
				stream.position = 0;
				stream.readBytes( bytes, stream.position, stream.bytesAvailable );

				//Log.debug( MemoryFileUtils, "MEMORY loadBinaryFile: load complete: "+file.nativePath );
				callCmp( StorageUtils.OK, bytes );
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
		public function loadObjectFile( file: File, cmpFnc: Function ): void
		{
			if( file != null )
			{
				if( isExists( file ) )
				{
					//Log.debug( MemoryFileUtils, "MEMORY loadObjectFile: exists: "+file.nativePath );
					compHandler( getFileBytes( file ) );
				}
				else
				{
					//Log.debug( MemoryFileUtils, "MEMORY loadObjectFile: not exists: "+file.nativePath );
					callCmp( StorageUtils.FILE_NOT_FOUND, null );
				}
			}
			else
			{
				//Log.debug( MemoryFileUtils, "MEMORY loadObjectFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL, null );
			}

			//読み込み完了
			function compHandler( stream: ByteArray ): void
			{
				var obj: Object;
				obj = stream.readObject();

				//Log.debug( MemoryFileUtils, "MEMORY loadObjectFile: load complete: "+file.nativePath );
				callCmp( StorageUtils.OK, obj );
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
		public function saveTextFile( file: File, txt: String, cmpFnc: Function, fileMode: String=FileMode.WRITE ): void
		{
			var stream: ByteArray;
			if( file != null )
			{
				if( txt == null )
				{
					txt = "";
				}

				stream = new ByteArray();
				stream.writeUTFBytes( txt );
				addFile( file, stream );
				//Log.debug( MemoryFileUtils, "MEMORY saveTextFile: save complete: "+file.nativePath );
				callCmp( StorageUtils.OK );
			}
			else
			{
				//Log.debug( MemoryFileUtils, "MEMORY saveTextFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL );
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
		public function saveBinaryFile( file: File, ba: ByteArray, cmpFnc: Function, fileMode: String=FileMode.WRITE ): void
		{
			var stream: ByteArray;
			if( file != null )
			{
				if( ba == null )
				{
					ba = new ByteArray();
				}

				stream = new ByteArray();
				stream.writeBytes( ba );
				addFile( file, stream );
				//Log.debug( MemoryFileUtils, "MEMORY saveByteFile: save complete: "+file.nativePath );
				callCmp( StorageUtils.OK );
			}
			else
			{
				//Log.debug( MemoryFileUtils, "MEMORY saveByteFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL );
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
		public function saveObjectFile( file: File, obj: Object, cmpFnc: Function, fileMode: String=FileMode.WRITE ): void
		{
			var stream: ByteArray;
			if( file != null )
			{
				if( obj == null )
				{
					obj = new Object();
				}

				stream = new ByteArray();
				stream.writeObject( obj );
				addFile( file, stream );
				//Log.debug( MemoryFileUtils, "MEMORY saveObjectFile: save complete: "+file.nativePath );
				callCmp( StorageUtils.OK );
			}
			else
			{
				//Log.debug( MemoryFileUtils, "MEMORY saveObjectFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL );
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
		public function deleteFile( file: File, cmpFnc: Function ): void
		{
			if( file != null )
			{
				if( isExists( file ) )
				{
					delete data[file.url];
					//Log.debug( MemoryFileUtils, "MEMORY deleteFile: delete complete: "+file.nativePath );
					callCmp( StorageUtils.OK );
				}
				else
				{
					//Log.debug( MemoryFileUtils, "MEMORY deleteFile: not exists: "+file.nativePath );
					callCmp( StorageUtils.FILE_NOT_FOUND );
				}
			}
			else
			{
				//Log.debug( MemoryFileUtils, "MEMORY deleteFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL );
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
		public function deleteDirectory( directory: File, cmpFnc: Function, deleteDirectoryContents: Boolean=false ): void
		{
			var i: uint;
			var file: File;
			var targetList: Array;

			if( directory != null )
			{
				targetList = getFileList( directory );
				if( targetList == null )
				{
					targetList = new Array();
				}

				if( targetList.length > 0 )
				{
					for( i = 0; i < targetList.length; ++i )
					{
						file = targetList[i];
						if( data.hasOwnProperty( file.url ) )
						{
							delete data[file.url];
						}
					}
					//Log.debug( MemoryFileUtils, "MEMORY deleteDirectory: delete complete: "+directory.nativePath );
					callCmp( StorageUtils.OK );
				}
				else
				{
					//Log.debug( MemoryFileUtils, "MEMORY deleteDirectory: not exists: "+directory.nativePath );
					callCmp( StorageUtils.FILE_NOT_FOUND );
				}
			}
			else
			{
				//Log.debug( MemoryFileUtils, "MEMORY deleteDirectory: directory is null" );
				callCmp( StorageUtils.FILE_IS_NULL );
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
		public function copyFile( src: File, dst: File, cmpFnc: Function, overwrite: Boolean=false ): void
		{
			if( src != null && dst != null )
			{
				if( isExists( src ) )
				{
					compHandler( getFileBytes( src ) );
				}
				else
				{
					//Log.debug( MemoryFileUtils, "MEMORY copyFile: not exists: "+src.nativePath );
					callCmp( StorageUtils.FILE_NOT_FOUND );
				}
			}
			else
			{
				//Log.debug( MemoryFileUtils, "MEMORY copyFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL );
			}

			//コピー完了
			function compHandler( stream: ByteArray ): void
			{
				var bytes: ByteArray = new ByteArray();
				stream.position = 0;
				stream.writeBytes( bytes );
				addFile( dst, stream );

				//Log.debug( MemoryFileUtils, "MEMORY copyFile: copy complete: "+src.nativePath+" -> "+dst.nativePath );
				callCmp( StorageUtils.OK );
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
		public function moveFile( src: File, dst: File, cmpFnc: Function, overwrite: Boolean=false ): void
		{
			if( src != null && dst != null )
			{
				if( isExists( src ) )
				{
					compHandler();
				}
				else
				{
					//Log.debug( MemoryFileUtils, "MEMORY moveFile: not exists: "+src.nativePath );
					callCmp( StorageUtils.FILE_NOT_FOUND );
				}
			}
			else
			{
				//Log.debug( MemoryFileUtils, "MEMORY moveFile: file is null" );
				callCmp( StorageUtils.FILE_IS_NULL );
			}

			//移動完了
			function compHandler(): void
			{
				addFile( dst, getFileBytes( src ) );

				if( src.url != dst.url )
				{
					delete data[src.url];
				}

				//Log.debug( MemoryFileUtils, "MEMORY moveFile: move complete: "+src.nativePath+" -> "+dst.nativePath );
				callCmp( StorageUtils.OK );
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
	}
}