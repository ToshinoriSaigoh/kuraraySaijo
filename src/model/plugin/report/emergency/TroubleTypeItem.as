package model.plugin.report.emergency
{
	import mx.collections.ArrayCollection;
	public class TroubleTypeItem
	{
		[Bindable]
		public var name: String;
		[Bindable]
		public var title: String;

		public var myDataElement: XML;
		public var manualPageCollection: ArrayCollection;

		public function TroubleTypeItem(tree: XML)
		{
			myDataElement = tree;
			manualPageCollection = new ArrayCollection([]);

			refreshMyData();
		}

		public function refreshMyData(): void
		{
			this.name = myDataElement.@name;
			this.title = myDataElement.@title;
			refreshManualPageCollection();
			//trace("■refresh", name, title, myDataElement.toXMLString());
		}

		public function refreshManualPageCollection(): void
		{
			manualPageCollection.removeAll();
			var manualPageList: XMLList = myDataElement.elements("page");
			var i: uint;
			for(i = 0; i < manualPageList.length(); i++)
			{
				manualPageCollection.addItem(new ManualPageItem(manualPageList[i]));
			}
		}
	}
}
