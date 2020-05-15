package model.plugin.report.emergency
{
	import mx.collections.ArrayCollection;
	public class EmergencyTypeItem
	{
		[Bindable]
		public var name: String;//viewIndex変動する
		[Bindable]
		public var title: String;
		[Bindable]
		public var type: String;
		[Bindable]
		public var dir: String;

		public var myDataElement: XML;
		[Bindable]
		public var manualPageCollection: ArrayCollection;

		public function EmergencyTypeItem(tree: XML)
		{
			myDataElement = tree;
			manualPageCollection = new ArrayCollection([]);

			refreshMyData();
		}

		public function refreshMyData(): void
		{
			this.name = myDataElement.@name;
			this.title = myDataElement.@title;
			this.type = myDataElement.@type;
			this.dir = myDataElement.@dir;
			refreshManualPageCollection();
			//trace("■refresh", name, title, dir, myDataElement.toXMLString());
		}

		public function refreshManualPageCollection(): void
		{
			manualPageCollection.removeAll();
			var manualPageList: XMLList = myDataElement.elements("page");
			var i: uint;
			for(i = 0; i < manualPageList.length(); i++)
			{
				manualPageCollection.addItem(new ManualPageItem(myDataElement.attribute("type"), manualPageList[i]));
			}
		}
	}
}
