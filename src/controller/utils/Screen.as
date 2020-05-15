package controller.utils
{
	//import utils.*;
	public class Screen extends VC
	{
		public var viewIndex: int;
		//protected var myScreenInfo: Object;
		public function Screen()
		{
			super();

			/*
			myScreenInfo = {
				screen: vcName,
				screenMode: null,
				layer: null,
				reportID: null,
				page: null
			};
			*/
		}
		override protected function init(): void
		{
			viewIndex = caller.mxml.rootViewStack.getElementIndex(mxml);
		}

		/*
		public function updatePrevScreen(): void
		{
			var prevScreen: Object = Lib.clone(Global.get("currentScreen"));
			Global.set("prevScreen", prevScreen);
		}
		public function updateCurrentScreen(): void
		{
			Global.set("currentScreen", myScreenInfo);
		}

		public function PB_changeScreen(): void
		{
			var param: Object = PostBox.get("PB_changeScreen");
			
			if(param.screen == vcName)
			{
				updatePrevScreen();
				updateCurrentScreen();

				trace("■■Screen PB_changeScreen", vcName);
				trace(vcName, "prevScreen");
				Lib.dumpObject(Global.get("prevScreen"));
				trace(vcName, "currentScreen");
				Lib.dumpObject(Global.get("currentScreen"));
			}
			//switchUnique(param.screen);
		}
		*/
	}
}