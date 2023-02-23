package controller.documentroot.reportscreen.sidebar
{
	import model.plugin.draw.*;
	import view.documentroot.reportscreen.sidebar.Pager;
	import controller.documentroot.reportscreen.sidebar.pager.*;
	import flash.events.MouseEvent;
	import spark.events.IndexChangeEvent;
	import mx.binding.utils.BindingUtils;
	import mx.events.CollectionEvent;
	import spark.components.*;
	//import controller.events.*;
	import mx.events.FlexEvent;
	public class Pager extends VC
	{
		public static var pagerList: Object = {};
		private var _state: String;
		public function Pager(reportID: String)
		{
			//trace("■new Pager");
			vcName = reportID;
			pagerList[reportID] = this;
			elementName = "group";
			super();
			_state = "default";
			mxml = new PagerBody(this);

			mxml.addEventListener(FlexEvent.CREATION_COMPLETE, _creationCompleteHandler);
		}
		private function _creationCompleteHandler(e: FlexEvent): void
		{
			mxml.pageListBox.parent.mouseEnabled = false;//NavigatorContent内、contentGroup
			mxml.pageListBox.parent.parent.mouseEnabled = false;//NavigatorContent内、contentGroup
			mxml.removeEventListener(FlexEvent.CREATION_COMPLETE, _creationCompleteHandler);
			//mxml.thumbBtn.addEventListener(MouseEvent.CLICK, thumbBtnClickHandler);
			mxml.addPageBtn.addEventListener(MouseEvent.CLICK, addPageBtnClickHandler);
			mxml.pageList.addEventListener(MouseEvent.CLICK, pageItemClickHandler);
		}

		public function PB_changeStateCtrlBox(): void
		{
			var param: Object = PostBox.get("PB_changeStateCtrlBox");
			_state = param.state;
		}

		public function pageItemClickHandler(evt: MouseEvent): void
		{
			evt.stopImmediatePropagation();
			//trace("■pageItemClickHandler", evt.target.name);
			var reportID: String = Draw.activeDrawPanel.caller.vcName;
			var pageID: uint;
			switch(evt.target.name)
			{
				case "pageItemBtn"://ページ番号クリック時
					pageID = evt.target.document.hostComponent.document.data.id;
					//アクティブページでないときはページ切り替え
					if(Draw.activeDrawPanel.id != String(pageID))
					{
						//PostBox.send("changeStateCtrlBox", {state: "default"});
						//evt.target.skin.ctrlr.changeStateCtrlBox("default");//直接切り替え
						PostBox.send("changePage", {report: reportID, page: pageID});
					}
					else//アクティブページのときはステート切り替え
					{
						//PostBox.send("changeStateCtrlBox", {state: "layer", page: pageID});
						//evt.target.skin.ctrlr.changeStateCtrlBox("layer", pageID);//直接切り替え
					}
					break;
			}
		}

		private function _resetPageList(): void
		{

		}
		private function _changeStateAllDefault(): void
		{
			var i: uint;
			for(i = 0; i < mxml.pageList.numElements; i++)
			{
				mxml.pageList.getElementAt(i).skin.ctrlr.changeStateCtrlBox("default");
			}
		}

		public function addPageBtnClickHandler(evt: MouseEvent): void
		{
			evt.stopImmediatePropagation();
			PostBox.send("addPage", {report: Draw.activeDrawPanel.caller.vcName});
			PostBox.send("sendGenericAction", {action: "addPage", report: Draw.activeDrawPanel.caller.vcName});
		}

		/*
		public function thumbBtnClickHandler(evt: MouseEvent): void
		{
			evt.stopImmediatePropagation();
			_state = _state != "thumb" ? "thumb" : "default";
			PostBox.send("changeStateCtrlBox", {state: _state});
		}
		*/
	}
}
