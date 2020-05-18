package common.db
{
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.data.SQLResult;
	import flash.errors.SQLError;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.net.Responder;

	public class DB extends Plug
	{
		public var dbFile: File;
		public var dbConn: SQLConnection;
		public var stmt: SQLStatement;

		private var _folder: File;
		//コンストラクタ
		public function DB(dataDir: File, mode: String = "sync", fnc: Function = null): void
		{
			//DB保存場所
			dbFile = dataDir.resolvePath("data/data.db");
			//DBコネクション作成
			dbConn = new SQLConnection();
			switch(mode)
			{
				case "sync":
					_dbConnectionSync(fnc);
					break;
				case "async":
					_dbConnectionAsync(fnc);
					break;
			}
		}

		//同期接続
		private function _dbConnectionSync(fnc: Function = null): void
		{
			try
			{
				dbConn.open(dbFile);
				if(fnc != null)
				{
					fnc.call(null, "");
				}
			}
			catch(error: SQLError)
			{
				//Log.debug(DB, "Error message: ", error.message);
				//Log.debug(DB, "Details: ", error.details);
			}
		}
		//非同期接続
		private function _dbConnectionAsync(fnc: Function = null): void
		{
			//接続完了イベント登録
			dbConn.addEventListener(SQLEvent.OPEN, openHandler);
			//接続エラーイベント登録
			dbConn.addEventListener(SQLErrorEvent.ERROR, errorHandler);
			//非同期モードで接続
			dbConn.openAsync(dbFile);

			function openHandler(event: SQLEvent): void
			{
				//Log.debug(DB, "DB____the DB was created successfully and DB start");
				//接続完了でイベント削除
				dbConn.removeEventListener(SQLEvent.OPEN, openHandler);
				dbConn.removeEventListener(SQLErrorEvent.ERROR, errorHandler);
				if(fnc != null)
				{
					fnc.call(null, "");
				}
			}

			function errorHandler(event: SQLErrorEvent): void
			{
				//Log.debug(DB, "DB !!Error!! :", event.error.message, event.error.details);
			}
		}

		/*
		public static function connectCheck(conn: SQLConnection): Boolean
		{
			return dbConn.connected;
		}
		*/

		public static function close(dbConn: SQLConnection, responder: Responder = null): void
		{
				dbConn.cancel();
				dbConn.close(responder);
		}

		public static function attachDB(dbConn: SQLConnection, dbName: String, file: File): void
		{
			dbConn.attach(dbName, file);
		}
		public static function detachDB(dbConn: SQLConnection, dbName: String, responder: Responder = null): void
		{
			dbConn.detach(dbName, responder);
		}

		public static function query(stmt: SQLStatement, sql: String): void
		{
			stmt.text = sql;
			stmt.addEventListener(SQLEvent.RESULT, sqlResult);
			stmt.addEventListener(SQLErrorEvent.ERROR, sqlError);
			stmt.execute();
			function sqlResult(event: SQLEvent): void
			{
				stmt.removeEventListener(SQLEvent.RESULT, sqlResult);
				stmt.removeEventListener(SQLErrorEvent.ERROR, sqlError);
			}
			function sqlError(event: SQLErrorEvent): void
			{
				//Log.debug(DB, "SQL Error message: ", event.error.message);
				//Log.debug(DB, "Details: ", event.error.details);
			}
		}

		public static function insert(stmt: SQLStatement, tableName: String, data: Object): void
		{
			var keys: Array = [];
			var vals: Array = [];
			var n: String;
			for(n in data)
			{
				keys.push(n);
				vals.push(":" + n);
				stmt.parameters[":" + n] = data[n];
			}
			var sql: String = "INSERT INTO " + tableName + "(" + keys.join(",") + ") VALUES (" + vals.join(", ") + ")";
			query(stmt, sql);
		}

		public static function select(stmt: SQLStatement, sql: String): *
		{
			stmt.text = sql;
			var resultArr: Array;
			try
			{
				stmt.execute();
				var result: SQLResult = stmt.getResult();
				resultArr = result.data is Array ? result.data : [];
				return resultArr;
			}
			catch(error: SQLError)
			{
				trace("■SQL Error message: ", error.message);
				trace("■Details: ", error.details);
				return null;
			}
		}
	}
}