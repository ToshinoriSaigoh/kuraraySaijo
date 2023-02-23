package controller.documentroot.reportscreen.sidebar
{
	import controller.utils.IncDecCounter;
	import model.plugin.draw.Draw;
	public class IncDecTextSize extends IncDecCounter
	{
		public function IncDecTextSize()
		{
			vcName = "IncDecTextSize";
			super();
		}

		override protected function doing(btnName: String = null): void
		{
			switch(btnName)
			{
				case "increase":
					PostBox.send("changeTextSize", {operation: "increase"});
					break;
				case "decrease":
					PostBox.send("changeTextSize", {operation: "decrease"});
					break;
			}
		}
	}
}
