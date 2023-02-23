package controller
{
	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.NativeWindowType;
	import flash.display.NativeWindowSystemChrome;
	import flash.events.Event;
	public class Window
	{
		public static var mainWindow: NativeWindow;
		public static var mainStage: Stage;
		private static var _width: Number;
		private static var _height: Number;
		public function Window(stage: Stage)
		{
			mainStage = stage;
			mainWindow = stage.nativeWindow;
			mainStage.align = StageAlign.TOP_LEFT;
			mainStage.scaleMode = StageScaleMode.NO_SCALE;
		}

		public static function maximize(): void
		{
			mainWindow.maximize();
		}
		public static function minimize(): void
		{
			mainWindow.minimize();
		}
		public static function restore(): void
		{
			mainWindow.restore();
		}
		public static function set width(val: Number): void
		{
			_width = val;
			mainWindow.width = _width;
		}
		public static function get width(): Number
		{
			_width = mainWindow.width;
			return _width;
		}
		public static function set height(val: Number): void
		{
			_height = val;
			mainWindow.height = _height;
		}
		public static function get height(): Number
		{
			_height = mainWindow.height;
			return _height;
		}
	}
}