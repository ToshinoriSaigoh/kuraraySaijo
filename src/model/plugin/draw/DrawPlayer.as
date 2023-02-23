package model.plugin.draw
{
/**
 * バッファーに従って実際に描画するクラス.
 *
 * update 2018/01/24
 * Since 2018/01/24
 * @private
 */
	import controller.*;
	import model.plugin.*;
	import model.plugin.draw.*;
	import model.plugin.draw.handdraw.HandDrawRender;
	import model.plugin.draw.hidetool.HideRender;
	import model.plugin.draw.shapetool.ShapeRender;
	import model.plugin.draw.imagetool.ImageRender;
	import model.plugin.draw.stamptool.StampRender;
	import model.plugin.draw.edittool.EditRender;
	import model.plugin.draw.texttool.TextRender;
	import model.plugin.report.ReportRender;
	import model.plugin.report.Report;
	import flash.display.Sprite;
	import flash.display.BlendMode;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;
	import flash.geom.*;
	import flash.utils.ByteArray;

	public class DrawPlayer extends Draw
	{
		public static var adjustTime: Number;
		private static var _renderClassList: Object;
		private static var _readyCnt: Object;
		private static var _renderingBufferList: Object;//ロード時、リアルタイム入力時など、その都度描画して消す
		private static var _renderingBufferMap: Object;
		private static var _playingBufferList: Object;//0から指定時間までを描画するためのバッファ//ファイルオープン中は空にしない
		private static var _playingBufferMap: Object;

		private static var _lastTime: Number;
		public function DrawPlayer()
		{
			toolName = "drawPlayer";
			adjustTime = 60000;
			_readyCnt = {};
			_playingBufferList = {};
			_playingBufferMap = {};
			_renderingBufferList = {};
			_renderingBufferMap = {};
			_renderClassList = {
				"handDraw": HandDrawRender,
				"hideTool": HideRender,
				"shapeTool": ShapeRender,
				"imageTool": ImageRender,
				"stampTool": StampRender,
				"editTool": EditRender,
				"textTool": TextRender,
				"operationRecord": ReportRender
			};
			_lastTime = 0;
		}

		//レンダー変更
		public static function changeRender(renderName: String, renderClass: Class): void
		{
			if(_renderClassList != null && _renderClassList.hasOwnProperty(renderName))
			{
				_renderClassList[renderName] = renderClass;
			}
		}

		//レンダリング用バッファー作成
		public static function createBufferMap(reportID: String): void
		{
			_playingBufferList[reportID] = [];
			_playingBufferMap[reportID] = {};
			_renderingBufferList[reportID] = [];
			_renderingBufferMap[reportID] = {};
		}
		//レンダリング用バッファー作成
		public static function removeBufferMap(reportID: String): void
		{
			delete _playingBufferList[reportID];
			delete _playingBufferMap[reportID];
			delete _renderingBufferList[reportID];
			delete _renderingBufferMap[reportID];
		}

		//drawPanel(page)ごとにバッファをフラッシュする
		public function PB_flushBuffer(): void
		{
			var param: Object = PostBox.get("PB_flushBuffer");
			_flushBuffer(param.buffer, param.report, param.page);
		}

		//ページ切り替え後//切り替え操作をバッファーに登録する
		public function PB_changePage_after(): void
		{
			var param: Object = PostBox.get("PB_changePage_after");
			if(activeDrawPanel == null || activeDrawPanel.report.playState != "rec") return;
			_addOperationRecord("changePage", param.page);
		}
		//タイムラインツールクリック後現在時間でcue()する
		public function PB_changeTool_after(): void
		{
			var param: Object = PostBox.get("PB_changeTool_after");
			if(param.tool == "timelineTool")
			{
				cue(activeDrawPanel.caller.nowTime);
			}
		}
		/*movie用
		//レポートを追加した場合描画がリセットされるためレポート切り替え後//pauseして描画
		public function PB_changeReport_after(): void
		{
			if(activeDrawPanel == null) return;
			cue(activeDrawPanel.caller.nowTime);
		}
		*/

		//動画操作実行
		public function PB_actionMovie(): void
		{
			var param: Object = PostBox.get("PB_actionMovie");
			switch(param.action)
			{
				case "cue"://preview
					activeDrawPanel.report.nowTime = param.time;
					cue(param.time);
					break;
				case "rec":
					rec();
					_addOperationRecord("changePage", activeDrawPanel.vcName);
					break;
				case "pause":
					pause();
					break;
				case "play":
					playRec(activeDrawPanel.report.nowTime);
					break;
				case "stop"://movie
					stop();
					activeDrawPanel.report.nowTime = 0;
					cue(param.time);
					break;
			}
		}

		//バッファ解放
		private function _flushBuffer(bufferName: String, reportID: String = null, targetName: String = null): void
		{
			if(activeDrawPanel == null) return;
			var report: String;
			var page: String;
			var drawPanel: Object;
			if(reportID != null && targetName != null)
			{
				report = reportID;
				page = targetName;
				if(!Report.reportMap.hasOwnProperty(reportID)) return;
				drawPanel = Report.reportMap[reportID].pageCollection.source[int(page)];
			}
			else
			{
				report = activeDrawPanel.caller.vcName;
				page = activeDrawPanel.vcName;
				drawPanel = activeDrawPanel;
			}
			var bufferList: Array = Draw.drawBuffer[bufferName][report][page];
			if(bufferList.length == 0) return;

			switch(bufferName)
			{
				case "simpleBuffer":
					_ready(bufferName, drawPanel, bufferList, report + "." + page, __go);
					break;
				case "loadBuffer"://初回読み込み時
					_ready(bufferName, drawPanel, bufferList, report + "." + page, __cue);
					break;
				case "movieBuffer"://movie用
					_ready(bufferName, drawPanel, bufferList, report + "." + page, null);
					break;
				case "saveBuffer":
					_save(report);
					break;
			}

			function __go(): void
			{
				_go(report);
			}
			function __cue(): void
			{
				cue(Report.reportMap[report].lastTime);
			}
		}

		//ムービーステータス設定
		private function _setPlayState(state: String): void
		{
			switch(state)
			{
				case "pause":
					activeDrawPanel.report.playState = "stop";
					break;
				default:
					activeDrawPanel.report.playState = state;
			}
		}

		//追加書き込み可能再生
		public function playRec(startTime: Number = 0): void
		{
			_setPlayState("play");
			activeDrawPanel.report.playStartTime = startTime;
			activeDrawPanel.report.playStartTimeStamp = Lib.getNowTimeStamp();
			Lib.addTimerFuncs(_play);
		}
		//一時停止
		public function pause(): void
		{
			_setPlayState("pause");
			Lib.removeTimerFuncs(_play);
			_lastTime = activeDrawPanel.report.nowTime;
		}
		//停止//頭出し
		public function stop(): void
		{
			if(activeDrawPanel.report.playState == "rec") activeDrawPanel.report.setTotalTime();
			_setPlayState("default");
			_setPlayState("stop");
			_clear();
			//activeDrawPanel.report.stopReportTimer();
			activeDrawPanel.report.nowTime = 0;
			Lib.removeTimerFuncs(_play);
			_lastTime = 0;
		}
		//0からcueTimeまでを描画する
		public function cue(cueTime: Number = 0): void
		{
			activeDrawPanel.report.setDateTimeText();
			_clear();
			_playing(activeDrawPanel.report.vcName, 0, cueTime);
		}


		//timerで実行する
		private function _play(e: Event): void
		{
			activeDrawPanel.report.nowTime = activeDrawPanel.report.playStartTime + Lib.getNowTimeStamp() - activeDrawPanel.report.playStartTimeStamp;
			var nowTime: Number = activeDrawPanel.report.nowTime;
			_playing(activeDrawPanel.report.vcName, _lastTime, nowTime);
			_lastTime = nowTime;
			if(activeDrawPanel.report.nowTime >= activeDrawPanel.report.lastTime)
			{
				activeDrawPanel.report.nowTime = activeDrawPanel.report.lastTime;
				pause();
			}
			else
			{
				activeDrawPanel.report.setDateTimeText();
			}
		}
		//saveBufferをDBに保存してクリアする
		private function _save(reportID: String): void
		{
			var n: String;
			//Lib.dump(Draw.drawBuffer["saveBuffer"][reportID]);
			if(Report.reportMap[reportID].openMode != "play")
			{
				DrawDB.insertBufferList(Report.reportMap[reportID].reportDB, Draw.drawBuffer["saveBuffer"][reportID]);
			}
			for(n in Draw.drawBuffer["saveBuffer"][reportID])
			{
				Draw.drawBuffer["saveBuffer"][reportID][n] = [];
			}
		}

		//バッファフラッシュ準備
		//ストロークを分解する
		//必要なオブジェクトを先に作る
		private function _ready(bufferName: String, drawPanel: Object, bufferList: Array, readyID: String, completeFunc: Function = null): void
		{
			_readyCnt[readyID] = bufferList.length;
			var buffer: Object;
			var i: uint;
			while(bufferList.length)
			{
				buffer = Lib.clone(bufferList[0]);
				switch(buffer.key)
				{
					case "operationRecord":
						_addOperationRecordStroke(buffer);
						break;
					default:
						_splitStroke(drawPanel, buffer);
				}
				if(completeFunc != null)
				{
					_renderClassList[buffer.key].ready(drawPanel, buffer.val, readyComplete);
				}
				else
				{
					_renderClassList[buffer.key].ready(drawPanel, buffer.val, null);
				}
				if(bufferName == "simpleBuffer")
				{
					var laserFlag: Boolean = (buffer.val.option.hasOwnProperty("penType") && buffer.val.option.penType == "laser");
					if(!laserFlag)
					{
						Draw.drawBuffer["saveBuffer"][drawPanel.report.vcName][drawPanel.vcName].push(buffer);
					}
				}
				bufferList.shift();
			}
			function readyComplete(): void
			{
				_readyCnt[readyID]--;
				if(_readyCnt[readyID] == 0)
				{
					completeFunc.call();//_go()
				}
			}
			//ストロークの処理を分割してレンダリング用のバッファへ入れる
			function _splitStroke(drawPanel: Object, buffer: Object): void
			{
				var laserFlag: Boolean = (buffer.val.option.hasOwnProperty("penType") && buffer.val.option.penType == "laser");
				var reportID: String = drawPanel.report.vcName;
				var piece: Object;
				var strokeList: Array = buffer.val.stroke;
				var i: uint;
				for(i = 0; i < strokeList.length; i++)
				{
					piece = {
						id: buffer.val.id,
						t: strokeList[i].f,
						drawPanel: drawPanel,
						render: _renderClassList[buffer.key],
						piece: strokeList[i]
					};
					if(bufferName == "simpleBuffer")
					{
						if(!_renderingBufferMap[reportID].hasOwnProperty(strokeList[i].f))
						{
							_renderingBufferMap[reportID][strokeList[i].f] = [];
							_renderingBufferList[reportID].push(_renderingBufferMap[reportID][strokeList[i].f]);
						}
						_renderingBufferMap[reportID][strokeList[i].f].push(piece);
					}
					if(!laserFlag)
					{
						if(!_playingBufferMap[reportID].hasOwnProperty(strokeList[i].f))
						{
							_playingBufferMap[reportID][strokeList[i].f] = [];
							_playingBufferList[reportID].push(_playingBufferMap[reportID][strokeList[i].f]);
						}
						_playingBufferMap[reportID][strokeList[i].f].push(piece);
					}
				}
			}
		}
		//レンダリング実行
		//レンダリング後bufferList, bufferMapを空にする
		private function _go(reportID: String): void
		{
			var f: Number;
			for(f = 0; f < _renderingBufferList[reportID].length; f++)
			{
				_renderingOneFrame(reportID, _renderingBufferList[reportID][f]);
			}
			_renderingBufferList[reportID] = [];
			_renderingBufferMap[reportID] = {};
		}

		//レポート操作用バッファーをレンダリングバッファに入れる
		private function _addOperationRecordStroke(buffer: Object): void
		{
			var reportID: String = activeDrawPanel.report.vcName;
			var nowTime: String = buffer.val.firstTime;

			if(!_renderingBufferMap[reportID].hasOwnProperty(nowTime))
			{
				_renderingBufferMap[reportID][nowTime] = [];
				_renderingBufferList[reportID].push(_renderingBufferMap[reportID][nowTime]);
			}
			if(!_playingBufferMap[reportID].hasOwnProperty(nowTime))
			{
				_playingBufferMap[reportID][nowTime] = [];
				_playingBufferList[reportID].push(_playingBufferMap[reportID][nowTime]);
			}
			var piece: Object = {
				id: null,
				t: nowTime,
				drawPanel: buffer.val.page,
				render: _renderClassList["operationRecord"],
				piece: {f: nowTime, operation: buffer.val.operation}
			};
			createOperationRecordPiece(buffer, piece);
			_playingBufferMap[reportID][nowTime].push(piece);
		}

		//オペレーション処理断片作成
		protected function createOperationRecordPiece(buffer: Object, piece: Object): void
		{
		}

		//レポート操作用バッファー登録
		private function _addOperationRecord(type: String, pageName: String): void
		{
			var reportID: String = activeDrawPanel.report.vcName;
			var __nowTime: String = String(activeDrawPanel.report.nowTime);
			var __drawID: String = activeDrawPanel.report.getDrawID();
			var buffer: Object = {
				key : "operationRecord",
				val:
				{
					id: null,
					report: reportID,
					page: pageName,
					layer: null,
					div: null,
					operation: type,
					author: Global.get("myTerminalID"),
					option: {},
					firstTime: __nowTime,
					lastTime: __nowTime,
					stroke: [{}]
				}
			};
			Draw.drawBuffer["simpleBuffer"][reportID][pageName].push(buffer);
			PostBox.send("flushBuffer", {buffer: "simpleBuffer"});
		}

		//再生用バッファを描画する
		private function _playing(reportID: String, startTime: Number = 0, endTime: Number = 0): void
		{
			var __playingList: Array = [];
			var m: Number = 0;
			var i: Number;
			for(i = 0; i < _playingBufferList[reportID].length; i++)
			{
				if(Number(_playingBufferList[reportID][i][0].t) >= startTime && Number(_playingBufferList[reportID][i][0].t) <= endTime)
				{
					__playingList.push(_playingBufferList[reportID][i]);
				}
			}
			var f: Number;
			for(f = 0; f < __playingList.length; f++)
			{
				_renderingOneFrame(reportID, __playingList[f]);
			}
		}
		//フレーム毎のプロパティを適用する
		private function _renderingOneFrame(reportID: String, buffer: Array): void
		{
			var i: uint;
			for(i = 0; i < buffer.length; i++)
			{
				buffer[i].render.rendering(reportID, buffer[i].piece);
			}
		}

		private function _clear(reportID: String = null, startTime: Number = 0, endTime: Number = -1): void
		{
			reportID = reportID != null ? reportID : activeDrawPanel.report.vcName;
			var buffer: Object;
			if(endTime != -1)
			{
				clearRange();
			}
			else
			{
				clearAll();
			}
			//フレーム範囲を指定してクリアする
			function clearRange(): void
			{
				var f: Number;
				for(f = startTime; f <= endTime; f++)
				{
					if(_playingBufferMap[reportID].hasOwnProperty(f))
					{
						delete _playingBufferMap[reportID][f];
					}
				}
			}
			//全部描画してバッファを消す
			function clearAll(): void
			{
				var i: String;
				for(i in Draw.drawList[reportID])
				{
					Draw.drawList[reportID][i].visible = false;
				}
			}
		}

		//録画//一時停止位置（nowTime）から開始
		//movie用
		public function rec(): void
		{
			/*
			var reportID: String = activeDrawPanel.report.vcName;
			var nowTime: Number = activeDrawPanel.report.nowTime;
			_setPlayState("rec");

			////nowTime以降のクリア処理をする
			_clear(activeDrawPanel.report.vcName, nowTime + 1, activeDrawPanel.report.lastTime);

			//saveBufferクリア//DBに書き込み
			PostBox.send("flushBuffer", {buffer: "saveBuffer"});

			//nowTime以降のレコードを削除
			DrawDB.deleteDrawData(Report.reportMap[reportID].reportDB, nowTime);

			//ストローク途中のデータ書き換え
			var drawDataArr: Array = DrawDB.searchStrokeData(Report.reportMap[reportID].reportDB, nowTime);
			if(drawDataArr is Array && drawDataArr.length > 0)
			{
				var strokeArr: Array;
				var n: uint;
				var i: uint;
				for(i = 0; i < drawDataArr.length; i++)
				{
					if(!drawDataArr[i].hasOwnProperty("data")) break;
					strokeArr = drawDataArr[i].data.val.stroke;
					for(i = 0; i < strokeArr.length; i++)
					{
						if(strokeArr[i].hasOwnProperty("f") && int(strokeArr[i].f) > nowTime)
						{
							delete strokeArr[i];
						}
					}
				}
				//DB update
				DrawDB.updateDrawData(Report.reportMap[reportID].reportDB, drawDataArr);
			}

			//_renderingBufferMapクリア
			delBufferMap(_renderingBufferMap[activeDrawPanel.report.vcName]);
			//_playingBufferMapクリア
			delBufferMap(_playingBufferMap[activeDrawPanel.report.vcName]);

			//録画スタート
			activeDrawPanel.report.startReportTimer();

			function delBufferMap(map: Object): void
			{
				var i: String;
				for(i in map)
				{
					var index: uint = _renderingBufferList[reportID].indexOf(map[i]);
					if(index != -1)
					{
						_renderingBufferList[reportID].splice(index, 1);
						_playingBufferList[reportID].splice(index, 1);
					}
					if(int(i) > nowTime)
					{
						delete map[i];
					}
				}
			}
			*/
		}

		/*
		//レンダリングバッファを描画する
		private function _rendering(startTime: Number = 0, endTime: Number = 0): void
		{
			var reportID: String = activeDrawPanel.report.vcName;
			var buffer: Object;
			if(startTime < 0)
			{
				rederingAll();
			}
			else
			{
				renderingRange();
			}

			//フレーム範囲を指定して描画する
			function renderingRange(): void
			{
				var f: Number;
				for(f = startTime; f <= endTime; f++)
				{
					if(_renderingBufferMap[reportID].hasOwnProperty(f))
					{
						_renderingOneFrame(reportID, _renderingBufferMap[reportID][f]);
						delete _renderingBufferMap[reportID][f];
					}
				}
			}
			//全部描画
			function rederingAll(): void
			{
				var f: Number;
				for(f = 0; f < _renderingBufferList[reportID].length; f++)
				{
					_renderingOneFrame(reportID, _renderingBufferList[reportID][f]);
				}
				_renderingBufferList[reportID] = [];
				_renderingBufferMap[reportID] = {};
			}
		}
		*/

		//Playingバッファを時系列に整列させる
		protected function sortPlayingBuffer(reportID: String): void
		{
			var i: uint;
			var frameData: Array;
			var frameNumList: Array = [];
			var frameBucket: Object = {};
			var result: Array = [];
			if(_playingBufferList.hasOwnProperty(reportID) == false) return;
			for(i = 0; i < _playingBufferList[reportID].length; i++)
			{
				frameData = _playingBufferList[reportID][i] as Array;
				if(frameData != null && frameData.length > 0)
				{
					frameBucket[frameData[0].t.toString()] = frameData;
					frameNumList.push(frameData[0].t);
				}
			}
			frameNumList.sort(__asc);
			result = [];
			for(i = 0; i < frameNumList.length; i++)
			{
				result.push(frameBucket[frameNumList[i].toString()]);
			}
			_playingBufferList[reportID] = result;
			function __asc(a: Number, b: Number): int
			{
				if(a < b) return -1;
				if(a > b) return 1;
				return 0;
			}
		}
	}
}
