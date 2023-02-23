package model.plugin.monitor.controller
{
	import model.plugin.monitor.view.monitorcontainer.Monitor;
	import mx.collections.ArrayCollection;
	public class MonitorContainer extends VC
	{
		[Embed(source="../monitor.xml", mimeType="application/octet-stream")]
		public static const CONFIG_XML_CLASS: Class;

		public static var monitorCollection: ArrayCollection;
		public static var monitorContainerBody: Object;
		private static var _myTree: XML;
		public function MonitorContainer()
		{
			vcName = "monitorContainer";
			elementName = "Group";
			super();

			monitorCollection = new ArrayCollection([]);
			//monitor用xml読込＋設定
			Config.configTree.appendChild(new XML(new MonitorContainer.CONFIG_XML_CLASS()));
			Config.updateFromXMLFile("monitor.xml");
			//Config.saveConfigXML(Config.configTree.monitor[0], "monitor.xml");
		}

		override protected function init(): void
		{

			monitorContainerBody = mxml;
			//mxml.body.addElement(new Monitor());
		}

		public function PB_showMonitor(): void
		{
			var param: Object = PostBox.get("PB_showMonitor");
			if(param.value == "show")
			{
				mxml.visible = true;
			}
			else if(param.value == "hide")
			{
				mxml.visible = false;
			}
			else
			{
				if(mxml.visible)
				{
					mxml.visible = false;
				}
				else
				{
					mxml.visible = true;
				}
			}
		}
	}
}
