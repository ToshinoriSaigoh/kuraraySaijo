/*********************************
zip圧縮解凍
使用方法
coltware_commons_zip_v1_1.swc をライブラリパスの通ったフォルダへ置く

■圧縮
dataFileで指定したフォルダまたはファイルと同じ場所に圧縮される
//var zipUtil: ZipUtils = new ZipUtils();
//var dataFile: File = new File("フォルダまたはファイル");
//zipUtil.compressZip(dataFile);

■解凍
dataFileで指定したフォルダまたはファイルと同じ場所に解凍される
//var zipUtil: ZipUtil = new ZipUtil();
//var dataFile: File = new File("zipファイル");
//zipUtil.uncompressZip(dataFile);
**********************************/
package common
{
	import flash.events.*;
	//zip
	import com.coltware.commons.zip.*;
	import flash.filesystem.*;
	import flash.utils.ByteArray;

	public class ZipUtils
	{
		private var zipFile: File;
		private var zipFileWriter: ZipFileWriter;
		private var zipFileReader: ZipFileReader;

		//コンストラクタ
		public function ZipUtils(): void
		{
			zipFileWriter = new ZipFileWriter();
			zipFileReader = new ZipFileReader();
		}
		//圧縮
		public function compressZip(dataFile: File, targetFile: File, fnc: Function = null): void
		{
			//zip保存先
			//圧縮元ファイル(フォルダ)の親フォルダ + 圧縮元ファイル(フォルダ)名 + .zip
			if(targetFile != null)
			{
				zipFile = targetFile;
				//Log.debug(ZipUtils, "_______" + zipFile.nativePath);

				//ファイル調査完了時のイベント登録
				dataFile.addEventListener(FileListEvent.DIRECTORY_LISTING , dirGetListAsync);
				//入出力エラー時に呼ばれる関数
				dataFile.addEventListener(IOErrorEvent.IO_ERROR , dirGetListAsyncIOError);

				//dirフォルダ内のすべてのファイルとフォルダを取得(非同期)
				dataFile.getDirectoryListingAsync();
			}
			else
			{
				//Log.debug(ZipUtils, "ZipUtil.as : !!error!!________targetFile null エラー");
				completeCompressZip();
			}

			//フォルダ内の調査が終了した時に呼ばれる関数
			function dirGetListAsync(event: FileListEvent): void
			{
				//圧縮元フォルダ内のすべてのファイルとフォルダ
				var dataFiles: Array = event.files;
				//zip作成処理
				//Log.debug(ZipUtils, "__zip作成開始");
				zipFileWriter.open(zipFile);
				//Log.debug(ZipUtils, "____zipファイル追加開始");
				toZip(dataFiles);
				//Log.debug(ZipUtils, "______zipファイル追加完了");
				zipFileWriter.close();
				//Log.debug(ZipUtils, "________zipファイル作成完了");
				completeCompressZip();

				//配列の構造のままzipファイルに追加する
				//ファイルまたはフォルダ検知ごとに実行
				function toZip(dataFiles: Array, fileDir: String = ""): void
				{
					for (var i: int=0;i < dataFiles.length;i++) {
						var f: File = dataFiles[i];
						if(f.isDirectory)//フォルダならさらにスコープ
						{
							var dirPath: String = fileDir.length > 0 ? fileDir + "/" : "";
							toZip(f.getDirectoryListing(), dirPath + f.name);
						}
						else//ファイルならzipに追加
						{
							var filePath: String = fileDir.length > 0 ? fileDir + "/" + f.name : f.name;
							var zFile: File = new File(f.nativePath);
							//addFileでzipにファイルを追加する
							//addFile(圧縮元ファイルオブジェクト, "zipに追加するファイル名");
							zipFileWriter.addFile(zFile, filePath);

							//Add Directory
							//zip内に空フォルダを作成する場合はaddDirectoryを使用する
							//zipFileWriter.addDirectory("フォルダ名");
						}
					}
				}
			}
			//ファイル入出力エラー処理
			function dirGetListAsyncIOError(event: IOErrorEvent): void
			{
				//Log.debug(ZipUtils, "ZipUtil.as : !!error!!________file入出力エラー");
				completeCompressZip();
			}
			//完了通知
			function completeCompressZip(): void
			{
			//イベント削除
				dataFile.removeEventListener(FileListEvent.DIRECTORY_LISTING , dirGetListAsync);
				dataFile.removeEventListener(IOErrorEvent.IO_ERROR , dirGetListAsyncIOError);
				if(fnc != null)
				{
					fnc.call(null, "");
				}
			}
		}

		//解凍
		public function uncompressZip(dataFile: File, targetDir: File, fnc: Function = null): void
		{
			//zipファイルであれば解凍実行
			if(zipFileReader.check(dataFile) && targetDir != null)
			{
				//zipファイルを開く
				zipFileReader.open(dataFile);
				//zipファイルの中身を配列で取得
				var zipFileList: Array = zipFileReader.getEntries();
				for each(var thisFile: ZipEntry in zipFileList)
				{
					if(!thisFile.isDirectory())
					{
						////Log.debug(ZipUtils, "__file: " + thisFile.getFilename());
						try
						{
							//ZipEntryオブジェクトをunzipするとbyteArrayデータに解凍される
							var bytes: ByteArray = zipFileReader.unzip(thisFile);
							//保存先指定
							//ファイル名thisFile.getFilename()
							var file: File = targetDir.resolvePath(thisFile.getFilename());
							//ファイルストリームを開く
							var stream: FileStream = new FileStream();
							stream.open(file, FileMode.WRITE);
							stream.writeBytes(bytes);
							stream.close();
						}
						catch(err: Error)
						{
							//Log.debug(ZipUtils, "zipFileReader !!error!!________" + err.message);
						}
					}
					else
					{
						//Log.debug(ZipUtils, "__isdir: continue" + thisFile);
					}
				}

				zipFileReader.close();

				if(fnc != null)
				{
					fnc.call(null, "");
				}
			}
			else
			{
				//Log.debug(ZipUtils, "zipFileReader !!error!!________no zip");
			}
		}
	}
}
