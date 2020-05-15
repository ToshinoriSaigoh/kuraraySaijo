package controller.documentroot.reportscreen
{
	import model.plugin.draw.Draw;
	import model.plugin.draw.DrawPlayer;
	public class PalletContainer extends VC
	{
		public function PalletContainer()
		{
			vcName = "palletContainer";
			elementName = "Group";
			super();
		}

		public function PB_showPallet(): void
		{
			var param: Object = PostBox.get("PB_showPallet");
			if(param.value == "show")
			{
				mxml[param.pallet].visible = true;
				if(param.pallet == "timelinePallet")
				{
					if(Draw.activeDrawPanel.report.openMode == "play")
					{
						Draw.activeDrawPanel.report.setNowTime(Draw.activeDrawPanel.report.lastTime);
					}
					else
					{
						Draw.activeDrawPanel.report.setLastTime();
						Draw.activeDrawPanel.report.setNowTime();
					}
					Draw.activeDrawPanel.report.setDateTimeText();
				}
			}
			else if(param.value == "hide")
			{
				if(mxml[param.pallet].visible)
				{
					__cueNowTime();
				}
				mxml[param.pallet].visible = false;
			}
			else
			{
				if(mxml[param.pallet].visible)
				{
					__cueNowTime();
					mxml[param.pallet].visible = false;
				}
				else
				{
					mxml[param.pallet].visible = true;
				}
			}

			if(param.pallet == "colorPallet" && param.hasOwnProperty("type"))
			{
				mxml[param.pallet].ctrlr.type = param.type;
				mxml[param.pallet].ctrlr.mode = param.mode != null ? param.mode : "default";
			}

			//タイムライン非表示時に時間を最新状態にする
			function __cueNowTime(): void
			{
				Draw.activeDrawPanel.report.setLastTime();
				Draw.activeDrawPanel.report.nowTime = Draw.activeDrawPanel.report.lastTime;
				PostBox.send("actionMovie", {action: "cue", time: Draw.activeDrawPanel.report.nowTime + DrawPlayer.adjustTime});
			}
		}
	}
}
