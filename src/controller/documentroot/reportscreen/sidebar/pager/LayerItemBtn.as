package controller.documentroot.reportscreen.sidebar.pager
{
	import model.plugin.report.Layer;
	import model.plugin.draw.Draw;
	import flash.events.MouseEvent;

	public class LayerItemBtn extends VC
	{
		public var relationshipLayer: Layer;
		public function LayerItemBtn()
		{
			elementName = "LayerItemBtn";
			super();
		}

		override protected function init(): void
		{
			if(mxml.hostComponent.document.data.id == 0)
			{
				//mxml.hostComponent.enabled = false;//背景手書き無効
				mxml.hostComponent.label = Config.getText("layerItemBtn", "bgLayerLabel");
			}
			relationshipLayer = mxml.hostComponent.document.data;
			relationshipLayer.creationComplete();
		}
	}
}
