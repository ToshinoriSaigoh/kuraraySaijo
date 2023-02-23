package controller
{
	public class LogPanel extends VC
	{
		public function LogPanel()
		{
			vcName = "logPanel";
			elementName = "Group";
			super();
		}

		override protected function init(): void
		{
			Log.logPanel = mxml.textarea;
		}
	}
}
