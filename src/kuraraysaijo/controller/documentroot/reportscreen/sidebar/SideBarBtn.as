package kuraraysaijo.controller.documentroot.reportscreen.sidebar
{
	import controller.utils.Button;

	public class SideBarBtn extends Button
	{
		public function SideBarBtn()
		{
			super();
		}

		override protected function doing(): void
		{
			PostBox.send("flushBuffer", {buffer: "saveBuffer"});
			switch(vcName)
			{
				case "toggleSideBarBtn":
					PostBox.send("toggleSideBar");
					break;
				case "closeAppBtn":
					PostBox.send("appClose");
					break;
			}
			PostBox.send("showPallet", {pallet: "stampPallet", value: "hide"});
			PostBox.send("showPallet", {pallet: "colorPallet", value: "hide"});
		}
	}
}
