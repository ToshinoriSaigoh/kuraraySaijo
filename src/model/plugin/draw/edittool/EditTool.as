package model.plugin.draw.edittool
{
/**
 * 画像・スタンプ・図形を移動変形するツールクラス.
 *
 * update 2018/03/08 最前面に移動する機能を追加
 * Since 2018/03/08
 * @private
 */
	import controller.App;
	import model.plugin.draw.*;
	import model.plugin.draw.edittool.EditBox;
	import model.plugin.draw.imagetool.ImageBox;
	import model.plugin.draw.handdraw.HandDrawStroke;

	import model.plugin.report.*;
	import controller.documentroot.reportscreen.DrawContents;
	import model.app.network.ReportUtils;//m2ok

	import flash.display.*;
	import flash.events.*;
	import flash.geom.Rectangle;
	import flash.filesystem.File;

	public class EditTool extends Draw
	{
		private var _startX: Number;
		private var _startY: Number;
		private var _moveX: Number;
		private var _moveY: Number;
		private var _tmpStrokeArr: Array;
		private var _i: String;
		private var _done: Boolean;
		public var selectedEditBox: Object;
		public var multiSelect: Boolean;

		public function EditTool()
		{
			toolName = "editTool";
			super();

			selectedEditBox = {};
			multiSelect = false;
		}

		//描画共有データ受信
		public function PB_receiveShareDraw(): void
		{
			var param: Object = PostBox.get("PB_receiveShareDraw");
			if(param.toolName != toolName) return;
			Draw.createDrawBuffer(param.report, param.page);
			Draw.drawBuffer["simpleBuffer"][param.report][param.page].push(param.bufferData);
			if(ReportUtils.getPagePanel(param.report, param.page) != null)//m2ok
			{
				PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: param.report, page: param.page});
			}

			if(param.action == "delete")
			{
				var page: Page;
				var delFile: File;
				var trashFile: File;
				page = _getPagePanel(param.report, param.panel);
				if(page != null)
				{
					delFile = page.getOwnDirectory().resolvePath(param.id + ".image");
					if(delFile.exists)
					{
						trashFile = page.getOwnTrashBox().resolvePath(param.id + ".image");
						delFile.moveTo(trashFile);
					}
				}
			}
		}
		private function _getPagePanel(reportID: String, panelName: String): Page
		{
			var i: uint;
			var report: Report;
			for(i = 0; i < DrawContents.reportCollection.length; i++)
			{
				report = DrawContents.reportCollection.getItemAt(i) as Report;
				if(report.id == reportID)
				{
					return report.getPage(uint(panelName));
				}
			}
			return null;
		}

		//ページ切り替え時にアクティブになったページにツールを適用する
		public function PB_changePage_after(): void
		{
			if(Draw.activeTool == "editTool" || Draw.activeTool == "stampTool")
			{
				_start();
			}
			else
			{
				_allClearEditBox();
				_stop();
			}
		}
		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			switch(true)
			{
				case (param.tool == toolName):
					if(param.hasOwnProperty("mode"))
					{
						multiSelect = param.mode == "multi" ? true : false;
					}
					_allClearEditBox();
					_start();
					break;
				case (param.tool == "stampTool"):
					if(activeDrawPanel.targetEditBox == null) _allClearEditBox();
					_start();
					break;
				case (param.tool == "penTool"):
				case (param.tool == "hideTool"):
				case (param.tool == "imageTool"):
				case (param.tool == "shapeTool"):
					_stop();
					if(activeDrawPanel.targetEditBox == null) _allClearEditBox();
					break;
				default:
					_allClearEditBox();
					_stop();
			}
		}
		public function PB_actionTool(): void
		{
			var param: Object = PostBox.get("PB_actionTool");
			if(param.tool != "editTool") return;

			var targetList: Array = [];
			switch(param.operation)
			{
				case "delete":
					_deleteBox();
					break;
			}
		}
		private function _deleteBox(): void
		{
			var i: String;
			for(i in selectedEditBox)
			{
				del(selectedEditBox[i]);
			}
			PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: activeDrawPanel.report.vcName, page: activeDrawPanel.vcName});
			PostBox.send("flushBuffer", {buffer: "saveBuffer"});

			function del(editBox: EditBox): void
			{
				var nowTime: String = String(activeDrawPanel.report.getNowTime());
				tmpBufferData = createBufferData(toolName, "del", editBox.id, {});
				tmpBufferData.val.author = activeDrawPanel.report.vcName;
				tmpBufferData.val.lastTime = nowTime;
				var piece: Object = {
					id: editBox.id,
					f: nowTime,
					visible: false
				}
				tmpBufferData.val.stroke.push(piece);
				Draw.drawBuffer["simpleBuffer"][activeDrawPanel.caller.vcName][activeDrawPanel.vcName].push(tmpBufferData);

				//ゴミ箱へ移動
				if(editBox as ImageBox != null)
				{
					var delFile: File = activeDrawPanel.getOwnDirectory().resolvePath(editBox.id + ".image");
					var trashFile: File = activeDrawPanel.getOwnTrashBox().resolvePath(editBox.id + ".image");
					delFile.moveTo(trashFile);
				}

				//送信
				var sendParam: Object = {
					id: editBox.id,
					toolName: toolName,
					action: "delete",
					report: Draw.activeReport.vcName,
					page: Draw.activeDrawPanel.vcName,
					layer: Draw.activeDrawPanel.activeLayer.body.name,
					div: Draw.activeDrawPanel.targetEditBox,
					bufferData: tmpBufferData
				};
				PostBox.send("sendShareDraw", sendParam);
			}
		}

		public function MSG_objectUnmark(): void
		{
			_allClearEditBox();
		}
		//変形スタート
		private function _start(): void
		{
			if(activeDrawPanel != null)
			{
				ControlPanel.controlPanel.visible = false;//手書きポイント読み取り用レイヤー非表示
				activeDrawPanel.body.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler);
				App.mainStage.addEventListener(MouseEvent.MOUSE_UP, _mouseUpHandler);
			}
		}

		//変形ストップ
		private function _stop(): void
		{
			if(activeDrawPanel != null)
			{
				activeDrawPanel.body.removeEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler);
				App.mainStage.removeEventListener(MouseEvent.MOUSE_UP, _mouseUpHandler);
			}
		}

		private function _mouseDownHandler(evt: MouseEvent): void
		{
			var editBox: EditBox = evt.target as EditBox;
			if(editBox != null)//エディットボックス
			{
				if(!multiSelect) _allClearEditBox();
				editBox.operation.editFlag = editBox.selected ? false : true;
				_selectEditBox(editBox.id, editBox as EditBox);

				_startMoveFront(editBox);//最前面に移動
				var point: Sprite;
				point = editBox.border.hitTestControlPoint(evt.stageX, evt.stageY);
				if(point != null)
				{
					_startEdit(point.name);
					_done = true;
				}
				else
				{
					_startEdit(Operation.MOVE);
					_done = false;
				}
			}
			else
			{
				if(evt.target as HandDrawStroke != null)
				{
					_done = true;
					return;
				}
				else
				{
					_done = false;
					_allClearEditBox();
					return;
				}
			}
		}

		private function _startMoveFront(editBox: EditBox): void
		{
			var bufferData: Object = createBufferData(toolName, "edit", editBox.id, {});
			bufferData.val.lastTime = bufferData.val.firstTime;
			editBox.operation.setStatus(Operation.FRONT, bufferData, App.mainStage.mouseX, App.mainStage.mouseY);
			editBox.operation.execute(App.mainStage.mouseX, App.mainStage.mouseY);
		}

		private function _mouseUpHandler(evt: MouseEvent): void
		{
			_pauseEdit();

			if(evt.target.hasOwnProperty("id") && evt.target.id == "deleteBtn")//target削除
			{
				return;
			}
			else
			{
				if(evt.target as EditBox == null)//editBox以外
				{
					switch(true)
					{
						case evt.target as HandDrawStroke != null:
						//case "shapeToolBtn":
						//case "stampToolBtn":
						//case "imageToolBtn":
							break;
						default:
							if(_done) break;
							_allClearEditBox();
					}
				}
				else//targetがeditBoxのとき
				{
					var point: Sprite;
					point = evt.target.border.hitTestControlPoint(evt.stageX, evt.stageY);
					if(point != null && point.name == Operation.LOCK)
					{
						Draw.activeDrawPanel.targetEditBox = evt.target;
						evt.target.border.changeBorderState("lock");
						PostBox.send("changeTool", {tool: "penTool", line: "curveLine", type: "pen"});
					}
					else
					{
						_timerHandler(null);

						if(!evt.target.operation.editFlag && evt.target.selected)
						{
							evt.target.operation.editFlag = false;
							_clearEditBox(evt.target.id);
							_updateSelectedEditBox();
						}
					}
				}
			}
			_done = false;
		}

		//選択されたEditBoxの数
		private function _getSelectEditBoxNum(): uint
		{
			var num: uint = 0;
			var key: String;
			for(key in selectedEditBox)
			{
				num++;
			}
			return num;
		}

		//EditBox選択
		private function _selectEditBox(key: String, val: EditBox): void
		{
			selectedEditBox[key] = val;
			_updateSelectedEditBox();
		}

		//選択EditBoxの更新
		private function _updateSelectedEditBox(): void
		{
			var flag: Boolean;
			flag = _getSelectEditBoxNum() > 1;
			var tmpKey: String;
			for(tmpKey in selectedEditBox)
			{
				selectedEditBox[tmpKey].border.forceHidePoints = flag;//ポイントを隠す
				selectedEditBox[tmpKey].selected = true;
			}
		}

		//EditBox選択解除
		private function _clearEditBox(key: String): void
		{
			selectedEditBox[key].border.forceHidePoints = false;
			selectedEditBox[key].selected = false;
			selectedEditBox[key].operation.reset();
			selectedEditBox[key].box.mouseChildren = false;//子要素のあたり判定をOFFにする
			delete selectedEditBox[key];
		}

		//EditBox選択全解除
		private function _allClearEditBox(): void
		{
			if(Draw.activeDrawPanel != null) Draw.activeDrawPanel.targetEditBox = null;
			for(_i in selectedEditBox)
			{
				_clearEditBox(_i);
			}
			_updateSelectedEditBox();
		}

		//編集中//枠表示状態
		private function _startEdit(operation: String): void
		{
			var bufferData: Object;
			for(_i in selectedEditBox)
			{
				bufferData = createBufferData(toolName, "edit", selectedEditBox[_i].id, {});
				bufferData.val.lastTime = bufferData.val.firstTime;
				selectedEditBox[_i].operation.setStatus(operation, bufferData, App.mainStage.mouseX, App.mainStage.mouseY);
			}
			Lib.addTimerFuncs(_timerHandler);
		}

		//編集停止//枠表示状態
		private function _pauseEdit(): void
		{
			Lib.removeTimerFuncs(_timerHandler);
			_tmpStrokeArr = [];
		}

		//操作中イベントハンドラ
		private function _timerHandler(evt: Event): void
		{
			for(_i in selectedEditBox)
			{
				selectedEditBox[_i].operation.execute(App.mainStage.mouseX, App.mainStage.mouseY);
			}
			PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: Draw.activeDrawPanel.caller.vcName, page: Draw.activeDrawPanel.vcName});
		}
	}
}
