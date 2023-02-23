package model.plugin.report.emergency
{
	import common.*;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import mx.collections.ArrayCollection;
	public class Emergency
	{
		[Bindable]
		public static var emergencyTypeCollection: ArrayCollection = new ArrayCollection([]);
		[Bindable]
		public static var activeEmergencyType: String = "0";
		public static var emergencyXML: XML = new XML();

		public function Emergency()
		{
			_loadEmergencyXML();
		}

		public static function get activeEmergencyElement(): XML
		{
			return emergencyXML.elements("report").(attribute("name") == activeEmergencyType)[0];
		}

		public static function addEmergency(): void
		{
			var num: uint = emergencyXML.elements("report").length();
			var xml: XML =
  <report type="emergency">
    <page id="0" name="0">
      <layer id="0" name="0"/>
      <layer id="1" name="1"/>
    </page>
    <page id="1" name="1">
      <layer id="0" name="0"/>
      <layer id="1" name="1"/>
    </page>
    <page id="2" name="2">
      <layer id="0" name="0"/>
      <layer id="1" name="1"/>
    </page>
    <page id="3" name="3">
      <layer id="0" name="0"/>
      <layer id="1" name="1"/>
    </page>
    <page id="4" name="4">
      <layer id="0" name="0"/>
      <layer id="1" name="1"/>
    </page>
    <page id="5" name="5">
      <layer id="0" name="0"/>
      <layer id="1" name="1"/>
    </page>
    <page id="6" name="6">
      <layer id="0" name="0"/>
      <layer id="1" name="1"/>
    </page>
    <page id="7" name="7">
      <layer id="0" name="0"/>
      <layer id="1" name="1"/>
    </page>
    <page id="8" name="8">
      <layer id="0" name="0"/>
      <layer id="1" name="1"/>
    </page>
    <page id="9" name="9">
      <layer id="0" name="0"/>
      <layer id="1" name="1"/>
    </page>
  </report>;
			xml.@title = Config.getText("emergency", "defaultTitle");
			xml.@id = String(num);
			xml.@name = String(num);
			xml.@dir = String(num);
			var nodes: XMLList = xml.page;
			var i: uint;
			for(i = 0; i < nodes.length(); i++)
			{
				nodes[i].@title = i == 0 ? Config.getText("emergency", "defaultPage1") : Config.getText("emergency", "defaultPage2") + String(i);
			}
			emergencyXML.appendChild(xml)
			refresh();
		}

		public static function saveEmergencyXML(compFunc: Function = null): void
		{
			var file: File = Lib.getAppFileObject("emergency/emergency.xml");
			StorageUtils.saveTextFile(file, emergencyXML.toXMLString(), complete, FileMode.WRITE);
			function complete(res: String): void
			{
				if(compFunc != null) compFunc.call();
			}
		}

		private static function _loadEmergencyXML(): void
		{
			var emergencyDir: File = Lib.getAppFileObject("emergency");
			StorageUtils.loadTextFile(emergencyDir.resolvePath("emergency.xml"), completeXMLLoad);
			function completeXMLLoad(res: String, loadTxt: String): void
			{
				emergencyXML = new XML(loadTxt);
				refresh();
			}
		}

		public static function refresh(): void
		{
				emergencyTypeCollection.removeAll();
				var emergencyList: XMLList = emergencyXML.elements("report");
				var i: int;
				for(i = 0; i < emergencyList.length(); i++)
				{
					emergencyList[i].@id = i;
					emergencyList[i].@name = i;
					emergencyTypeCollection.addItem(new EmergencyTypeItem(emergencyList[i]));
				}
		}
	}
}
