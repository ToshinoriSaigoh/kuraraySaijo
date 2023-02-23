package controller.documentroot.reportscreen
{
	import model.plugin.draw.Draw;
	import model.plugin.report.Report;
	import controller.documentroot.reportscreen.sidebar.Pager;
	import flash.events.MouseEvent;

	public class SideBar extends VC
	{
		[Bindable]
		public var styleName: String;
		public function SideBar()
		{
			vcName = "sideBar";
			elementName = "group";
			super();
		}

		override protected function init(): void
		{
			caller.vcSideBar = this;
			mxml.mainBtnViewStack.selectedIndex = 0;
		}

		public function PB_changeMenu(): void
		{
			var param: Object = PostBox.get("PB_changeMenu");
			var indexNum: uint;
			if(param.index != null)
			{
				indexNum = param.index;
			}
			else
			{
				indexNum = mxml.mainBtnViewStack.selectedIndex == 0 ? 1 : 0;
			}
			mxml.mainBtnViewStack.selectedIndex = indexNum;
			mxml.toolBoxContainer.selectedIndex = null;
		}

		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			switch(param.tool)
			{
				case "penTool":
				case "textTool":
				case "editTool":
				case "stampTool":
				case "shapeTool":
				case "imageTool":
				case "fileTool":
				case "linkTool":
				case "settings":
				case "scrollTool":
					PostBox.send("showPallet", {pallet: "timelinePallet", value: "hide"});
					mxml.toolBoxContainer.selectedChild = mxml[param.tool];
					break;
				case "hideTool":
					PostBox.send("showPallet", {pallet: "timelinePallet", value: "hide"});
					mxml.toolBoxContainer.selectedChild = mxml["penTool"];
					break;
				case "timelineTool":
					mxml.toolBoxContainer.selectedIndex = null;
					PostBox.send("showPallet", {pallet: "timelinePallet", value: "show"});
					break;
				default:
					PostBox.send("showPallet", {pallet: "timelinePallet", value: "hide"});
					mxml.toolBoxContainer.selectedIndex = null;
			}
		}

		public function PB_changeToolBox(): void
		{
			var param: Object = PostBox.get("PB_changeToolBox");
			switch(param.tool)
			{
				case "calendarDayBox":
					mxml.toolBoxContainer.selectedChild = mxml[param.tool];
					mxml[param.tool].ctrlr.updateFileList(param.val);
					//_searchDirectory(param.val);
					break;
				default:
					mxml.toolBoxContainer.selectedIndex = null;
			}
		}

		private function _searchDirectory(val: Object): void
		{
			var year: String = val.year;
			var month: String = val.month;
			var day: String = val.day;
		}

		public function addPager(report: Report): void
		{
			var pager: Pager = new Pager(report.id);
			caller.vcSideBar.mxml.pagerViewStack.addElementAt(pager.mxml, report.viewIndex);
			pager.mxml.pageList.dataProvider = report.pageCollection;
		}

		public function selectPager(reportID: String): void
		{
			if(Pager.pagerList.hasOwnProperty(reportID))
			{
				var index: int = caller.vcSideBar.mxml.pagerViewStack.getElementIndex(Pager.pagerList[reportID].mxml);
				caller.vcSideBar.mxml.pagerViewStack.selectedIndex = index;
			}
		}
	}
}
