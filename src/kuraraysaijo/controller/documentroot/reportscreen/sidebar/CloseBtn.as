package kuraraysaijo.controller.documentroot.reportscreen.sidebar
{
	import controller.utils.Button;

	public class CloseBtn extends Button
	{
		public function CloseBtn()
		{
			super();
		}

		override protected function doing(): void
		{
			PostBox.send("toggleSideBar");
			PostBox.send("showPallet", {pallet: "stampPallet", value: "hide"});
			PostBox.send("showPallet", {pallet: "colorPallet", value: "hide"});
		}
	}
}
