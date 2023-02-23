package model.plugin.draw.imagetool
{
	import common.*;
	import model.plugin.draw.*;
	import model.plugin.draw.edittool.EditBox;
	import model.plugin.draw.edittool.Operation;
	import model.plugin.draw.imagetool.ImageTool;
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.events.*;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	public class ImageBox extends EditBox
	{
		private var _myBitmap: Bitmap;
		private var _fileName: String;

		public function ImageBox(drawPanel: Object, targetLayer: Object, bufferVal: Object, imageFile: File, completeFunc: Function): void
		{
			var opList: Array = [
				Operation.ROTATION,
				Operation.SCALE_XY,
				Operation.SCALE_X,
				Operation.SCALE_Y,
				Operation.LOCK
			];
			super();
			this.targetPanel = drawPanel as DrawPanel;
			this.targetLayer = targetLayer as DrawLayer;
			name = bufferVal.id;
			_fileName = imageFile.name;

			_myBitmap = new Bitmap();
			body = _myBitmap;
			box.addChild(_myBitmap);
			setOperation(opList);

			ImageUtils.loadImage(imageFile, completeImageLoad, err, err);
			function completeImageLoad(loader: Loader, bytes: ByteArray): void
			{
				var bmpData: BitmapData = ImageUtils.cloneImage(loader);
				ImageUtils.unloadImage(loader);
				if(bmpData != null)
				{
					_myBitmap.bitmapData = bmpData;
					_myBitmap.smoothing = true;
					defaultWidth = bmpData.width;
					defaultHeight = bmpData.height;
					centeringPoint();
					completeFunc.call(null);
				}
			}
			function err(): void
			{
				var bmpData: BitmapData = new BitmapData(100, 100, true, 0x808080);
				_myBitmap.bitmapData = bmpData;
				_myBitmap.smoothing = true;
				defaultWidth = 100;
				defaultHeight = 100;
				centeringPoint();
				completeFunc.call(null);
			}
		}
	}
}
