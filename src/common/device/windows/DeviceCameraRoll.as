package
{
	/*
	未完成です。
	setImageLoaderHandlerを作る
	selectedFile を読み込んで BitmapData で返す
	*/
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.net.FileFilter;
	import flash.events.Event;
	import common.*;

	public class DeviceCameraRoll
	{
		public static const OK: String        = "ok";
		public static const NG: String        = "ng";
		public static const CANCEL: String    = "cancel";
		public static const NOSUPPORT: String = "nosupport";

		//イベント通知関数
		private var eventFnc: Function;

		//オプション
		private var option: Object;

		//カメラロールで選択したファイル
		private var browseFile: File;

		//カメラロールで選択したファイル
		private var selectedFile: File;

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

			setBrowseHandler( false );
			browseFile = null;

			selectedFile = null;
		}

		//終了処理
		private function closeCameraRoll(): void
		{
			// setImageLoaderHandler( false );
			// if( imageLoader != null )
			// {
			// 	imageLoader.unload();
			// }
			// imageLoader = null;
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
			var imageFilter: FileFilter;

			option = opt;

			eventFnc = ef;

			imageFilter = new FileFilter( "画像ファイル", "*.jpg;*.jpeg;*.JPG;*.JPEG;*.png;*.PNG;*.gif;*.GIF" );

			//ディレクトリ指定
			browseFile = null;
			if( CommonUtils.hasOwnPropertyCheck( option, "directory" ) )
			{
				browseFile = option.directory as File;
			}
			if( browseFile == null )
			{
				browseFile = new File();
			}

			setBrowseHandler( true );
			browseFile.browseForOpen( "画像を選択してください", [imageFilter] );
		}

		//画像ローダハンドラ設定
		private function setBrowseHandler( flag: Boolean ): void
		{
			if( browseFile != null )
			{
				if( flag )
				{
					browseFile.addEventListener( Event.SELECT, selectImageFileDialogHandler );
					browseFile.addEventListener( Event.CANCEL, cancelImageFileDialogHandler );
				}
				else
				{
					browseFile.removeEventListener( Event.SELECT, selectImageFileDialogHandler );
					browseFile.removeEventListener( Event.CANCEL, cancelImageFileDialogHandler );
				}
			}
		}

		//画像ファイル選択ダイアログ・ファイル選択時の処理( Windows )
		private function selectImageFileDialogHandler( e: Event ): void
		{
			setBrowseHandler( false );

			selectedFile = e.target as File;

			if( selectedFile != null )
			{
			}
			else
			{
				callEvent( NG, null );
			}
		}

		//画像ファイル選択ダイアログ・ファイル選択時の処理
		private function cancelImageFileDialogHandler( e: Event ): void
		{
			setBrowseHandler( false );
			callEvent( NG, null );
		}
	}
}

