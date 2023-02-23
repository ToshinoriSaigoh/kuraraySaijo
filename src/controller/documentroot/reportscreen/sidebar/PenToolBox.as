package controller.documentroot.reportscreen.sidebar
{
	public class PenToolBox extends VC
	{
		public function PenToolBox()
		{
			vcName = "penToolBox";
			elementName = "NavigatorContent";
		}

		override protected function init(): void
		{
		}

		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			if(param.tool != "penTool" && param.tool != "hideTool") return;

			if(param.hasOwnProperty("type"))
			{
				_changeType(param.type);
			}
			if(param.hasOwnProperty("line"))
			{
				_changeLine(param.line);
			}
		}

		private function _changeType(type: String): void
		{
			mxml.penTypeLaserBtn.selected = type == "laser" ? true : false;
			mxml.penTypePenBtn.selected = type == "pen" ? true : false;
			mxml.penTypeMarkerBtn.selected = type == "marker" ? true : false;
			mxml.penTypeEraserBtn.selected = type == "eraser" ? true : false;
		}
		private function _changeLine(line: String): void
		{
			mxml.curvelineBtn.selected = line == "curveLine" ? true : false;
			mxml.straightlineBtn.selected = line == "straightLine" ? true : false;
		}
	}
}
