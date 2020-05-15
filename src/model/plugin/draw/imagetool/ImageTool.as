package model.plugin.draw.imagetool
{
	import common.*;
	import model.plugin.draw.*;
	import model.app.network.ReportUtils;//m2ok

	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.JPEGEncoderOptions;
	import flash.display.PNGEncoderOptions;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.ByteArray;
	import flash.geom.Point;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.net.FileFilter;
	import flash.geom.Rectangle;
	import mx.binding.utils.BindingUtils;

	public class ImageTool extends Draw
	{
		public static var sizeArr: Array = [120, 240, 320, 480, 600, 720, 840, 960, 1080, 1200];

		private var _imageSizeRange: Object;
		private var _fitting: String;
		private var _cancelFlag: Boolean
		private var _drawPanel: Object;
		private var _id: String;
		//private var _deviceCameraRoll: DeviceCameraRoll;

		public function ImageTool()
		{
			toolName = "imageTool";
			_imageSizeRange = {
				max: 400,
				min: 44
			}
			_fitting = "center";
			super();

			imageSize = sizeArr[4];
		}

		//描画共有データ受信
		public function PB_receiveShareDraw(): void//m2ok
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
		public function PB_changeImageSize(): void
		{
			var param: Object = PostBox.get("PB_changeImageSize");
			var nowSize: uint = sizeArr.indexOf(imageSize);
			var i: int;
			if(param.operation == "increase")
			{
				imageSize = nowSize < sizeArr.length - 1 ? sizeArr[nowSize + 1] : sizeArr[sizeArr.length - 1];
			}
			else if(param.operation == "decrease")
			{
				imageSize = nowSize > 0 ? sizeArr[nowSize - 1] : sizeArr[0];
			}
			_setImageSizeRange(imageSize);
		}

		public function PB_actionTool(): void
		{
			var param: Object = PostBox.get("PB_actionTool");
			if(param.tool != "imageTool") return;
			if(param.report != null && param.page != null)
			{
				_drawPanel = getDrawPanel(param.report, param.page);
			}
			else
			{
				_drawPanel = Draw.activeDrawPanel;
			}
			if(_drawPanel != null && param.hasOwnProperty("fitting"))
			{
				_fitting = param.fitting;
				selectImage();
			}
		}

		private function _setImageSizeRange(size: int): void
		{
			_imageSizeRange = {
				max: size,
				min: 44
			}
		}

		//背景画像ファイルを開いて表示する
		private function selectImage(): void
		{
			if(PlatformUtils.osCheck(PlatformUtils.WINDOWS))
			{
				_selectImageForWindows();
			}
			else
			{
				_selectImageForMobile();
			}
		}

		private function _selectImageForWindows(): void
		{
			_drawPanel = Draw.activeDrawPanel;
			var imageFilter: FileFilter = new FileFilter("画像ファイル", "*.jpg;*.gif;*.png;");
			var selectFileObj: File = new File(Config.get("config", "loadImageDir"));
			selectFileObj.browseForOpen("ファイルを開く", [imageFilter]);

			selectFileObj.addEventListener(Event.SELECT , fileSelectHandler);
			function fileSelectHandler(evt: Event): void//ファイル選択時の処理
			{
				var selectFile: File;
				selectFileObj.removeEventListener(Event.SELECT , fileSelectHandler);
				selectFile = evt.target as File;
				ImageUtils.loadImage(selectFile, completeImageLoad, err, err);
				function completeImageLoad(loader: Loader, bytes: ByteArray): void
				{
					if(loader != null)
					{
						createImageObject(selectFile);
					}
				}
				function err(): void
				{
				}
			}
		}

		private function _selectImageForMobile(): void
		{
			/*
			_drawPanel = Draw.activeDrawPanel.activeLayer;
			if(_deviceCameraRoll == null) _deviceCameraRoll = new DeviceCameraRoll();
			_deviceCameraRoll.reset();
			_deviceCameraRoll.start(null, eventHandler);
			function eventHandler(event: String, param: Object): void
			{
				var bitmapData: BitmapData;
				var bytes: ByteArray;
				var file: File;
				if(event == DeviceCameraRoll.OK)
				{
					bitmapData = param as BitmapData;
					if(bitmapData != null)
					{
						file = Lib.getTemporaryFileObjectByPath(CommonUtils.generateUniqueID(20));
						bytes = new ByteArray();
						bitmapData.encode(new Rectangle(0, 0, bitmapData.width, bitmapData.height), new PNGEncoderOptions(), bytes);
						StorageUtils.saveBinaryFile(file, bytes, completeSave, FileMode.WRITE);
					}
				}
				function completeSave(res: String): void
				{
					if(res == StorageUtils.OK)
					{
						var imageX: Number = (targetLayer.width / 2);
						var imageY: Number = (targetLayer.height / 2);
						createImageObject(file);
					}
				}
			}
			*/
		}

		//PostBoxで画像を受け取ったときの処理
		public function PB_createImageObject(): void
		{
			var scale: Number = 1.0;
			var param: Object = PostBox.get("PB_createImageObject");
			_drawPanel = param.page != null ? param.page : Draw.activeDrawPanel;
			_fitting = param.fitting;
			createImageObject(param.imageFile, param.author, scale);
		}

		//キャンセル処理
		private function cancel(): void
		{
			_cancelFlag = true;
		}

		////////////////////////////////////////////////////画像貼り付け処理

		//画像をフォルダにコピーしたあとバッファーにわたす
		public function createImageObject(selectFile: File, authorName: String = null, scaleNum: Number = 1.0): void
		{
			_id = _drawPanel.report.getDrawID();
			var fileName: String = _id + ".image";

			var copyFile: File = _drawPanel.getOwnDirectory().resolvePath(fileName);
			ImageUtils.loadImage(selectFile, completeImageLoad, null, null);
			function completeImageLoad(loader: Loader, bytes: ByteArray): void
			{
				if(loader != null)
				{
					var imageX: Number;
					var imageY: Number;
					var imageW: Number;
					var imageH: Number;
					var imageSize: Number;

					//画像サイズをチェックする//最大サイズを超える場合は縮小した画像を作成して保存する
					if(_isOverSize(loader))
					{
						var bmpData: BitmapData = Lib.fittingImage(loader, imageW, imageH);
						var byteArr: ByteArray;
						var byteArrJpeg: ByteArray = new ByteArray();
						//var byteArrPng: ByteArray = new ByteArray();
						bmpData.encode(new Rectangle(0, 0, bmpData.width, bmpData.height), new JPEGEncoderOptions(90), byteArrJpeg);
						//bmpData.encode(new Rectangle(0, 0, bmpData.width, bmpData.height), new PNGEncoderOptions(), byteArrPng);
						//byteArr = byteArrJpeg.length > byteArrPng.length ? byteArrPng : byteArrJpeg;
						StorageUtils.saveBinaryFile(copyFile, byteArrJpeg, completeFnc, FileMode.WRITE);
					}
					else
					{
						StorageUtils.copyFile(selectFile, copyFile, completeFnc, true);
					}
					//サイズチェック
					function _isOverSize(loader: Loader): Boolean
					{
						var scale: Number;
						switch(_fitting)
						{
							case "horizontal":
								scale = _drawPanel.drawPanelWidth > loader.width ? 1.0 : _drawPanel.drawPanelWidth / loader.width;
								imageW = loader.width * scale;
								imageH = loader.height * scale;
								imageX = 0;
								imageY = 0;
								break;
							case "vertical":
								scale = _drawPanel.drawPanelHeight > loader.height ? 1.0 : _drawPanel.drawPanelHeight / loader.height;
								imageW = loader.width * scale;
								imageH = loader.height * scale;
								imageX = 0;
								imageY = 0;
								break;
							case "bg":
								var panelRate: Number = _drawPanel.drawPanelWidth / _drawPanel.drawPanelHeight;
								var loaderRate: Number = loader.width / loader.height;
								if(panelRate < loaderRate)//パネルより横長はvertical
								{
									scale = _drawPanel.drawPanelHeight / loader.height;
								}
								else
								{
									scale = _drawPanel.drawPanelWidth / loader.width;
								}
								imageW = loader.width * scale;
								imageH = loader.height * scale;
								imageX = (_drawPanel.drawPanelWidth / 2) - (imageW / 2);
								imageY = (_drawPanel.drawPanelHeight / 2) - (imageH / 2);
								break;
							default:
								if(loader.width > _imageSizeRange.max || loader.height > _imageSizeRange.max)
								{
									scale = loader.width / loader.height > 1 ? _imageSizeRange.max / loader.width : _imageSizeRange.max / loader.height;
									imageW = loader.width * scale;
									imageH = loader.height * scale;
								}
								else
								{
									imageW = loader.width;
									imageH = loader.height;
								}
								imageX = (_drawPanel.drawPanelWidth / 2) - (imageW / 2);
								imageY = (_drawPanel.drawPanelHeight / 2) - (imageH / 2);
								break;
						}

						var checkFlag: Boolean = (loader.width > _imageSizeRange.max || loader.height > _imageSizeRange.max) ? true : false;
						return checkFlag;
					}
					function completeFnc(): void
					{
						var nowTime: String = String(_drawPanel.report.getNowTime());
						tmpBufferData = createBufferData(toolName, "new", _id, {fileName: fileName});
						tmpBufferData.val.author = authorName == null ? _drawPanel.report.vcName : authorName;
						tmpBufferData.val.lastTime = nowTime;
						var piece: Object = {
							id: _id,
							f: nowTime,
							fileName: fileName,
							x: imageX,
							y: imageY
						}
						if(scaleNum != 1.0)
						{
							piece.scaleX = scaleNum;
							piece.scaleY = scaleNum;
						}
						tmpBufferData.val.stroke.push(piece);
						Draw.drawBuffer["simpleBuffer"][_drawPanel.report.vcName][_drawPanel.vcName].push(tmpBufferData);
						PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: _drawPanel.report.vcName, page: _drawPanel.vcName});

						//送信
						var sendParam: Object = {
							id: _id,
							toolName: toolName,
							action: "new",
							report: Draw.activeReport.vcName,
							panel: Draw.activeDrawPanel.vcName,
							layer: Draw.activeDrawPanel.activeLayer.body.name,
							bufferData: tmpBufferData
						};
						PostBox.send("shareImage", {bytes: byteArrJpeg, option: sendParam});
					}
				}
			}
		}
	}
}
