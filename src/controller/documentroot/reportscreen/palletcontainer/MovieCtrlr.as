package controller.documentroot.reportscreen.palletcontainer
{
	import controller.App;
	import flash.events.MouseEvent;
	public class MovieCtrlr extends VC
	{
		public function MovieCtrlr()
		{
			vcName = "movieCtrlr";
			elementName = "Group";
			super();
		}

		override protected function init(): void
		{
			mxml.parent.mouseEnabled = false;
			mxml.mouseEnabled = false;
			mxml.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler);
		}

		public function MSG_appStart_after(): void
		{
		}

		private function _mouseDownHandler(evt: MouseEvent): void
		{
			switch(evt.target.name)
			{
				case "bg":
				case "time":
				case "speakerIcon":
					_startDrag();
					break;
			}
			function _startDrag(): void
			{
				App.mainStage.addEventListener(MouseEvent.MOUSE_UP, _stopDrag);
				mxml.startDrag(false);
				function _stopDrag(e: MouseEvent): void
				{
					App.mainStage.removeEventListener(MouseEvent.MOUSE_UP, _stopDrag);
					mxml.stopDrag();
				}
			}
		}

		public function PB_changeChapter(): void
		{
			var param: Object = PostBox.get("PB_changeChapter");
			if(param.action != null)
			{
				mxml.centerBtn.skin.icon.currentState = "stop";
			}
		}

		public function PB_actionMovie(): void
		{
			var param: Object = PostBox.get("PB_actionMovie");
			switch(param.action)
			{
				case "pause":
					mxml.centerBtn.skin.icon.currentState = "stop";
					break;
			}
		}
	}
}
