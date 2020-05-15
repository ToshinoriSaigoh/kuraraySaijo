package model.plugin.draw
{
/**
 * データベース中の描画系情報を扱うクラス.
 * 挿入、編集、削除、検索。
 *
 * update 2018/01/24
 * Since 2018/01/24
 * @private
 */
	import common.db.DB;
	import model.plugin.draw.Draw;
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.data.SQLResult;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.errors.SQLError;
	import flash.filesystem.File;
	import flash.utils.ByteArray;

	public class DrawDB
	{
		public function DrawDB(): void
		{
		}

		public static function insertBufferList(db: DB, bufferList: Object): void
		{
			var drawTableName: String = "draw";
			db.stmt = new SQLStatement();
			db.stmt.sqlConnection = db.dbConn;

			db.stmt.sqlConnection.begin();

			var sql: String =
			"INSERT OR IGNORE INTO " + drawTableName +
			"(targetId, firstTime, lastTime, author, page, operation, data) " +
			"VALUES" +
			"(:targetId, :firstTime, :lastTime, :author, :page, :operation, :data) ";

			//trace("SQL:", sql);
			db.stmt.text = sql;
			var n: uint;
			var i: String;
			for(i in bufferList)
			{
				for(n = 0; n < bufferList[i].length; n++)
				{
					//trace("insert:", bufferList[i][n].val.id);
					db.stmt.parameters[":targetId"] = bufferList[i][n].val.id;
					db.stmt.parameters[":firstTime"] = Number(bufferList[i][n].val.firstTime);
					db.stmt.parameters[":lastTime"] = Number(bufferList[i][n].val.lastTime);
					db.stmt.parameters[":author"] = bufferList[i][n].val.author;
					db.stmt.parameters[":page"] = bufferList[i][n].val.page;
					db.stmt.parameters[":operation"] = bufferList[i][n].val.operation;
					db.stmt.parameters[":data"] = bufferList[i][n];
					db.stmt.execute();
				}
			}
			try
			{
				db.stmt.sqlConnection.commit();
			}
			catch(error: SQLError)
			{
				trace("■ Error message:", error.message);
				trace("■ Details:", error.details);
				db.stmt.sqlConnection.rollback();
			}
		}

		public static function deleteDrawData(db: DB, time: uint = 0): void
		{
			var drawTableName: String = "draw";
			db.stmt = new SQLStatement();
			db.stmt.sqlConnection = db.dbConn;

			db.stmt.sqlConnection.begin();
			var sql: String =
			"DELETE FROM " + drawTableName + " " +
			"WHERE firstTime > :firstTime;";
			db.stmt.text = sql;
			db.stmt.parameters[":firstTime"] = time;
			db.stmt.execute();
			try
			{
				db.stmt.sqlConnection.commit();
			}
			catch(error: SQLError)
			{
				trace("■ Error message:", error.message);
				trace("■ Details:", error.details);
				db.stmt.sqlConnection.rollback();
			}
		}

		//drawデータ更新
		public static function updateDrawData(db: DB, drawDataArr: Array): void
		{
			if(drawDataArr.length == 0) return;
			var drawTableName: String = "draw";
			db.stmt = new SQLStatement();
			db.stmt.sqlConnection = db.dbConn;

			db.stmt.sqlConnection.begin();
			var sql: String =
			"UPDATE " + drawTableName + " " +
			"SET data = :data " +
			"WHERE firstTime = :firstTime;";
			db.stmt.text = sql;

			var i: uint;
			for(i = 0; i < drawDataArr.length; i++)
			{
				db.stmt.parameters[":firstTime"] = drawDataArr[i].firstTime;
				db.stmt.parameters[":data"] = drawDataArr[i].data;
				db.stmt.execute();
			}

			try
			{
				trace("comp update");
				db.stmt.sqlConnection.commit();
			}
			catch(error: SQLError)
			{
				trace("■ Error message:", error.message);
				trace("■ Details:", error.details);
				db.stmt.sqlConnection.rollback();
			}
		}

		//特定時間から録画開始時に描画中のストロークを修正する
		//firstTime < time <=lastTimeのデータを取得する
		public static function searchStrokeData(db: DB, time: uint): Array
		{
			var drawTableName: String = "draw";
			db.stmt = new SQLStatement();
			db.stmt.sqlConnection = db.dbConn;
			db.stmt.parameters[":firstTime"] = time;

			var sql: String =
			"SELECT * FROM " + drawTableName + " " +
			"WHERE firstTime < :firstTime AND lastTime >= :firstTime;";

			return DB.select(db.stmt, sql);
		}

	}
}