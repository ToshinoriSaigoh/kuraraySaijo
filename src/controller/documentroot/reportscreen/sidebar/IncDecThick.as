package controller.documentroot.reportscreen.sidebar
{
	import controller.utils.IncDecCounter;
	import model.plugin.draw.Draw;
	public class IncDecThick extends IncDecCounter
	{
		public function IncDecThick()
		{
			vcName = "IncDecThick";
			super();
		}

		override protected function doing(btnName: String = null): void
		{
			switch(btnName)
			{
				case "increase":
					PostBox.send("changeThick", {operation: "increase"});
					break;
				case "decrease":
					PostBox.send("changeThick", {operation: "decrease"});
					break;
			}
		}
	}
}
