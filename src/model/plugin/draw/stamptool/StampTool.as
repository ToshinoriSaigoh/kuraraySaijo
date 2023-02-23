package model.plugin.draw.stamptool
{
	import common.*;
	import controller.App;
	import model.plugin.draw.*;
	import model.app.network.ReportUtils;//m2ok

	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.filesystem.File;
	import mx.collections.ArrayCollection;

	public class StampTool extends Draw
	{
		public static var sizeArr: Array = [40, 80, 120, 160, 240, 320, 480, 600, 960, 1200, 1920];
		public static var stampHistoryCollection: ArrayCollection;

		private var _drawPanel: Object;
		private var _id: String;

		public function StampTool()
		{
			toolName = "stampTool";
			super();
			stampHistoryCollection = new ArrayCollection([]);

			stampSize = sizeArr[2];
		}

		//描画共有データ受信
		public function PB_receiveShareDraw(): void
		{
			var param: Object = PostBox.get("PB_receiveShareDraw");
			if(param.toolName != toolName) return;
			Draw.createDrawBuffer(param.report, param.panel);
			Draw.drawBuffer["simpleBuffer"][param.report][param.panel].push(param.bufferData);
			if(ReportUtils.getPagePanel(param.report, param.panel) != null)//m2ok
			{
				PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: param.report, page: param.panel});
			}
		}

		//サイズ変更
		public function PB_changeStampSize(): void
		{
			var param: Object = PostBox.get("PB_changeStampSize");
			var nowSize: uint = sizeArr.indexOf(stampSize);
			var i: int;
			if(param.operation == "increase")
			{
				stampSize = nowSize < sizeArr.length - 1 ? sizeArr[nowSize + 1] : sizeArr[sizeArr.length - 1];
			}
			else if(param.operation == "decrease")
			{
				stampSize = nowSize > 0 ? sizeArr[nowSize - 1] : sizeArr[0];
			}
		}

		//浮かせて動かすための画像MC作成
		public function createTmpStamp(stamp: Stamp): void
		{
			var tmpStamp: Sprite = new Sprite();
			tmpStamp.name = stamp.vcName;
			tmpStamp.scaleX = Draw.activeDrawPanel.scale;
			tmpStamp.scaleY = Draw.activeDrawPanel.scale;
			var imgbase: Sprite;
			createImgBase();
			imageLoad();//画像を読み込んでimgbaseに貼り付け

			App.mainStage.addChild(tmpStamp);

			//マウス位置が中央になるようスタンプ位置をずらす
			tmpStamp.x = App.mainStage.mouseX - (stampSize * 0.5);
			tmpStamp.y = App.mainStage.mouseY - (stampSize * 0.5);

			tmpStamp.startDrag(false, new Rectangle(- App.width / 2, - App.height / 2, App.width * 2, App.height * 2));
			tmpStamp.addEventListener(MouseEvent.MOUSE_UP, _mouseUpHandler);

			function createImgBase(): void
			{
				imgbase = new Sprite();
				imgbase.name = "imgbase";
				imgbase.mouseEnabled = false;
				/*
				imgbase.graphics.clear();
				imgbase.graphics.beginFill(0x000000, 0);
				imgbase.graphics.drawRect(0, 0, stampSize, stampSize);
				imgbase.graphics.endFill();
				*/
				tmpStamp.addChild(imgbase);
			}
			function imageLoad(): void
			{
				var bmp: Bitmap;
				bmp = new Bitmap(stamp.myBitmapData);
				bmp.smoothing = true;
				imgbase.addChild(bmp);

				var tmpStampScale: Number = bmp.width > bmp.height ? stampSize / bmp.width : stampSize / bmp.height;
				imgbase.width = bmp.width * tmpStampScale;
				imgbase.height = bmp.height * tmpStampScale;
				imgbase.x = (stampSize - imgbase.width) / 2;
				imgbase.y = (stampSize - imgbase.height) / 2;
			}
			//スタンプ配置完了
			function _mouseUpHandler(e: MouseEvent): void
			{
				tmpStamp.stopDrag();
				tmpStamp.removeEventListener(MouseEvent.MOUSE_UP, _mouseUpHandler);
				var tmpPoint: Point = new Point(0, 0);
				tmpPoint.x = tmpStamp.x;
				tmpPoint.y = tmpStamp.y;
				tmpPoint = Draw.activeDrawPanel.body.globalToLocal(tmpPoint);
				pasteStamp(stamp, tmpPoint.x, tmpPoint.y);
				App.mainStage.removeChild(tmpStamp);
			}
		}

		public function pasteStamp(stamp: Stamp, mouseX: Number, mouseY: Number, authorName: String = null): void
		{
			_drawPanel = Draw.activeDrawPanel;
			_id = _drawPanel.report.getDrawID();
			var nowTime: String = String(Draw.activeReport.getNowTime());
			tmpBufferData = createBufferData(toolName, "new", _id, {dirName: stamp.dirName, fileName: stamp.vcName});
			tmpBufferData.val.author = authorName == null ? _drawPanel.caller.vcName : authorName;
			tmpBufferData.val.lastTime = nowTime;

			var stampW: Number;
			var stampH: Number;
			var stampX: Number;
			var stampY: Number;
			if(stamp.width >= stamp.height)
			{
				stampW = stampSize;
				stampH = stampSize * (stamp.height / stamp.width);
				stampX = mouseX;
				stampY = mouseY;// + (stampH / 2);
			}
			else
			{
				stampW = stampSize * (stamp.width / stamp.height);
				stampH = stampSize;
				stampX = mouseX;// + (stampW / 2);
				stampY = mouseY;
			}

			var piece: Object = {
				id: _id,
				f: nowTime,
				x: stampX,
				y: stampY,
				width: stampW,
				height: stampH
			}
			tmpBufferData.val.stroke.push(piece);
			Draw.drawBuffer["simpleBuffer"][_drawPanel.caller.vcName][_drawPanel.vcName].push(tmpBufferData);
			PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: _drawPanel.caller.vcName, page: _drawPanel.vcName});
			setHistory(stamp);

			//送信
			var sendParam: Object = {
				toolName: toolName,
				action: "new",
				report: Draw.activeReport.vcName,
				panel: Draw.activeDrawPanel.vcName,
				layer: Draw.activeDrawPanel.activeLayer.body.name,
				bufferData: tmpBufferData
			};
			PostBox.send("sendShareDraw", sendParam);
		}

		public function setHistory(stamp: Stamp): void
		{
			var i: int;
			for(i = 0; i < stampHistoryCollection.length; i++)
			{
				if(stampHistoryCollection.getItemAt(i).vcName == stamp.vcName)
				{
					stampHistoryCollection.removeItemAt(i);
				}
			}
			stampHistoryCollection.addItemAt(stamp, 0);
			for(i = 0; i < stampHistoryCollection.length; i++)
			{
				if(i < 5) continue;
				stampHistoryCollection.removeItemAt(i);
			}
		}
	}
}
