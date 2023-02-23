package kuraraysaijo.model.plugin.report.clock
{
	public class AnalogClockCtrl extends VC
	{
		public function AnalogClockCtrl()
		{
			vcName = "analogClock";
			elementName = "Group";
			super();
		}

		public function PB_clock(): void
		{
			var param: Object = PostBox.get("PB_clock");
			if(param.date != null)
			{
				mxml.hHandContainer.rotation = 360 * ((param.date.getHours() % 12) + param.date.getMinutes() / 60.0) / 12.0;
				mxml.mHandContainer.rotation = 360 * (param.date.getMinutes() / 60);
			}
		}
	}
}
