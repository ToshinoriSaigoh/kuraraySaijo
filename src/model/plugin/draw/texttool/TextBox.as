package model.plugin.draw.texttool
{
	import common.*;
	import Global;
	import model.plugin.draw.*;
	import model.plugin.draw.edittool.EditBox;
	import model.plugin.draw.edittool.Operation;
	import model.plugin.draw.texttool.TextTool;

	import flash.display.Sprite;
	import flash.events.*;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	import flash.system.IME;
	import flash.system.IMEConversionMode;

	public class TextBox extends EditBox
	{
		public var textField: TextField;
		public var textBoxOption: Object;
		private var _defaultTextSize: Number;
		private var _defaultTextColor: Number;
		private var _text: String;
		private var _autoSize: Boolean;
		private var _edited: Boolean;
		private var _tmpBufferData: Object = {};//一時的描画データ

		public function TextBox(drawPanel: Object, drawLayer: Object, bufferVal: Object): void
		{
			name = bufferVal.id;
			var opList: Array = [
				//Operation.LOCK
			];
			targetPanel = drawPanel as DrawPanel;
			targetLayer = drawLayer as DrawLayer;
			super();
			_edited = false;
			_defaultTextSize = bufferVal.option.size;
			_defaultTextColor = bufferVal.option.color;
			box.mouseChildren = true;

			body = new Sprite();
			box.addChild(body);

			setOperation(opList);

			textField = new TextField();
			textField.focusRect = true;
			textField.embedFonts = true;
			textField.selectable = true;

			if(bufferVal.option.autoSize)
			{
				autoSize = true;
			}
			else
			{
				textField.width = bufferVal.option.width;
				textField.height = bufferVal.option.height;
				autoSize = false;
			}
			var format: TextFormat = new TextFormat();
			format.font = Lib.notoSansMonoCJKJP;
			format.size = _defaultTextSize;
			format.color = _defaultTextColor;
			textField.defaultTextFormat = format;
			body.addChild(textField);
			changeMode("normal");

		}

		public function changeMode(mode: String = null): void
		{
			switch(mode)
			{
				case "edit":
					this.mouseChildren = true;
					box.mouseChildren = true;
					body.mouseEnabled = false;
					_edited = false;
					if(autoSize)
					{
						textField.width = _defaultTextSize;
						textField.height = _defaultTextSize;
					}
					textField.type = TextFieldType.INPUT;
					textField.border = true;
					textField.selectable = true;
					textField.mouseEnabled = true;
					textField.background = true;
					textField.backgroundColor = 0xf0f0f0;
					textField.multiline = true;
					body.stage.focus = textField;
					textField.addEventListener(TextEvent.TEXT_INPUT, textInputHundler);
					textField.addEventListener(FocusEvent.FOCUS_OUT, focusOutHundler);
					IME.enabled = true;
					break;
				case "normal":
				default:
					box.mouseChildren = false;
					body.mouseEnabled = false;
					textField.type = TextFieldType.DYNAMIC;
					textField.border = false;
					textField.selectable = false;
					textField.mouseEnabled = false;
					textField.mouseWheelEnabled = true;
					textField.background = false;
					textField.backgroundColor = 0xffffff;
					textField.removeEventListener(TextEvent.TEXT_INPUT, textInputHundler);
					textField.removeEventListener(FocusEvent.FOCUS_OUT, focusOutHundler);
			}
		}
		//入力文字を表示する
		public function textInputHundler(e: TextEvent): void
		{
			_edited = true;
		}

		//テキスト入力完了時処理
		public function focusOutHundler(e: FocusEvent): void
		{
			var __nowTime: String = String(Draw.activeReport.getNowTime());
			if(textField.text.length == 0)
			{
				_tmpBufferData = Draw.createBufferData("hideTool", "del", id, {});
				_tmpBufferData.val.author = Draw.activeDrawPanel.report.vcName;
				_tmpBufferData.val.lastTime = __nowTime;
				var piece: Object = {
					id: id,
					f: __nowTime,
					visible: false
				}
				_tmpBufferData.val.stroke.push(piece);
				Draw.activeReport.redoList = [];
				Draw.activeReport.undoList.unshift(id);
				Draw.activeReport.undoList = Draw.activeReport.undoList.slice(0, Draw.undoCnt);

				Draw.drawBuffer["simpleBuffer"][Draw.activeDrawPanel.report.vcName][Draw.activeDrawPanel.vcName].push(_tmpBufferData);
				PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: Draw.activeDrawPanel.report.vcName, page: Draw.activeDrawPanel.vcName});
			}
			else
			{
				changeMode("normal");
				if(_edited)
				{
					_tmpBufferData = Draw.createBufferData("textTool", "edit", id, {});
					_tmpBufferData.val.stroke.push({
						id: id,
						f: __nowTime,
						text: textField.text
					});
					_tmpBufferData.lastTime = __nowTime;
					Draw.drawBuffer["simpleBuffer"][Draw.activeDrawPanel.caller.vcName][Draw.activeDrawPanel.vcName].push(_tmpBufferData);
					PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: Draw.activeDrawPanel.caller.vcName, page: Draw.activeDrawPanel.vcName});
					_edited = false;
				}
			}
		}

		public function set autoSize(flag: Boolean): void
		{
			_autoSize = flag;
			textField.wordWrap = _autoSize ? false : true;
			textField.autoSize = _autoSize ? TextFieldAutoSize.LEFT : TextFieldAutoSize.NONE;
		}
		public function get autoSize(): Boolean
		{
			return _autoSize;
		}
		public function set text(val: String): void
		{
			textField.text = val;
		}
		public function get text(): String
		{
			return textField.text;
		}
		override public function set width(val: Number): void
		{
			textField.width = val;
		}
		override public function get width(): Number
		{
			return textField.width;
		}
		override public function set height(val: Number): void
		{
			textField.height = val;
		}
		override public function get height(): Number
		{
			return textField.height;
		}
	}
}