package controller.documentroot.reportscreen.sidebar.pager
{
	import controller.documentroot.reportscreen.sidebar.pager.*;
	import model.plugin.report.Page;
	import flash.events.*;
	public class PageBtn extends VC
	{
		public var ctrlBox: CtrlBox;
		public var relationshipPage: Page;
		public function PageBtn()
		{
			elementName = "ToggleButton";
			super();
		}

		override protected function init(): void
		{
			setRelationshipPage();
			vcName = relationshipPage.vcName;//mxml.hostComponent.label;
			//trace("■PageBtn init", vcName, relationshipPage.vcName);
			if(relationshipPage.id == 0)
			{
				mxml.hostComponent.selected = true;//creationCompleteまでvcNameがないためvcname設定後にアクティブにする
			}
			relationshipPage.creationComplete();
		}

		public function PB_changePage_after(): void
		{
			var param: Object = PostBox.get("PB_changePage_after");
			//trace("■PageBtn PB_changePage_after", param.page, vcName);
			if(param.page == vcName)
			{
				mxml.hostComponent.selected = true;
			}
			else
			{
				mxml.hostComponent.selected = false;
			}
			_changeStateCtrlBox("default", param.page);
		}
		public function PB_changeStateCtrlBox(): void
		{
			if(mxml.hostComponent.document.data == null) return;
			var param: Object = PostBox.get("PB_changeStateCtrlBox");
			_changeStateCtrlBox(param.state, param.page);
		}

		public function removeMyself(e: Event): void
		{
			//trace("###removeMyself", e.target, mxml);
			//mxml.removeEventListener(Event.REMOVED, removeMyself);
			//removeStep();
		}

		//ctrlBoxステート切り替え
		private function _changeStateCtrlBox(state: String = "default", pageID: uint = -1): void
		{
			var changeState: String;
			switch(state)
			{
				case "layer":
					if(relationshipPage.id == pageID && mxml.ctrlBox.currentState != "layer")
					{
						changeState = "layer";
					}
					else
					{
						changeState = "default";
					}
					break;
				case "thumb":
					changeState = "thumb";
					break;
				default:
					changeState = "default";
			}
			mxml.ctrlBox.currentState = changeState;
		}
		//対応するPageクラスと関連付ける
		public function setRelationshipPage(): void
		{
			relationshipPage = mxml.hostComponent.document.data;
		}
	}
}
