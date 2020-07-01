package kuraraysaijo.model.plugin.config
{
	public class WarningInfo
	{
		[Bindable]
		public var id: String;
		[Bindable]
		public var label: String;
		[Bindable]
		public var fontSize: String;
		[Bindable]
		public var color: String;
		[Bindable]
		public var backgroundColor: uint;
		public var conditions: Array;
		public function WarningInfo()
		{
			reset();
		}

		public function reset(): void
		{
			id = null;
			label = "";
			fontSize = "";
			color = "";
			backgroundColor = 0xFFFFFF;
			conditions = [];
		}

		public function loadFromXML(xml: XML): void
		{
			var i: int;
			var itemXML: XML;
			var item: Object;
			reset();
			if(xml != null)
			{
				id = xml.@id;
				if(xml.label.length() > 0) label = xml.label[0].toString();
				if(xml.fontSize.length() > 0) fontSize = xml.fontSize[0].toString();
				if(xml.color.length() > 0) color = xml.color[0].toString();
				if(xml.backgroundColor.length() > 0) backgroundColor = uint(xml.backgroundColor[0].toString());
				if(xml.conditions.item.length() > 0)
				{
					for(i = 0; i < xml.conditions.item.length(); i++)
					{
						itemXML = xml.conditions.item[i];
						item = {};
						item.type = itemXML.@type.toString();
						item.value = Number(itemXML.toString());
						conditions.push(item);
					}
				}
			}
		}


		//超える : moreThan
		//未満   : lessThan
		//以上   : orMore
		//以下   : orLess
		public function isInRange(value: Number): Boolean
		{
			var res: Boolean = true;
			var i: int;
			if(conditions.length == 0) res = false;
			for(i = 0; i < conditions.length; i++)
			{
				switch(conditions[i].type)
				{
					case "moreThan":
						res &&= conditions[i].value < value;
						break;
					case "lessThan":
						res &&= conditions[i].value > value;
						break;
					case "orMore":
						res &&= conditions[i].value <= value;
						break;
					case "orLess":
						res &&= conditions[i].value >= value;
						break;
					default:
						break;
				}
			}
			return res;
		}
	}
}