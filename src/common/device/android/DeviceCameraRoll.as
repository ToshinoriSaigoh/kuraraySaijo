package
{
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.net.FileFilter;

	import flash.media.CameraRoll;
	import flash.media.MediaType;
	import flash.media.MediaPromise;
	import flash.permissions.PermissionStatus;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.JPEGEncoderOptions;
	import flash.events.Event;
	import flash.events.MediaEvent;
	import flash.events.PermissionEvent;
	import flash.events.ErrorEvent;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	import common.*;

	public class DeviceCameraRoll
	{
		public static const OK: String        = "ok";
		public static const NG: String        = "ng";
		public static const CANCEL: String    = "cancel";
		public static const NOSUPPORT: String = "nosupport";

		//イベント通知関数
		private var eventFnc: Function;

		//カメラロール
		private var mediaSource: CameraRoll;

		//画像ローダー
		private var imageLoader: Loader;

		//オプション
		private var option: Object;

		//コンストラクタ
		public function DeviceCameraRoll()
		{
			super();
			reset();
		}

		//リセット
		public function reset(): void
		{
			eventFnc = null;

			option = null;

			closeCameraRoll();
		}

		//終了処理
		private function closeCameraRoll(): void
		{
			setCameraRollHandler( false );
			mediaSource = null;

			setImageLoaderHandler( false );
			if( imageLoader != null )
			{
				imageLoader.unload();
			}
			imageLoader = null;
		}

		//イベント通知
		private function callEvent( event: String, param: Object ): void
		{
			if( eventFnc != null )
			{
				eventFnc.call( null, event, param );
			}
		}

		//カメラロールオープン
		public function start( opt: Object, ef: Function ): void
		{
			var param: Object;

			option = opt;

			eventFnc = ef;

			if( CameraRoll.supportsBrowseForImage )
			{
				mediaSource = new CameraRoll();
				if( CameraRoll.permissionStatus != PermissionStatus.GRANTED )
				{
					mediaSource.addEventListener( PermissionEvent.PERMISSION_STATUS, permissionStatusHandler );
					try
					{
						mediaSource.requestPermission();
					}
					catch( e: Error )
					{
						closeCameraRoll();
						callEvent( NG, null );
					}
				}
				else
				{
					browseForImage();
				}
			}
			else
			{
				callEvent( NOSUPPORT, null );
			}
		}

		private function permissionStatusHandler( e: PermissionEvent ): void
		{
			if ( e.status == PermissionStatus.GRANTED )
			{
				browseForImage();
			}
			else
			{
				closeCameraRoll();
				callEvent( NOSUPPORT, null );
			}
		}

		private function browseForImage(): void
		{
			setCameraRollHandler( true );
			mediaSource.browseForImage();
		}

		//カメラロールハンドラ設定
		private function setCameraRollHandler( flag: Boolean ): void
		{
			if( mediaSource != null )
			{
				if( flag )
				{
					mediaSource.addEventListener( MediaEvent.SELECT, selectImageHandler );
					mediaSource.addEventListener( Event.CANCEL, cancelHandler );
				}
				else
				{
					mediaSource.removeEventListener( MediaEvent.SELECT, selectImageHandler );
					mediaSource.removeEventListener( Event.CANCEL, cancelHandler );
				}
			}
		}

		//画像ローダハンドラ設定
		private function setImageLoaderHandler( flag: Boolean ): void
		{
			if( imageLoader != null )
			{
				if( flag )
				{
					imageLoader.contentLoaderInfo.addEventListener( Event.INIT, completeLoadMediaPromiseHandler );
					imageLoader.contentLoaderInfo.addEventListener( IOErrorEvent.IO_ERROR, errorHandler );
				}
				else
				{
					imageLoader.contentLoaderInfo.removeEventListener( Event.INIT, completeLoadMediaPromiseHandler );
					imageLoader.contentLoaderInfo.removeEventListener( IOErrorEvent.IO_ERROR, errorHandler );
				}
			}
		}

		//選択イベントハンドラ
		private function selectImageHandler( e: MediaEvent ): void
		{
			var imagePromise: MediaPromise;

			setCameraRollHandler( false );

			imagePromise = e.data as MediaPromise;

			if( imagePromise != null )
			{
				imageLoader = new Loader();
				setImageLoaderHandler( true );
				imageLoader.loadFilePromise( imagePromise );
			}
			else
			{
				closeCameraRoll();
				callEvent( NG, null );
			}
		}

		//キャンセルイベントハンドラ
		private function cancelHandler( e: Event ): void
		{
			closeCameraRoll();
			callEvent( CANCEL, null );
		}

		//画像読み込み
		private function completeLoadMediaPromiseHandler( e: Event ): void
		{
			var bitmap: Bitmap;
			var bitmapData: BitmapData;

			setImageLoaderHandler( false );

			bitmap = e.target.content as Bitmap;

			if( bitmap )
			{
				bitmapData = bitmap.bitmapData.clone();
			}

			closeCameraRoll();
			if( bitmapData != null )
			{
				callEvent( OK, bitmapData );
			}
			else
			{
				callEvent( NG, null );
			}
		}

		//エラー
		private function errorHandler( error: ErrorEvent ): void
		{
			closeCameraRoll();
			callEvent( NG, null );
		}
	}
}

