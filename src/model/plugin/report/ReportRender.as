package model.plugin.report
{
/**
 *
 *
 * update 2018/01/24
 * Since 2018/01/24
 * @private
 */
	import model.plugin.*;
	import model.plugin.draw.Draw;
	import flash.display.Sprite;
	import flash.events.Event;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	public class ReportRender
	{
		public static function ready(drawPanel: Object, bufferVal: Object, completeFunc: Function = null): void
		{
		}

		public static function rendering(reportID: String, piece: Object): void
		{
			if(Draw.activeDrawPanel.report.playState == "rec") return;
			PostBox.send("changePage", {report: Draw.activeDrawPanel.report.vcName, page: piece.page});
		}
	}
}
