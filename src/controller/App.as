package controller
{
	import view.documentroot.*;
	import model.*;
	import model.app.*;
	import model.plugin.report.Report;
	import model.plugin.report.emergency.Emergency;
	import kuraraysaijo.model.plugin.config.*;
	import kuraraysaijo.model.batch.ReportChanger;
	import kuraraysaijo.model.sensor.*;

	import model.plugin.network.channel.*;
	import model.plugin.network.clusterdata.*;
	import model.app.network.*;

	import model.plugin.screenshot.*;

	import model.plugin.clock.Clock;

	import common.db.DB;
	import common.PlatformUtils;
	import common.StorageUtils;
	import flash.display.Sprite;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.desktop.NativeApplication;
	import flash.ui.Keyboard;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.display.StageDisplayState;
	import flash.desktop.SystemIdleMode;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.utils.setTimeout;
	import flash.net.Responder;

	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.NativeWindowType;
	import flash.display.NativeWindowSystemChrome;
	//import flash.system.System;

	public class App extends Main
	{
		public static var appDir: File;
		public static var appDB: DB;
		public static var appType: String;//host or client
		public static var myTerminalID: String;
		public static var mainWindow: NativeWindow;
		public static var mainStage: Stage;

		private static var _app: Object;
		private static var _width: Number;
		private static var _height: Number;

		public function App()
		{
			//System.useCodePage = true;//SJIS
			new Config();
			new HolidayConfig();
			new ScheduleConfig();
			new PersonConfig();
			//new Emergency();
			myTerminalID = "member";
			super();

			Global.define("appType", App);
			Global.define("myTerminalID", App);

			new Channel();
			new ClusterDataSender();
			new ClusterDataReceiver();
			ClusterDataSender.setInstruction({action: "start"});
			new ChannelManager();
			new ShareReport();
			new ShareDraw();
			new ShareImage();
			//new EmergencyNotification();
			new GenericAction();
			new ScreenShot();
			new Clock();
			new ReportChanger();
			new WBGTConfig();
			new AnemometerConfig();
			new SensorInfo();
			new MeetingroomInfo();
			new PersonInfo();

		}

		//アプリ開始時処理
		public function MSG_appStart(): void
		{
			Lib.startTimer();
			setTimeout(changeScreen, 3000);
			function changeScreen(): void
			{
				//new Debug();
				PostBox.send("sensorCtrl", {command:"start"});
				PostBox.send("personCtrl", {command:"start"});
				PostBox.send("meetingroomCtrl", {command:"start"});
				PostBox.send("clockCtrl", {command:"start"});
				PostBox.send("changeScreen", {screen: "reportScreen"});
			}
		}
		//アプリ終了時処理
		public function GW_appClose(): void
		{
			appClose();
			/*アプリがDBを使用する場合の非同期処理
			var responder: Responder = new Responder(complete);
			DB.close(responder);//DB切断
			function complete(): void
			{
				trace("GW_appClose");
				GroupWork.done("GW_appClose");
			}
			*/
		}
		//アプリ終了前にすべてのレポートを閉じる
		public function GW_closeReportAll(): void
		{
			_closeReportAll();
		}

		/*
		Report.closeReport()で同時に複数のPostBox.send("saveZip")を呼ぶ場合、GroupWorkで同じsaveZipが重なってcompFuncが消えてしまう。
		すべてのレポートを閉じるときは、ひとつずつレポートを保存して終了し、最後にGroupWork.done("GW_closeReportAll")する。
		*/
		private function _closeReportAll(): void
		{
			var cnt: int = Report.reportList.length - 1;
			if(cnt == 0)
			{
				Report.reportList[cnt].closeReport(__compFunc);
			}
			else
			{
				Report.reportList[cnt].closeReport(_closeReportAll);
			}

			function __compFunc(): void
			{
				GroupWork.done("GW_closeReportAll");
			}
		}

		public function PB_changeScreen(): void
		{
			var param: Object = PostBox.get("PB_changeScreen");
			mxml.rootViewStack.selectedChild = mxml[param.screen];
		}
		public function MSG_minimizeWindow(): void
		{
			minimize();
		}

		override protected function init(): void
		{
			super.init();
			switch(mxml.appType)
			{
				case "host":
					break;
				case "client":
					_app = new ClientApp(this);
					break;
			}
			appDir = Lib.getSystemFileObject("temp");
		}

		override protected function appStart(): void
		{
			mainStage = mxml.stage;
			mainWindow = mxml.stage.nativeWindow;
			mainStage.align = StageAlign.TOP_LEFT;
			mainStage.scaleMode = StageScaleMode.NO_SCALE;
			mainStage.addEventListener(Event.RESIZE, _windowResizeHandler);
			Dom.domTree = myElement;
			super.appStart();
			_setClosingSetting();//アプリ終了時設定

			//システムディレクトリ内レポートファイルを削除して次へ進む
			var dir: File = Lib.getSystemFileObject("report");
			StorageUtils.deleteDirectory(dir, _next);

			function _next(): void
			{
				//new Debug();
				//maximize();
				//_disableEscapeKey();
				//_setTouchPoint();
				//_setKeepAwake();
				_setFullScreenSetting();
			}
		}
		override protected function appClose(): void
		{
			var superAppClose: Function = super.appClose;
			__exit();
			function __exit(): void
			{
			var nativeApplication: NativeApplication;
			var exitingEvent: Event;
				nativeApplication = NativeApplication.nativeApplication;
				exitingEvent = new Event(Event.EXITING, false, true);
				nativeApplication.dispatchEvent(exitingEvent);
				if(exitingEvent.isDefaultPrevented() == false)
				{
					PostBox.send("closeReportAll", {}, superAppClose);
				}
			}
		}
		//終了処理ハンドラ設定
		private function _setClosingSetting(): void
		{
			var nativeApplication: NativeApplication;
			if(PlatformUtils.osCheck(PlatformUtils.WINDOWS))
			{
				nativeApplication = NativeApplication.nativeApplication;
				mxml.stage.nativeWindow.addEventListener(Event.CLOSING, _closingHandler);
			}
			function __applicationExitHander(evt: Event): void
			{
				appClose();
			}
		}


		private function _windowResizeHandler(e: Event): void
		{
			PostBox.send("windowResize");
		}
		//タッチパネルのある端末で TOUCH_POINT を設定すると
		//MOUSE_DOWNが取れるようになるようなのでここで設定
		private function _setTouchPoint(): void
		{
			if(Multitouch.supportsTouchEvents)
			{
				Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			}
		}

		//スリープ状態にしないようにする
		private function _setKeepAwake(): void
		{
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
		}

		//ウィンドウを閉じる時のイベントハンドラ
		private function _closingHandler(evt: Event): void
		{
			evt.preventDefault();
			PostBox.send("appClose", null, __exit);

			function __exit(): void
			{
			var nativeApplication: NativeApplication;
			var exitingEvent: Event;
				nativeApplication = NativeApplication.nativeApplication;
				exitingEvent = new Event(Event.EXITING, false, true);
				nativeApplication.dispatchEvent(exitingEvent);
				if(exitingEvent.isDefaultPrevented() == false)
				{
					appClose();
				}
			}
		/*
			//Log.debug(this, "_closingHandler: ", appClosingType);
			if(appClosingType == null)
			{
				nativeApplication = NativeApplication.nativeApplication;
				exitingEvent = new Event(Event.EXITING, false, true);
				nativeApplication.dispatchEvent(exitingEvent);
				if(exitingEvent.isDefaultPrevented() == false)
				{
					appClose();
				}
			}
			else if(appClosingType == "operation")
			{
				e.preventDefault();
				if(Global.get("appType") == "host")
				{
					PostBox.send("closeReportScreenConfirm", { screen: "hostMenuScreen" });
				}
				else if(Global.get("appType") == "client")
				{
					PostBox.send("closeReportScreenConfirm", { screen: "clientMenuScreen" });
				}
			}
		*/
		}

		//フルスクリーン設定
		private function _setFullScreenSetting(): void
		{
			if(NativeWindow.isSupported == false) return;
			App.mainStage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			if(PlatformUtils.osCheck(PlatformUtils.WINDOWS))
			{
				App.mainStage.nativeWindow.addEventListener(Event.ACTIVATE, onActivate);
			}
			function onActivate(e: Event): void
			{
				if(App.mainStage != null && App.mainStage.displayState != StageDisplayState.FULL_SCREEN_INTERACTIVE)
				{
					App.mainStage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
				}
			}
		}

		//ESCキー無効化
		private function _disableEscapeKey(): void
		{
			if(PlatformUtils.osCheck(PlatformUtils.WINDOWS))
			{
				Global.documentRoot.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			}
			function keyDownHandler(e: KeyboardEvent): void
			{
				if(e.keyCode == Keyboard.ESCAPE)
				{
					e.preventDefault();
				}
			}
		}

		//window
		private function _resizeHandler(e: Event): void
		{
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
