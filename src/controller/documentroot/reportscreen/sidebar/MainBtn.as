package controller.documentroot.reportscreen.sidebar
{
	import model.plugin.draw.Draw;
	import controller.utils.Button;
	import flash.events.MouseEvent;

	public class MainBtn extends Button
	{
		public function MainBtn()
		{
			super();
		}

		override protected function doing(): void
		{
			PostBox.send("flushBuffer", {buffer: "saveBuffer"});
			switch(vcName)
			{
				case "changeBtn":
					PostBox.send("changeMenu");
					break;
				case "monitorBtn":
					PostBox.send("showMonitor", {value: null});
					break;
				case "emergency1Btn":
					PostBox.send("changeTool", {tool: "fileTool"});
					PostBox.send("changeOpenFileList", {index: 2});
					break;
				case "emergency2Btn":
					PostBox.send("changeTool", {tool: "fileTool"});
					PostBox.send("changeOpenFileList", {index: 1});
					break;
			}
		}
	}
}
