package common
{
	import common.*;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.ProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import flash.utils.ByteArray;
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	public class ImageUtils
	{
		//URLから画像読み込み
		public static function loadImageByURL(url: String, resultFunc: Function=null, notFoundFunc: Function=null, errFunc: Function=null): void
		{
			var request: URLRequest = new URLRequest(url);
			var loader: Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.INIT, loadCompleteHandler);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			loader.load(request);

			function loadCompleteHandler(e: Event): void
			{
				loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadCompleteHandler);
				loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);

				if(resultFunc != null)
				{
					resultFunc.call(null, loader);
				}
			}
			function ioErrorHandler(e: IOErrorEvent): void
			{
				loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadCompleteHandler);
				loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);

				if(errFunc != null)
				{
					errFunc.call();
				}
			}
		}

		//ファイルから画像読み込み
		public static function loadImage(file: File, resultFunc: Function=null, notFoundFunc: Function=null, errFunc: Function=null): void
		{
			var bytes: ByteArray;
			var loader: Loader;

			if(file == null)
			{
				//Log.debug(ImageUtils, "loadImage: file is nul");
				if(errFunc != null)
				{
					errFunc.call();
				}
				return;
			}

			//ファイルからByteArrayで読み込み
			if(StorageUtils != null)
			{
				StorageUtils.loadBinaryFile(file, completeLoad);
			}
			else
			{
				//Log.debug(ImageUtils, "loadImage: file is nul");
				if(errFunc != null)
				{
					errFunc.call();
				}
				return;
			}

			//読み込み完了
			function completeLoad(res: String, ba: ByteArray): void
			{
				if(res == StorageUtils.OK && ba != null)
				{
					bytes = ba;
					createLoaderFromByteArray(bytes, completeLoadFromBytes);
					return;
				}
				else if(res == StorageUtils.FILE_NOT_FOUND)
				{
					//Log.debug(ImageUtils, "loadImage: file dose not exists");
					if(notFoundFunc != null)
					{
						notFoundFunc.call();
						return;
					}
				}
				completeLoadFromBytes(null);
			}

			function completeLoadFromBytes(loader: Loader): void
			{
				if(loader != null)
				{
					if(resultFunc != null)
					{
						resultFunc.call(null, loader, bytes);
					}
				}
				else
				{
					if(errFunc != null)
					{
						errFunc.call();
					}
				}
			}
		}

		//ByteArrayからloaderを作成
		public static function createLoaderFromByteArray(bytes: ByteArray, resultFunc: Function): void
		{
			var loader: Loader;
			if(bytes != null)
			{
				if(bytes.length > 0)
				{
					loader = new Loader();
					loader.contentLoaderInfo.addEventListener(Event.INIT, loadCompleteHandler);
					loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
					loader.loadBytes(bytes);
					return;
				}
			}
			callCmp(null);

			function loadCompleteHandler(e: Event): void
			{
				loader.contentLoaderInfo.removeEventListener(Event.INIT, loadCompleteHandler);
				loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
				callCmp(loader);
			}

			function ioErrorHandler(e: IOErrorEvent): void
			{
				loader.contentLoaderInfo.removeEventListener(Event.INIT, loadCompleteHandler);
				loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
				loader = null;
				callCmp(null);
			}

			function callCmp(res: Loader): void
			{
				if(resultFunc != null)
				{
					resultFunc.call(null, res);
				}
			}
		}

		public static function unloadImage(loader: Loader): void
		{
			if (loader && loader.content)
			{
				var bmp: Bitmap = loader.content as Bitmap;
				if(bmp != null)
				{
					var bmpData: BitmapData = bmp.bitmapData;
					bmpData.dispose();
					bmpData = null;
					loader.unload();
					loader = null;
				}
				else
				{
					loader.unload();
					loader = null;
				}
			}
		}

		//ビットマップのクローン
		public static function cloneImage(loader: Loader): BitmapData
		{
			var res: BitmapData = null;
			if (loader != null)
			{
				if (loader.content != null)
				{
					var bmp: Bitmap;
					var bmpData: BitmapData;
					bmp = loader.content as Bitmap;
					if(bmp != null)
					{
						bmpData = bmp.bitmapData;
						res = bmpData.clone();
					}
					else
					{
						var mc: MovieClip = loader.content as MovieClip;
						if(mc != null)
						{
							res = new BitmapData(mc.width, mc.height, false, 0x000000);
							res.draw(mc);
						}
					}
				}
			}
			return res;
		}

		//元画像データからスケール指定でコピーを作成
		public static function createResizeBitmapDataByScale(src: BitmapData, scale: Number, transparent: Boolean=true, fillColor: uint=0xFFFFFFFF): BitmapData
		{
			var bmpData: BitmapData;
			var width: uint;
			var height: uint;
			var mat: Matrix;
			if(src != null)
			{
				width  = uint(src.width * scale);
				height = uint(src.height * scale);
				bmpData = new BitmapData(width, height, transparent, fillColor);
				mat = new Matrix();
				mat.scale(scale, scale);
				bmpData.draw(src, mat);
			}
			return bmpData;
		}
	}
}