package model.plugin.report
{
/**
 * Drawlayerを継承したレイヤーそのもの.
 *
 * update 2018/01/24
 * Since 2018/01/24
 * @private
 */
	import model.plugin.draw.*;
	import flash.display.Sprite;

	public class Layer extends DrawLayer
	{
		[Bindable]
		public var id: uint;
		[Bindable]
		public var label: String;
		public var myDataElement: XML;
		public var page: Page;
		public function Layer(parent: VC, layerName: String, dataElement: XML = null)
		{
			id = int(layerName);
			label = layerName;
			vcName = layerName;
			elementName = "layer";
			page = parent as Page;
			page.layerCollection.addItemAt(this, id);
			super(parent, layerName);
			visible = true;

			if(dataElement == null)
			{
				myDataElement = <{elementName} id={vcName} name={vcName}/>;
				caller.myDataElement.appendChild(myDataElement);
			}
			else
			{
				myDataElement = dataElement;
			}
		}
		public function creationComplete(): void
		{
			page.creationCompleteLayer();
		}
	}
}
