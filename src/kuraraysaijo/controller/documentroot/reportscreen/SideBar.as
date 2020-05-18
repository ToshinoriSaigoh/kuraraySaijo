package kuraraysaijo.controller.documentroot.reportscreen
{
	import controller.App;
	import model.plugin.draw.Draw;
	import model.plugin.report.Report;
	import controller.documentroot.reportscreen.SideBar;
	import controller.documentroot.reportscreen.sidebar.Pager;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class SideBar extends controller.documentroot.reportscreen.SideBar
	{
		public function SideBar()
		{
			super();
		}

		override protected function init(): void
		{
			caller.vcSideBar = this;
			//mxml.mainBtnViewStack.selectedIndex = 0;
		}

		public function MSG_toggleSideBar(): void
		{
			if(mxml.visible)
			{
				mxml.visible = false;
				App.mainStage.addEventListener(Event.ENTER_FRAME, _mouseEventHandler);
			}
			else
			{
				mxml.visible = true;
				App.mainStage.removeEventListener(Event.ENTER_FRAME, _mouseEventHandler);
			}
		}
		private function _mouseEventHandler(e: Event): void
		{
			if(App.mainStage.mouseX <= 2)
			{
				mxml.visible = true;
				App.mainStage.removeEventListener(Event.ENTER_FRAME, _mouseEventHandler);
			}
		}

		override public function PB_changeMenu(): void
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
			//mxml.mainBtnViewStack.selectedIndex = indexNum;
			mxml.toolBoxContainer.selectedIndex = null;
		}

		override public function PB_changeTool(): void
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

		override public function PB_changeToolBox(): void
		{
			var param: Object = PostBox.get("PB_changeToolBox");
			switch(param.tool)
			{
				case "calendarDayBox":
					mxml.toolBoxContainer.selectedChild = mxml[param.tool];
					mxml[param.tool].ctrlr.updateFileList(param.val);
					break;
				default:
					mxml.toolBoxContainer.selectedIndex = null;
			}
		}

		override public function addPager(report: Report): void
		{
			var pager: Pager = new Pager(report.id);
			caller.vcSideBar.mxml.pagerViewStack.addElementAt(pager.mxml, report.viewIndex);
			pager.mxml.pageList.dataProvider = report.pageCollection;
		}

		override public function selectPager(reportID: String): void
		{
			if(Pager.pagerList.hasOwnProperty(reportID))
			{
				var index: int = caller.vcSideBar.mxml.pagerViewStack.getElementIndex(Pager.pagerList[reportID].mxml);
				caller.vcSideBar.mxml.pagerViewStack.selectedIndex = index;

				//ページ追加ボタンを非表示
				Pager.pagerList[reportID].mxml.addPageBtn.visible = false;

				//表示レポートがカレンダーの場合はページリストを表示、それ以外は非表示
				if(Report.reportMap.hasOwnProperty(reportID))
				{
					if(Report.reportMap[reportID].reportType == "calendar")
					{
						Pager.pagerList[reportID].mxml.pageList.visible = true;
					}
					else
					{
						Pager.pagerList[reportID].mxml.pageList.visible = false;
					}
				}
			}
		}

		public function PB_changeReport_after(): void
		{
			var param: Object = PostBox.get("PB_changeReport_after");

			//カレンダーが表示されている場合は編集ボタンを使えなくする
			switch(Draw.activeReport.reportType)
			{
				case "calendar":
					mxml.changeModeBtn.enabled = false;
					//PostBox.send("changeTool", {tool: "calendarTool"});
					break;
				default:
					mxml.changeModeBtn.enabled = true;
					break;
			}
		}
	}
}
