package model.plugin.screenshot
{
	import common.TimerUtils;
	import controller.App;

	import view.ScreenShotWindow;//スクリーンショット制御ウィンドウ//m2okここに取り込むのは良いことか悪いことか？

	import flash.system.Capabilities;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.net.FileFilter;
	import flash.utils.ByteArray;
	import flash.errors.IOError;
	import spark.components.Window;
	//import com.genesi.desktop.ScreenShooter;

	public class ScreenShot extends Plug
	{
		private var _window: Window;
		public function ScreenShot()
		{
			super();
		}

		public function PB_actionTool(): void
		{
			var param: Object = PostBox.get("PB_actionTool");
			if(param.tool == "screenshotTool")
			{
				_openWindow();
			}
		}

		//スクリーンショットウィンドウ表示
		private function _openWindow(): void
		{
			App.minimize();

			if(_window == null)
			{
				_window = new ScreenShotWindow();
				_window.open();
				_window.nativeWindow.x = Capabilities.screenResolutionX - _window.nativeWindow.width;
				_window.nativeWindow.y = 0;
			}
		}

		private function _closeWindow(): void
		{
			if(_window != null)
			{
				_window.close();
				_window = null;
			}
		}

		//スクリーンショットウィンドウ非表示
		public function MSG_closeScreenShotWindow(): void
		{
			_closeWindow();
			App.restore();
		}

		//スクリーンショット実行
		public function MSG_screenShot(): void
		{
			_closeWindow();

			TimerUtils.delay(1000, closeDelay);
			function closeDelay(): void
			{
				//var scrShooter: ScreenShooter;
				var bytes: ByteArray;

				//scrShooter = new ScreenShooter();
				//bytes = scrShooter.getScreenShot();

				var file: File = Lib.getSystemFileObject("tmp/screenshot.image");//m2okパラメータで File を受け取るべきでは？
				var stream: FileStream = new FileStream();
				try
				{
					stream.open(file, FileMode.WRITE);
					stream.position = 0;
					stream.writeBytes(bytes);
					stream.close();
				}
				catch(ioError: IOError){}
				catch(securityError: SecurityError){}

				PostBox.send("createImageObject", {page: null, imageFile: file, fitting: "bg", author: "screenshot"});

				App.restore();
			}
		}
	}
}