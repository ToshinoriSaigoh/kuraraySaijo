package controller.documentroot.reportscreen.sidebar
{
	public class ShapeToolBox extends VC
	{
		public function ShapeToolBox()
		{
			vcName = "shapeToolBox";
			elementName = "NavigatorContent";
		}

		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			if(param.tool != "shapeTool") return;

			if(param.hasOwnProperty("mode"))
			{
				_changeMode(param.mode);
			}
			if(param.hasOwnProperty("type"))
			{
				_changeType(param.type);
			}
		}

		private function _changeMode(mode: String): void
		{
			mxml.shapeModeNormalBtn.selected = mode == "normal" ? true : false;
			mxml.shapeModeDecenterBtn.selected = mode == "decenter" ? true : false;
		}
		private function _changeType(type: String): void
		{
			mxml.shapeTypeRectBtn.selected = type == "rect" ? true : false;
			mxml.shapeTypeCircleBtn.selected = type == "circle" ? true : false;
		}
	}
}
