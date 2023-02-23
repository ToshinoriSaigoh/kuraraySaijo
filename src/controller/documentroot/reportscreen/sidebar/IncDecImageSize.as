package controller.documentroot.reportscreen.sidebar
{
	import controller.utils.IncDecCounter;
	import model.plugin.draw.Draw;
	public class IncDecImageSize extends IncDecCounter
	{
		public function IncDecImageSize()
		{
			vcName = "IncDecImageSize";
			super();
		}

		override protected function doing(btnName: String = null): void
		{
			switch(btnName)
			{
				case "increase":
					PostBox.send("changeImageSize", {operation: "increase"});
					break;
				case "decrease":
					PostBox.send("changeImageSize", {operation: "decrease"});
					break;
			}
		}
	}
}
