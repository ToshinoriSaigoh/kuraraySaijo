package model.plugin.report
{
/**
 * レポートzipを読み込んで表示するクラス.
 *
 * update 2018/01/24
 * Since 2018/01/24
 * @private
 */
	import common.*;
	import common.db.DB;
	import model.plugin.draw.Draw;
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.data.SQLResult;
	import flash.errors.SQLError;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.net.FileFilter;
	import flash.utils.ByteArray;
	import flash.utils.setTimeout;
	public class Load extends Plug
	{
		public function Load()
		{
		}

		/*
		データ読込フロー
		１．zipファイルを受け取る
		２．reportDir内クリア
		２．reportDirフォルダに解凍　非同期
		３．データXML(reportDir/data/data.xml)をdataTreeに読み込む　非同期
		４．reportDir/data/data.dbを開く
		５．テーブルデータをバッファに入れる
		６．バッファフラッシュ
		*/

		/*
		//ファイル読込準備
		public function GW_loadLocal_before(): void
		{
			var param = PostBox.get("GW_loadLocal_before");
			_pleaseWait();
			setTimeout(run, 100);
			function run(): void
			{
				_groupWorkKey = "GW_loadLocal_before";
				_loadLocal(param.loadMode);
			}
		}
		*/
		//年/月/fileName.zip
		public function PB_loadZip(): void
		{
			var param: Object = PostBox.get("PB_loadZip");
			var zipFile: File = Lib.getAppFileObject(param.year + "/" + param.month + "/" + param.fileName + ".zip");
			_uncompress(zipFile, param.mode);
		}
		//一時レポートファイルを解凍する
		public function PB_loadTmpZip(): void
		{
			var param: Object = PostBox.get("PB_loadTmpZip");
			var zipFile: File = Lib.getSystemFileObject("tmp/" + param.fileName + ".zip");
			_uncompress(zipFile, param.mode, param.type);
		}

		//解凍されたレポートをディレクトリから直接ロードする
		public function PB_loadReport(): void
		{
			var param: Object = PostBox.get("PB_loadReport");
			var reportDir: File = Lib.getSystemFileObject(param.dirPath);
			_openReport(reportDir);
		}
		//zipファイルを開く
		public function MSG_importZip(): void
		{
			var selectFileObj: File = Lib.getAppFileObject();
			var fileFilter: FileFilter = new FileFilter("ファイル", "*.zip;");
			selectFileObj.browseForOpen("ファイルを開く", [fileFilter]);
			selectFileObj.addEventListener(Event.SELECT , selectedHandler);
			function selectedHandler(evt: Event): void//ファイル選択時の処理
			{
				selectFileObj.removeEventListener(Event.SELECT , selectedHandler);
				var _selectFile: File = evt.target as File;
				//_pleaseWait();
				setTimeout(run, 100);
				function run(): void
				{
					_uncompress(_selectFile, null);
				}
			}
		}

		//zip解凍
		private static function _uncompress(zipFile: File, mode: String = null, type: String = "report"): void
		{
			var reg: RegExp = /\.[^\.]+$/;
			var dirName: String = zipFile.name.replace(reg, "");
			//解凍先
			var reportDir: File = Lib.getSystemFileObject(type + "/" + dirName);
			//解凍するレポートと同名のフォルダがあれば消す
			if(reportDir.exists)
			{
				StorageUtils.deleteDirectory(reportDir, __uncompress, true);
			}
			else
			{
				__uncompress();
			}
			//解凍処理
			function __uncompress(): void
			{
				var zipUtil: ZipUtils = new ZipUtils();
				zipUtil.uncompressZip(zipFile, reportDir, complete);
				function complete(): void
				{
					_openReport(reportDir, mode);
				}
			}
		}

		//ディレクトリをロードする
		private static function _openReport(openDir: File, openMode: String = null): void
		{
			StorageUtils.loadTextFile(openDir.resolvePath("data/data.xml"), __completeLoad);
			function __completeLoad(res: String, loadTxt: String): void
			{
				var loadXML: XML = new XML(loadTxt);
				PostBox.send("openReport", {xml: loadXML, mode: openMode});
			}
		}


		//reportDir内のファイルを読み込む
		private static function _loadReportData(openDir: File): void
		{
			//レポートフォルダ読込
			/*
			deleteDataDirectory(report.reportDir, completeDelete);
			function completeDelete(): void
			{
				//GroupWork.done(_groupWorkKey);
			}
			*/
		}

		//バッファーに展開
		public static function loadDB(report: Report): void
		{
			//trace("loadDB___________________________________________", report);
			var targetList: Object = {};//キー：ページ番号, 値: レポート
			_deleteDrawData(report);

			//var firstTimeList: Array = [];
			//var lastTimeList: Array = [];
			var drawDataArr: Array = _getDrawData(report);
			var maxDrawID: uint = 0;
			var i: uint;
			var tmpID: uint;
			for(i = 0; i < drawDataArr.length; i++)
			{
				if(drawDataArr[i].val.id != null)
				{
					tmpID = __getID(drawDataArr[i].val.id);
					//firstTimeList.push(drawDataArr[i].val.firstTime);
					//lastTimeList.push(drawDataArr[i].val.lastTime);
					if(tmpID > maxDrawID) maxDrawID = tmpID;
				}
				Draw.drawBuffer["loadBuffer"][drawDataArr[i].val.report][drawDataArr[i].val.page].push(drawDataArr[i]);
				targetList[drawDataArr[i].val.page] = drawDataArr[i].val.report;
			}
			Draw.activeDrawPanel.report.setDrawID(maxDrawID);

			/*
			firstTimeList.sort(Array.NUMERIC);
			if(Number(firstTimeList[0]) > 0)
			{
				if(Number(firstTimeList[0]) < report.firstTime)
				{
					report.firstTime = Number(firstTimeList[0]);
				}
			}
			*/
			report.nowTime = 0;//report.firstTime;
			//report.lastTime = lastTimeList[lastTimeList.length];

			var n: String;
			for(n in targetList)//ページごとの処理
			{
				PostBox.send("flushBuffer", {buffer: "loadBuffer", report: targetList[n], page: n});
			}

			function __getID(id: String): uint
			{
				var data: Array = id.split("_");
				if(data.length == 1) return uint(data[0]);
				return uint(data[1]);
			}
		}

		//DBから指定端末(端末テーブル)の全ページデータを配列で取得する
		private static function _getDrawData(report: Report): Array
		{
			if(report.myDataElement.length() == 0) return [];
			var pageXMLList: XMLList = report.myDataElement.elements("page");
			if(pageXMLList == null) return [];

			report.reportDB.stmt = new SQLStatement();
			report.reportDB.stmt.sqlConnection = report.reportDB.dbConn;

			var drawDataArr: Array = [];
			var drawTableName: String = "draw";
			var selectSql: String =
				"SELECT id, firstTime, lastTime, author, page, div, operation, data FROM " + drawTableName +
				" WHERE page = :page;";
			report.reportDB.stmt.text = selectSql;

			var i: int;
			for(i = 0; i < pageXMLList.length(); i++)
			{
				report.reportDB.stmt.parameters[":page"] = pageXMLList[i].@name;

				report.reportDB.stmt.execute();
				try
				{
					var result: SQLResult = report.reportDB.stmt.getResult();
					var drawData: Object = {};
					if(result.data != null)
					{
						var n: int;
						for(n = 0; n < result.data.length; n++)
						{
							drawDataArr.push(result.data[n].data);
						}
					}
				}
				catch (error: SQLError)
				{
					//trace("Error message: ", error.message);
					//trace("Details: ", error.details);
				}
			}
			return drawDataArr;
		}

		//DBから指定端末(端末テーブル)の全ページデータを配列で取得する
		private static function _deleteDrawData(report: Report): void
		{
			report.reportDB.stmt = new SQLStatement();
			report.reportDB.stmt.sqlConnection = report.reportDB.dbConn;

			var drawTableName: String = "draw";
			var delTargetArr: Array = [];
			var selectSql: String = "SELECT targetId FROM " + drawTableName + " WHERE operation = 'del';";
			report.reportDB.stmt.text = selectSql;

			report.reportDB.stmt.execute();
			try
			{
				var result: SQLResult = report.reportDB.stmt.getResult();
				var drawData: Object = {};
				if(result.data != null)
				{
					var n: int;
					for(n = 0; n < result.data.length; n++)
					{
						delTargetArr.push(result.data[n].targetId);
						//delTargetArr.push(result.data[n].data.val.id);
					}

					var delTargetList: String = "'" + delTargetArr.join("','") + "'";
					var delSql: String = "DELETE FROM " + drawTableName + " WHERE targetId IN("+ delTargetList +");";
					//trace(delSql, delTargetList);
					report.reportDB.stmt.text = delSql;
					report.reportDB.stmt.execute();
				}
			}
			catch (error: SQLError)
			{
				//trace("Load.as DB Error message _deleteDrawData(): ", error.message);
				//trace("Details: ", error.details);
			}
		}
	}
}
