package controller.documentroot.reportscreen.sidebar.settingsbox.settingstoolcontainer
{
	import flash.events.MouseEvent;
	public class IncDecPenTime extends VC
	{
		public function IncDecPenTime()
		{

		}
		override protected function init(): void
		{
			mxml.addEventListener(MouseEvent.CLICK, _clickHandler);
		}

		private function _clickHandler(evt: MouseEvent): void
		{
			var count: Number = Number(Config.get("config", "tools", "penTime"));
			switch(evt.target.name)
			{
				case "increase":
					if(count < 100)
					{
						count++;
					}
					count++;
					break;
				case "decrease":
					if(count > 0)
					{
						count--;
					}
					break;
			}
			Config.set("config", "tools", "penTime", String(count));
			PostBox.send("changedConfig");
		}
	}
}
