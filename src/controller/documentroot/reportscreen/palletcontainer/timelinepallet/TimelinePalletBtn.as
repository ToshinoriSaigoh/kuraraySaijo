package controller.documentroot.reportscreen.palletcontainer.timelinepallet
{
	import controller.App;
	import controller.utils.Button;
	import flash.geom.Rectangle;
	import flash.events.MouseEvent;
	public class TimelinePalletBtn extends Button
	{
		public function TimelinePalletBtn()
		{
			super();
		}
		override protected function doing(): void
		{
			switch(vcName)
			{
				case "chapterPrevBtn":
					PostBox.send("changeChapter", {action: "prev"});
					break;
				case "chapterNextBtn":
					PostBox.send("changeChapter", {action: "next"});
					break;
				default:
					super.doing();
			}
		}
	}
}
