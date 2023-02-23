package kuraraysaijo.controller.documentroot.reportscreen.sidebar
{
	import controller.utils.Button;
	import flash.events.MouseEvent;

	public class OptionToolBtn extends Button
	{
		public function OptionToolBtn()
		{
			super();
		}

		override protected function doing(): void
		{
			switch(vcName)
			{
				case "settingsKuraraySaijoBtn":
					PostBox.send("showContainer", {container: "settingsKuraraySaijoContainer"});
					break;
				default:
					super.doing();
			}
		}
	}
}
