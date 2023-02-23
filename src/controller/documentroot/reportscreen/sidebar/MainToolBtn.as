package controller.documentroot.reportscreen.sidebar
{
	import model.plugin.draw.Draw;
	import controller.utils.Button;
	import flash.events.MouseEvent;

	public class MainToolBtn extends Button
	{
		public function MainToolBtn()
		{
			super();
		}

		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			mxml.hostComponent.selected = param.tool == mxml.hostComponent.label ? true : false;
		}

		override protected function doing(): void
		{
			PostBox.send("flushBuffer", {buffer: "saveBuffer"});
			switch(vcName)
			{
				case "editToolBtn":
					PostBox.send("changeTool", {tool: "editTool", mode: "single"});
					break;
				case "stampToolBtn":
					PostBox.send("changeTool", {tool: "stampTool"});
					break;
				case "imageToolBtn":
					PostBox.send("changeTool", {tool: "imageTool"});
					break;
				case "penToolBtn":
					PostBox.send("changeTool", {tool: "penTool", line: "curveLine", type: "pen"});
					break;
				case "shapeToolBtn":
					PostBox.send("changeTool", {tool: "shapeTool"});
					break;
				case "undoToolBtn":
					PostBox.send("actionTool", {tool: "undo"});
					break;
				case "movieToolBtn":
					PostBox.send("showPallet", {pallet: "movieCtrlr"});
					break;
				case "scrollToolBtn":
					PostBox.send("changeTool", {tool: "scrollTool"});
					break;
				case "zoomToolBtn":
					PostBox.send("changeTool", {tool: "zoomTool"});
					break;
				case "textToolBtn":
					PostBox.send("changeTool", {tool: "textTool"});
					break;
				case "calendarBtn":
					PostBox.send("changeTool", {tool: "calendarTool"});
					break;
				case "fileToolBtn":
					PostBox.send("changeTool", {tool: "fileTool"});
					break;
				case "linkToolBtn":
					PostBox.send("changeTool", {tool: "linkTool"});
					break;
				case "timelineToolBtn":
					PostBox.send("changeTool", {tool: "timelineTool"});
					break;
				case "settingsBtn":
					PostBox.send("changeTool", {tool: "settings"});
					break;
				default:
					super.doing();
			}
			PostBox.send("showPallet", {pallet: "stampPallet", value: "hide"});
			PostBox.send("showPallet", {pallet: "colorPallet", value: "hide"});
		}
	}
}
