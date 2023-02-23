package
{
	import model.plugin.draw.Draw;
	import controller.*;
	import common.*;
	import common.keyboard.*;
	import flash.display.Sprite;
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import mx.events.FlexEvent;

	public class Main extends VC
	{
		public var documentRoot: Sprite;
		public var isMouseDown: Boolean;//マウスダウン中
		public function Main()
		{
			isMouseDown = false;
			new Plugin();
			new Dom();
			Global.define("documentRoot", this);
			Global.define("isMouseDown", this);
			Global.define("activeDrawPanel", Draw);
			/*
			//new Log();
			*/
			elementName = "window";
			vcName = "documentRoot";
			super();
		}

		override public function initialized(document: Object, id: String): void
		{
			super.initialized(document, id);
			mxml.addEventListener(FlexEvent.APPLICATION_COMPLETE, _applicationCompleteHandler);
			function _applicationCompleteHandler(): void
			{
				mxml.removeEventListener(FlexEvent.APPLICATION_COMPLETE, _applicationCompleteHandler);
				documentRoot = mxml.body;
				appStart();
			}
		}
		protected function appStart(): void
		{
			PostBox.start();
			PostBox.send("appStart");
		}
		//終了処理
		protected function appClose(): void
		{
			EnterFrameProccess.dispose();
			var nativeApplication: NativeApplication;

			if(PlatformUtils.osCheck(PlatformUtils.IOS) == false)
			{
				nativeApplication = NativeApplication.nativeApplication;
				nativeApplication.exit();
				trace("EXIT");
			}
		}

		/*
		private function _start(cmpFnc: Function): void
		{
			if(PlatformUtils.osCheck(PlatformUtils.WINDOWS))
			{
				Win8Tabtip.checkWindowsDir(windowsDir);
			}
			else
			{
				dbStart();
			}
			function windowsDir(dir: String): void
			{
				Win8Tabtip.checkMode(resultWin8Tabtip);
				function resultWin8Tabtip(flag: Boolean): void
				{
					Global.set("windowsTabletMode", flag);
					dbStart();
				}
			}
			function dbStart(): void
			{
				//DB.start(null, "data.db", "sync", dbConnectComplete);//DB同期接続
			}
			function dbConnectComplete(): void
			{
				if(cmpFnc != null)
				{
					cmpFnc.call();
				}
			}
		}
		*/
	}
}
