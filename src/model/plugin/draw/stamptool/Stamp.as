package model.plugin.draw.stamptool
{
	import common.*;
	import model.plugin.draw.Draw;
	//import plugin.draw.imagetool.ImageTool;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.filesystem.File;

	public class Stamp
	{
		public static var stampElement: XML = XML(<stamp/>);
		public var myStampElement: XML;
		public var myBitmapData: BitmapData;
		public var myIndex: uint;
		public var mxml: Object;
		public var body: Sprite;
		public var vcName: String;
		public var dirName: String;
		public var caller: VC;
		private var _tmpPoint: Point;
		private var _cancelFlag: Boolean

		public function Stamp(parent: Object, myName: String, dirName: String, myXML: XML, bitmapData: BitmapData)
		{
			vcName = myName;
			this.dirName = dirName;
			myStampElement = myXML;
			myBitmapData = bitmapData;
			caller = parent as VC;
			parent.stampCollection.addItem(this);
			myIndex = parent.stampCollection.getItemIndex(this);
			mxml = caller.mxml.stampList.getElementAt(myIndex).stampItem.skin;
			body = mxml.body;
			_tmpPoint = new Point(0, 0);
			setBitmap(body);
		}

		public function setBitmap(bitmapBody: Sprite): void
		{
			var bmp: Bitmap = new Bitmap(myBitmapData);
			var scale: Number = myBitmapData.width > myBitmapData.height ? bitmapBody.width / myBitmapData.width : bitmapBody.height / myBitmapData.height;
			scale = scale > 1.0 ? 1 : scale;
			bmp.width = myBitmapData.width * scale;
			bmp.height = myBitmapData.height * scale;
			bmp.x = (bitmapBody.width - bmp.width) / 2;
			bmp.y = (bitmapBody.height - bmp.height) / 2;
			bmp.smoothing = true;
			bitmapBody.addChild(bmp);
		}

		public function get width(): Number
		{
			return myBitmapData.width;
		}
		public function get height(): Number
		{
			return myBitmapData.height;
		}
	}
}
