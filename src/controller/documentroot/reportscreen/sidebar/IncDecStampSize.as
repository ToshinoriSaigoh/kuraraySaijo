package controller.documentroot.reportscreen.sidebar
{
	import controller.utils.IncDecCounter;
	import model.plugin.draw.Draw;
	public class IncDecStampSize extends IncDecCounter
	{
		public function IncDecStampSize()
		{
			vcName = "IncDecStampSize";
			super();
		}

		override protected function doing(btnName: String = null): void
		{
			switch(btnName)
			{
				case "increase":
					PostBox.send("changeStampSize", {operation: "increase"});
					break;
				case "decrease":
					PostBox.send("changeStampSize", {operation: "decrease"});
					break;
			}
		}
	}
}
