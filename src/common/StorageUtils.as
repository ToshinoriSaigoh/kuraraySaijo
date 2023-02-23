package common
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

	import common.CommonUtils;
	import common.storage.*;

	public class StorageUtils
	{
		public static const MEMORY: String     = "memory";
		public static const FILE: String       = "file";

		public static const OK: String             = "ok";
		public static const IO_ERROR: String       = "io error";
		public static const SECURITY_ERROR: String = "security error";
		public static const FILE_NOT_FOUND: String = "file not found";
		public static const FILE_IS_NULL: String   = "file is null";

		//対象ストレージ
		private static var targetStorage: String = FILE;

		//メモリ上データ
		private static var memory: MemoryFileUtils = new MemoryFileUtils();

		//コンストラクタ
		function StorageUtils()
		{
			super();
			//reset();
		}

		//リセット
		public function reset(): void
		{
			targetStorage = FILE;

			if( memory == null )
			{
				memory = new MemoryFileUtils();
			}
			else
			{
				memory.reset();
			}
		}

		//メモリファイルユーティリティ取得
		public static function getMemoryFileUtils(): MemoryFileUtils
		{
			return memory;
		}

		//タイプ設定
		public static function setTarget(target: String): void
		{
			targetStorage = target;
		}

		//存在確認
		public static function isExists(file: File, refreshFlg: Boolean=false): Boolean
		{
			if( targetStorage == FILE )
			{
				return FileUtils.isExists(file, refreshFlg);
			}
			else if( targetStorage == MEMORY )
			{
				return memory.isExists(file, refreshFlg);
			}
			return false;
		}

		//テキスト読み込み
		public static function loadTextFile(file: File, cmpFnc: Function): void
		{
			if( targetStorage == FILE )
			{
				FileUtils.loadTextFile(file, cmpFnc);
			}
			else if( targetStorage == MEMORY )
			{
				memory.loadTextFile(file, cmpFnc);
			}
		}

		//バイナリ読み込み
		public static function loadBinaryFile(file: File, cmpFnc: Function): void
		{
			if( targetStorage == FILE )
			{
				FileUtils.loadBinaryFile(file, cmpFnc);
			}
			else if( targetStorage == MEMORY )
			{
				memory.loadBinaryFile(file, cmpFnc);
			}
		}

		//オブジェクト読み込み
		public static function loadObjectFile(file: File, cmpFnc: Function): void
		{
			if( targetStorage == FILE )
			{
				FileUtils.loadObjectFile(file, cmpFnc);
			}
			else if( targetStorage == MEMORY )
			{
				memory.loadObjectFile(file, cmpFnc);
			}
		}

		//テキストファイル保存
		public static function saveTextFile(file: File, txt: String, cmpFnc: Function, fileMode: String=FileMode.WRITE): void
		{
			if( targetStorage == FILE )
			{
				FileUtils.saveTextFile(file, txt, cmpFnc, fileMode);
			}
			else if( targetStorage == MEMORY )
			{
				memory.saveTextFile(file, txt, cmpFnc, fileMode);
			}
		}

		//バイナリファイル保存
		public static function saveBinaryFile(file: File, ba: ByteArray, cmpFnc: Function, fileMode: String=FileMode.WRITE): void
		{
			if( targetStorage == FILE )
			{
				FileUtils.saveBinaryFile(file, ba, cmpFnc, fileMode);
			}
			else if( targetStorage == MEMORY )
			{
				memory.saveBinaryFile(file, ba, cmpFnc, fileMode);
			}
		}

		//オブジェクトファイル保存
		public static function saveObjectFile(file: File, obj: Object, cmpFnc: Function, fileMode: String=FileMode.WRITE): void
		{
			if( targetStorage == FILE )
			{
				FileUtils.saveObjectFile(file, obj, cmpFnc, fileMode);
			}
			else if( targetStorage == MEMORY )
			{
				memory.saveObjectFile(file, obj, cmpFnc, fileMode);
			}
		}

		//ファイル削除
		public static function deleteFile(file: File, cmpFnc: Function): void
		{
			if( targetStorage == FILE )
			{
				FileUtils.deleteFile(file, cmpFnc);
			}
			else if( targetStorage == MEMORY )
			{
				memory.deleteFile(file, cmpFnc);
			}
		}

		//ディレクトリ削除
		public static function deleteDirectory(directory: File, cmpFnc: Function, deleteDirectoryContents: Boolean=false): void
		{
			if( targetStorage == FILE )
			{
				FileUtils.deleteDirectory(directory, cmpFnc, deleteDirectoryContents);
			}
			else if( targetStorage == MEMORY )
			{
				memory.deleteDirectory(directory, cmpFnc, deleteDirectoryContents);
			}
		}

		//ファイルコピー
		public static function copyFile(src: File, dst: File, cmpFnc: Function, overwrite: Boolean=false): void
		{
			if( targetStorage == FILE )
			{
				FileUtils.copyFile(src, dst, cmpFnc, overwrite);
			}
			else if( targetStorage == MEMORY )
			{
				memory.copyFile(src, dst, cmpFnc, overwrite);
			}
		}

		//ファイル移動
		public static function moveFile(src: File, dst: File, cmpFnc: Function, overwrite: Boolean=false): void
		{
			if( targetStorage == FILE )
			{
				FileUtils.moveFile(src, dst, cmpFnc, overwrite);
			}
			else if( targetStorage == MEMORY )
			{
				memory.moveFile(src, dst, cmpFnc, overwrite);
			}
		}

		//ベースパスを削除
		public static function splitBasePath(base: String, target: String): String
		{
			return FileUtils.splitBasePath(base, target);
		}

		//ディレクトリ取得
		public static function getCurrentDirectoryPath(str: String, ds: String="/"): String
		{
			return FileUtils.getCurrentDirectoryPath(str, ds);
		}

		//ファイル名切り出し
		public static function getFileName(file: File): String
		{
			return FileUtils.getFileName(file);
		}

		//ファイル名切り出し(String版)
		public static function getFileNameStr(str: String, ds: String="/"): String
		{
			return FileUtils.getFileNameStr(str, ds);
		}

		//拡張子を取得
		public static function getExtension(fileName: String): String
		{
			return FileUtils.getExtension(fileName);
		}

		//拡張子を削除
		public static function removeExtension(fileName: String): String
		{
			return FileUtils.removeExtension(fileName);
		}
	}
}