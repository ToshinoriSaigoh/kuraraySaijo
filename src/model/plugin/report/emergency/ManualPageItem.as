package model.plugin.report.emergency
{
	public class ManualPageItem
	{
		[Bindable]
		public var name: String;
		[Bindable]
		public var title: String;
		[Bindable]
		public var styleName: String;
		[Bindable]
		public var bgColor: Number;

		public function ManualPageItem(emergencyType: String, tree: XML)
		{
			this.name = tree.@name;
			this.title = tree.@title;
			if(Number(tree.@name) < 3)
			{
				switch(emergencyType)
				{
					case "emergency":
						this.styleName = "emergencyPageBtn";
						this.bgColor = 0xee0000;
						break;
					case "trouble":
						this.styleName = "troublePageBtn";
						this.bgColor = 0xeeaa00;
						break;
				}
			}
			else
			{
				this.styleName = "manualPageBtn";
				this.bgColor = 0x444444;
			}
		}
	}
}
