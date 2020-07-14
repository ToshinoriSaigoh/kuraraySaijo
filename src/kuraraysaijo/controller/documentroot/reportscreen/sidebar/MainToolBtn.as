package kuraraysaijo.controller.documentroot.reportscreen.sidebar
{
	import controller.utils.Button;

	public class MainToolBtn extends Button
	{
		public function MainToolBtn()
		{
			super();
		}

		/*
		public function PB_changeTool(): void
		{
			//var param: Object = PostBox.get("PB_changeTool");
			//mxml.hostComponent.selected = param.tool == mxml.hostComponent.label ? true : false;
		}
		*/
		override protected function doing(): void
		{
			PostBox.send("flushBuffer", {buffer: "saveBuffer"});
			switch(vcName)
			{
				case "calendarBtn":
					PostBox.send("changeTool", {tool: "calendarTool"});
					break;
				case "changeModeBtn":
					PostBox.send("changeTool", {tool: "changeMode"});
					break;
				case "settingsBtn":
					PostBox.send("changeTool", {tool: "settings"});
					break;
				default:
					//super.doing();
			}
			PostBox.send("showPallet", {pallet: "stampPallet", value: "hide"});
			PostBox.send("showPallet", {pallet: "colorPallet", value: "hide"});
		}
	}
}
