package controller.documentroot.reportscreen.palletcontainer.colorpallet
{
	import controller.App;
	import controller.utils.Button;
	import model.plugin.draw.Draw;
	public class ColorButton extends Button
	{
		public function ColorButton()
		{
			vcName = "colorPalletBtn";
			elementName = "Button";
			super();
		}
		override protected function doing(): void
		{
			PostBox.send("showPallet", {pallet: "colorPallet", value: "hide"});
			if(caller.mode == "settings")
			{
				if(caller.type == "line")
				{
					Config.set("config", "tools", "colorLine", mxml.hostComponent.color);
				}
				else if(caller.type == "fill")
				{
					Config.set("config", "tools", "colorFill", mxml.hostComponent.color);
				}
			}
			else
			{
				if(caller.type == "line")
				{
					Draw.lineColor = mxml.hostComponent.color;
				}
				else if(caller.type == "fill")
				{
					Draw.fillColor = mxml.hostComponent.color;
				}
			}
		}
	}
}
