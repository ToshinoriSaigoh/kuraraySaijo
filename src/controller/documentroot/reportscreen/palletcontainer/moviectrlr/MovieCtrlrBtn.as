package controller.documentroot.reportscreen.palletcontainer.moviectrlr
{
	import controller.utils.Button;
	import model.plugin.draw.Draw;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	public class MovieCtrlrBtn extends Button
	{
		private static var _countDownCnt: uint;
		private static var _countDownTimer: uint;
		public function MovieCtrlrBtn()
		{
			super();
		}
		override protected function doing(): void
		{
			switch(vcName)
			{
				case "centerBtn":
					switch(mxml.icon.currentState)
					{
						case "stop":
							_startCountDown();
							break;
						case "playPause":
							PostBox.send("actionMovie", {action: "play"});
							break;
						case "rec":
						case "play":
							PostBox.send("showPallet", {pallet: "timelinePallet", value: "show"});
							PostBox.send("actionMovie", {action: "pause"});
							break;
					}
					break;
				case "playBtn":
					PostBox.send("actionMovie", {action: "play"});
					break;
				case "stopBtn":
					PostBox.send("showPallet", {pallet: "timelinePallet", value: "show"});
					PostBox.send("actionMovie", {action: "stop"});
					break;
				case "prevBtn":
					PostBox.send("changeChapter", {action: "prev"});
					break;
				case "nextBtn":
					PostBox.send("changeChapter", {action: "next"});
					break;
				case "countDownBtn":
					PostBox.send("actionMovie", {action: "pause"});
					_cancelCountDown();
					break;
				default:
					super.doing();
			}
		}
		private function _startCountDown(): void
		{
			_countDownCnt = 3;
			mxml.parent.document.countDownBtn.skin.icon.currentState = "cnt" + String(_countDownCnt);
			mxml.parent.document.countDownBtn.visible = true;
			_countDownTimer = setTimeout(_setCountDown, 1000);
		}
		private function _cancelCountDown(): void
		{
			clearTimeout(_countDownTimer);
			mxml.parent.document.countDownBtn.visible = false;
		}
		private function _setCountDown(): void
		{
			_countDownCnt--;
			if(_countDownCnt == 0)
			{
				mxml.parent.document.countDownBtn.visible = false;
				PostBox.send("showPallet", {pallet: "timelinePallet", value: "hide"});
				PostBox.send("actionMovie", {action: "rec"});
			}
			else if(_countDownCnt != 0)
			{
				mxml.parent.document.countDownBtn.skin.icon.currentState = "cnt" + String(_countDownCnt);
				_countDownTimer = setTimeout(_setCountDown, 1000);
			}
		}
	}
}
