
package controller.documentroot.reportscreen.sidebar.pager
{
	import model.plugin.report.*;
	import model.plugin.draw.Draw;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Sprite;
	import spark.collections.Sort;
	import spark.collections.SortField;
	import mx.binding.utils.BindingUtils;
	import mx.collections.ArrayCollection;
	public class CtrlBox extends VC
	{
		public var relationshipPage: Page;
		private var _sort: Sort;
		private var _sortField: SortField;
		private var _layerCollection: ArrayCollection;
		public function CtrlBox()
		{
			elementName = "Group";
			super();

			_layerCollection = new ArrayCollection([]);
			_sort = new Sort();
			_sortField = new SortField();
			_sortField.name = "id";
			_sortField.descending = true;
			_sortField.numeric = true;
			_sort.fields = [_sortField];
		}

		override protected function init(): void
		{
			setRelationshipPage();
			mxml.layerListData.addEventListener(MouseEvent.CLICK, layerItemClickHandler);
		}

		public function PB_changeLayer_after(): void
		{
			var param: Object = PostBox.get("PB_changeLayer_after");
			if(param.report != relationshipPage.report.vcName) return;
			if(param.page != relationshipPage.vcName) return;
			_changeSelectLayer(param.layer);
		}

		public function addLayerBtnClickHandler(): void
		{
			PostBox.send("addLayer", {report: Draw.activeDrawPanel.caller.vcName, page: Draw.activeDrawPanel.vcName});
		}

		//mxml.click()
		public function layerItemClickHandler(evt: MouseEvent): void
		{
			evt.stopImmediatePropagation();
			var layerName: String = String(evt.target.document.data.vcName);
			switch(evt.target.id)
			{
				case "layerItem":
					evt.target.document.hideLayerBtn.visible = true;
					PostBox.send("changeLayer", {report: Draw.activeDrawPanel.report.vcName, page: Draw.activeDrawPanel.vcName, layer: layerName});
					break;
				case "hideLayerBtn":
					evt.target.visible = false;
					relationshipPage.drawLayers[layerName].visible = false;
					break;
			}
		}

		//指定レイヤーを選択状態にする
		private function _changeSelectLayer(layerName: String): void
		{
			var layerList: ArrayCollection = mxml.layerListData.dataProvider;
			var i: uint;
			for(i = 0; i < layerList.length; i++)
			{
				if(mxml.layerListData.getElementAt(i) != null)
				{
					mxml.layerListData.getElementAt(i).layerItem.selected = mxml.layerListData.getElementAt(i).layerItem.skin.ctrlr.relationshipLayer.vcName == layerName ? true : false;
				}
			}
		}
		//対応するPageクラスと関連付ける
		public function setRelationshipPage(): void
		{
			relationshipPage = mxml.parent.document.hostComponent.document.data;
			mxml.layerListData.dataProvider = relationshipPage.layerCollection;
			_sortLayer();
		}

		private function _sortLayer(): void
		{
			mxml.layerListData.dataProvider.sort = _sort;
			mxml.layerListData.dataProvider.refresh();
		}

	}
}
