package model.plugin.draw.stamptool
{
/**
 * スタンプ描画用クラス.
 *
 * update 2018/03/14
 * 時間巻き戻し時にボックスサイズの不具合があったものを修正
 * rendering() case "width, height"をコメントアウト
 *
 * @private
 */
	import model.plugin.draw.*;
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	import flash.filesystem.File;

	public class StampRender
	{
		public static function ready(drawPanel: Object, bufferVal: Object, completeFunc: Function = null): void
		{
			var stampBox: StampBox;
			if(bufferVal.operation == "new")
			{
				var targetLayer: Object = drawPanel.drawLayers[bufferVal.layer];
				var imageFile: File = Lib.getAppFileObject("stamp/" + bufferVal.option.dirName + "/" + bufferVal.option.fileName);
				stampBox = new StampBox(drawPanel, targetLayer, bufferVal, imageFile, completeReady);
				stampBox.visible = false;
				Draw.drawList[drawPanel.report.vcName][bufferVal.id] = stampBox;
				targetLayer.body.addChild(stampBox);
				function completeReady(): void
				{
					if(completeFunc != null) completeFunc.call();
				}
			}
		}

		public static function rendering(reportID: String, piece: Object): void
		{
			var target: StampBox = Draw.drawList[reportID][piece.id] as StampBox;
			if(!target) return;
			target.visible = true;
			var i: String;
			for(i in piece)
			{
				switch(i)
				{
					case "x":
					case "y":
					case "alpha":
					//case "width"://サイズで不具合
					//case "height"://サイズで不具合
					case "scaleX":
					case "scaleY":
					case "rotation":
					case "visible":
						target[i] = piece[i];
						break;
				}
			}
		}
	}
}
