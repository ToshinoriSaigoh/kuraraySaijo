package controller.documentroot.reportscreen.sidebar
{
	import controller.utils.IncDecCounter;
	import model.plugin.draw.Draw;
	public class IncDecAlpha extends IncDecCounter
	{
		public function IncDecAlpha()
		{
			vcName = "IncDecAlpha";
			super();
		}

		override protected function doing(btnName: String = null): void
		{
			switch(btnName)
			{
				case "increase":
					PostBox.send("changeAlpha", {operation: "increase"});
					break;
				case "decrease":
					PostBox.send("changeAlpha", {operation: "decrease"});
					break;
			}
		}
	}
}
