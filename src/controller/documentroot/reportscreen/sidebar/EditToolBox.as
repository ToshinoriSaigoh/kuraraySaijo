package controller.documentroot.reportscreen.sidebar
{
	public class EditToolBox extends VC
	{
		public function EditToolBox()
		{
			vcName = "editToolBox";
			elementName = "NavigatorContent";
		}

		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			if(param.tool != "editTool") return;

			if(param.hasOwnProperty("mode"))
			{
				_changeMode(param.mode);
			}
		}

		private function _changeMode(mode: String): void
		{
			mxml.singleSelectBtn.selected = mode == "single" ? true : false;
			mxml.multiSelectBtn.selected = mode == "multi" ? true : false;
		}
	}
}
