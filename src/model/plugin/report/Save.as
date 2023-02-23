package model.plugin.report
{
/**
 * レポート保存用クラス.
 * zip圧縮して保存する。
 *
 * update 2018/01/24
 * Since 2018/01/24
 * @private
 */
	import common.*;
	import common.db.DB;
	import model.plugin.draw.DrawPlayer;
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.data.SQLResult;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	public class Save
	{
		private var _dbFile: File;
		private var _folder: File;
		private var _systemDir: File;//読込先systemフォルダ
		protected var caller: Report;

		public function Save(report: Report)
		{
			caller = report;
			_init();
		}
		private function _init(): void
		{
			//データXML保存
			saveDataTree();
			//保存用テーブル作成
			_createTable();
		}

		//dataXML保存//非同期
		public function saveDataTree(completeFunc: Function = null): void
		{
			var reportTree: XML = caller.myDataElement;
			reportTree.@lastTime = caller.getNowTime() + DrawPlayer.adjustTime;
			StorageUtils.saveTextFile(caller.reportDir.resolvePath("data/data.xml"), reportTree.toXMLString(), completeFunc, FileMode.WRITE);
		}

		//zipに圧縮
		public function saveZip(gwKey: String, saveFile: File = null, saveText: Boolean = true): void
		{
			var now: Date = new Date();
			var zipUtil: ZipUtils = new ZipUtils();
			var zipFile: File = saveFile == null ? Lib.getAppFileObject(String(now.getFullYear()) + "/" + String(now.getMonth() + 1) + "/" + caller.id + ".zip") : saveFile;
			zipUtil.compressZip(caller.reportDir, zipFile, completeZip);
			function completeZip(): void
			{
				var filesXML: XML;
				var files: File = Lib.getAppFileObject(String(now.getFullYear()) + "/files.xml");
				//ファイルリスト
				StorageUtils.loadTextFile(files, createFileList);
				function createFileList(res: String, loadTxt: String): void
				{
					if(loadTxt != null)
					{
						filesXML = new XML(loadTxt);
						if(filesXML.month.(attribute("name") == String(now.getMonth() + 1))[0] == null)
						{
							filesXML.appendChild(<month name={String(now.getMonth() + 1)}/>);
						}
						if(filesXML.month.(@name == String(now.getMonth() + 1)).day.(attribute("name") == String(now.getDate()))[0] == null)
						{
							filesXML.month.(@name == String(now.getMonth() + 1)).appendChild(<day name={String(now.getDate())}><files/></day>);
						}
					}
					else
					{
						filesXML =
							<year name={String(now.getFullYear())}>
								<month name={String(now.getMonth() + 1)}>
									<day name={String(now.getDate())}>
										<files/>
									</day>
								</month>
							</year>
					}
					var targetNode: XML = filesXML.month.(@name == String(now.getMonth() + 1)).day.(@name == String(now.getDate())).files[0];
					if(saveText && targetNode.elements("file").(attribute("name") == caller.id)[0] == null)
					{
						targetNode.appendChild(
							<file name={caller.id}
								date={String(now.getFullYear()) + "/" + String(now.getMonth() + 1) + "/" + String(now.getDate()) + " " + String(now.getHours()) + ":" + String(now.getMinutes()) + ":" + String(now.getSeconds())}
								type={caller.reportType}/>);

						StorageUtils.saveTextFile(files, filesXML.toXMLString(), saveComplete, FileMode.WRITE);
					}
					else
					{
						saveComplete();
					}
					function saveComplete(): void
					{
						GroupWork.done(gwKey);
					}
				}
			}
		}

		//zipに圧縮
		public function saveTmpZip(gwKey: String): void
		{
			var zipUtil: ZipUtils = new ZipUtils();
			var zipFile: File = Lib.getSystemFileObject("tmp/" + caller.id + ".zip");
			zipUtil.compressZip(caller.reportDir, zipFile, completeZip);
			function completeZip(): void
			{
				GroupWork.done(gwKey);
			}
		}

		//保存用テーブル作成
		private function _createTable(): void
		{
			var drawTableName: String = "draw";
			var createTableSql: String;
			/*
			//テーブル削除
			caller.reportDB.stmt = new SQLStatement();
			caller.reportDB.stmt.sqlConnection = caller.reportDB.dbConn;
			DB.query(caller.reportDB.stmt, "DROP TABLE IF EXISTS " + drawTableName);
			*/
			//データテーブル作成
			caller.reportDB.stmt = new SQLStatement();
			caller.reportDB.stmt.sqlConnection = caller.reportDB.dbConn;
			createTableSql =
				"CREATE TABLE IF NOT EXISTS " + drawTableName + " (" +
				"id INTEGER PRIMARY KEY AUTOINCREMENT, " +
				"targetId TEXT," +
				"firstTime INTEGER," +
				"lastTime INTEGER," +
				"author TEXT," +
				"page TEXT," +
				"div TEXT," +
				"operation TEXT," +
				"tool TEXT, " +
				"data BLOB" +//ストロークデータはシリアライズしてbyteArrayで保存
				")";
			DB.query(caller.reportDB.stmt, createTableSql);

			//データテーブル用インデックス作成
			caller.reportDB.stmt = new SQLStatement();
			caller.reportDB.stmt.sqlConnection = caller.reportDB.dbConn;
			DB.query(caller.reportDB.stmt, "CREATE INDEX IF NOT EXISTS idx_firstTime ON " + drawTableName + " (firstTime);");
			DB.query(caller.reportDB.stmt, "CREATE INDEX IF NOT EXISTS idx_lastTime ON " + drawTableName + " (lastTime);");
			DB.query(caller.reportDB.stmt, "CREATE INDEX IF NOT EXISTS idx_author ON " + drawTableName + " (author);");
			DB.query(caller.reportDB.stmt, "CREATE INDEX IF NOT EXISTS idx_page ON " + drawTableName + " (page);");
			DB.query(caller.reportDB.stmt, "CREATE INDEX IF NOT EXISTS idx_div ON " + drawTableName + " (div);");
			DB.query(caller.reportDB.stmt, "CREATE INDEX IF NOT EXISTS idx_operation ON " + drawTableName + " (operation);");
			DB.query(caller.reportDB.stmt, "CREATE INDEX IF NOT EXISTS idx_tool ON " + drawTableName + " (tool);");
		}

		//１．作業ファイルをzipにする
		//２．zipをアプリケーションフォルダに保存する
		/*
		データ保存フロー
		１．保存先ディレクトリのFileオブジェクト
			report.reportDir = Lib.getSystemFileObject("report/" + caller.vcName);
		２．データフォルダ内クリア
		３．メモリのデータXML(dataTree)をreport.reportDir/data/data.xmlに保存する　非同期
		４．指定データDBテーブルをreport.reportDir/data/data.dbに保存する

		５．report.reportDirをzipに圧縮してデータ格納ディレクトリに保存する　非同期
			android ios: Roaming/data/saveFile/
			windows: C://Sharin/data/saveFile/
		*/

		/*
		//メモリー上のデータをローカルファイルに書き出す
		public function saveLocal(gwKey: String): void
		{
			_saveDataTree(complete);
			function complete(res: String): void
			{
				//if(res != StorageUtils.OK) Log.error(this, "ContentsManager save " + res);
				//_copyDB("save", saveMode, completeCopyDB);
				function completeCopyDB(): void
				{
					GroupWork.done(gwKey);
				}
			}
		}

		//指定テーブルデータをdata.dbに保存する
		//mode: load or save
		private function _copyDB(mode: String, saveMode: String, compFunc: Function): void
		{
			if(_createDirectory(caller.reportDir) == false)
			{
				complete();
				return;
			}
			_dbFile = _systemDir.resolvePath(_saveDBName);//_folder.resolvePath("save.db");

			//接続
			DB.attachDB(_attachDBName, _dbFile);//DBアタッチ接続//保存用DB作成

			//mode loadのとき書き込み先になるdata.dbにテーブルをつくる
			//mode loadのとき読込元data.dbが空の場合がある
			//mode saveのとき書き込み先になるdata.dbにテーブルをつくる
			if(mode == "load")
			{
				_checkSaveDBTables(saveMode);
			}
			//保存用テーブル作成
			_createTables(saveMode, mode);
			//テーブルコピー
			_copyTable(saveMode, mode);
			//切断
			var responder: Responder = new Responder(complete);
			DB.detachDB(_attachDBName, responder);//DBアタッチ切断
			function complete(): void
			{
				if(compFunc != null) compFunc.call();
			}
		}
		//ディレクトリ作成
		private function _createDirectory(operationDir: File): Boolean
		{
			if(operationDir == null) return false;

			var directoryError: Boolean = false;
			if(operationDir.exists == false)
			{
				try
				{
					operationDir.createDirectory();
				}
				catch(ioError: IOError){ directoryError = true; }
				catch(error: SecurityError){ directoryError = true; }
			}
			return !directoryError;
		}
		*/

	}
}
