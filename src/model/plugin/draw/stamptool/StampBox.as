package model.plugin.draw.stamptool
{
/**
 * スタンプを入れるボックス.
 * EditBoxを継承している。
 *
 * update 2018/03/14
 * 時間巻き戻し時にボックスサイズの不具合があったものを修正
 * 
 * @private
 */
	import common.*;
	import model.plugin.draw.*;
	import model.plugin.draw.edittool.EditBox;
	import model.plugin.draw.edittool.Operation;
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.events.*;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	public class StampBox extends EditBox
	{
		private var _myBitmap: Bitmap;
		private var _fileName: String;
		private var _stampBox: Sprite;

		public function StampBox(drawPanel: Object, targetLayer: Object, bufferVal: Object, imageFile: File, completeFunc: Function): void
		{
			var opList: Array = [
				Operation.ROTATION,
				Operation.SCALE_XY,
				Operation.SCALE_X,
				Operation.SCALE_Y,
				Operation.LOCK
			];
			this.targetPanel = drawPanel as DrawPanel;
			this.targetLayer = targetLayer as DrawLayer;
			name = bufferVal.id;
			id = bufferVal.id;
			super();
			_fileName = imageFile.name;

			_stampBox = new Sprite();
			_stampBox.mouseEnabled = false;
			box.addChild(_stampBox);


			_myBitmap = new Bitmap();
			body = _myBitmap;
			_stampBox.addChild(_myBitmap);

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
					_myBitmap.width = _myBitmap.bitmapData.width;
					_myBitmap.height = _myBitmap.bitmapData.height;

					//var stampScale: Number = _myBitmap.width >= _myBitmap.height ? Draw.stampSize / _myBitmap.width : Draw.stampSize / _myBitmap.height;

					/*
					if(_myBitmap.width >= _myBitmap.height)
					{
						defaultWidth = Draw.stampSize;
						defaultHeight = Draw.stampSize * (_myBitmap.height / _myBitmap.width);
					}
					else
					{
						defaultWidth = Draw.stampSize * (_myBitmap.width / _myBitmap.height);
						defaultHeight = Draw.stampSize;
					}
					*/
					defaultWidth = bufferVal.stroke[0].width;
					defaultHeight = bufferVal.stroke[0].height;

					//box.width = defaultWidth;//Draw.stampSize;
					//box.height = defaultHeight;//Draw.stampSize;

					/*
					box.graphics.clear();
					box.graphics.beginFill(0xeeee00, 0.5);
					box.graphics.drawRect(0, 0, box.width, box.height);
					box.graphics.endFill();
					*/

					_stampBox.width = defaultWidth;
					_stampBox.height = defaultHeight;
					//box.x = (Draw.stampSize - defaultWidth) / 2;
					//box.y = (Draw.stampSize - defaultHeight) / 2;

					//trace("■**", Draw.stampSize, stampScale, box.width, box.height, _stampBox.width, _stampBox.height, _myBitmap.width, _myBitmap.height);

					centeringPoint();
					completeFunc.call(null);
				}
			}
			function err(): void
			{
			}
		}
	}
}
