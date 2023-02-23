package model.plugin.draw.hidetool
{
	import model.plugin.*;
	import model.plugin.draw.*;
	import flash.display.MovieClip;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	public class HideRender
	{
		private static var _target: MovieClip
		private static var _now: uint;
		private static var _capsStyle: String;
		private static var _tweenArr: Array = [];
		public static function ready(drawPanel: Object, bufferVal: Object, completeFunc: Function = null): void
		{
			if(completeFunc != null) completeFunc.call();
		}

		public static function rendering(reportID: String, piece: Object): void
		{
			if(reportID == null || piece == null)return;
			if(Draw.drawList.hasOwnProperty(reportID) == false) return;
			if(Draw.drawList[reportID].hasOwnProperty(piece.id) == false) return;
			var target: * = Draw.drawList[reportID][piece.id];
			if(target == null) return;

			if(piece.hasOwnProperty("visible"))
			{
				target.visible = piece.visible;
			}
		}
	}
}
