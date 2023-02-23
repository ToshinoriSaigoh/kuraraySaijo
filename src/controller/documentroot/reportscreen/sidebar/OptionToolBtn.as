package controller.documentroot.reportscreen.sidebar
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
				case "deleteBtn":
					PostBox.send("actionTool", {tool: "editTool", operation: "delete"});
					break;

				case "penTypeLaserBtn":
					PostBox.send("changeTool", {tool: "penTool", type: "laser"});
					break;
				case "penTypePenBtn":
					PostBox.send("changeTool", {tool: "penTool", type: "pen"});
					break;
				case "penTypeMarkerBtn":
					PostBox.send("changeTool", {tool: "penTool", type: "marker"});
					break;
				case "penTypeEraserBtn":
					//PostBox.send("changeTool", {tool: "penTool", type: "eraser"});
					PostBox.send("changeTool", {tool: "hideTool", type: "eraser"});
					break;
				case "curvelineBtn":
					PostBox.send("changeTool", {tool: "penTool", line: "curveLine"});
					break;
				case "straightlineBtn":
					PostBox.send("changeTool", {tool: "penTool", line: "straightLine"});
					break;
				case "undoToolBtn":
					PostBox.send("actionTool", {tool: "penTool", type: "undo"});
					break;

				case "stampPalletBtn":
					PostBox.send("showPallet", {pallet: "stampPallet"});
					break;
				case "imageCenterBtn":
					PostBox.send("actionTool", {tool: "imageTool", fitting: "center"});
					break;
				case "imageHorizontalBtn":
					PostBox.send("actionTool", {tool: "imageTool", fitting: "horizontal"});
					break;
				case "imageVerticalBtn":
					PostBox.send("actionTool", {tool: "imageTool", fitting: "vertical"});
					break;
				case "imageBGBtn":
					PostBox.send("actionTool", {tool: "imageTool", fitting: "bg"});
					break;
				case "screenshotBtn":
					PostBox.send("actionTool", {tool: "screenshotTool"});
					break;
				case "lineColorBtn":
					PostBox.send("showPallet", {pallet: "colorPallet", type: "line"});
					break;
				case "fillColorBtn":
					PostBox.send("showPallet", {pallet: "colorPallet", type: "fill"});
					break;
				case "shapeModeNormalBtn":
					PostBox.send("changeTool", {tool: "shapeTool", mode: "normal"});
					break;
				case "shapeModeDecenterBtn":
					PostBox.send("changeTool", {tool: "shapeTool", mode: "decenter"});
					break;
				case "shapeTypeRectBtn":
					PostBox.send("changeTool", {tool: "shapeTool", type: "rect"});
					break;
				case "shapeTypeCircleBtn":
					PostBox.send("changeTool", {tool: "shapeTool", type: "circle"});
					break;
				case "singleSelectBtn":
					PostBox.send("changeTool", {tool: "editTool", mode: "single"});
					break;
				case "multiSelectBtn":
					PostBox.send("changeTool", {tool: "editTool", mode: "multi"});
					break;

				case "scrollCenteringBtn":
					PostBox.send("changeScale", {operation: "reset"});
					break;
				case "settingsToolBtn":
					PostBox.send("showContainer", {container: "settingsToolContainer"});
					break;
				case "settingsLinkBtn":
					PostBox.send("showContainer", {container: "settingsLinkContainer"});
					break;
				case "settingsEmergencyBtn":
					PostBox.send("showContainer", {container: "settingsEmergencyContainer"});
					break;
				default:
					super.doing();
			}
		}
	}
}
