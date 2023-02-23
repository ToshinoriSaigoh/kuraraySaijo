package controller.documentroot.reportscreen.sidebar
{
	import controller.utils.IncDecCounter;
	import model.plugin.draw.Draw;
	public class IncDecScale extends IncDecCounter
	{
		public function IncDecScale()
		{
			vcName = "IncDecScale";
			super();
		}

		override protected function doing(btnName: String = null): void
		{
			switch(btnName)
			{
				case "increase":
					PostBox.send("changeScale", {operation: "increase"});
					break;
				case "decrease":
					PostBox.send("changeScale", {operation: "decrease"});
					break;
			}
		}
	}
}
