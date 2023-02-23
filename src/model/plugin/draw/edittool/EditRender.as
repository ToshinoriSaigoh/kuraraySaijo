package model.plugin.draw.edittool
{
/**
* 変形用ツールのレンダラー.
* 画像・スタンプ・図形で使用する。
* rendering()は図形だけが使う。
*
* update 2018/03/14
* 時間巻き戻し時にボックスサイズの不具合があったものを修正
* rendering() case "width, height"をコメントアウト
* update 2018/03/08 最前面に移動する機能を追加
* @private
*/
	import model.plugin.draw.*;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.display.BlendMode;
	import flash.display.CapsStyle;

	public class EditRender
	{
		private static var _target: Sprite
		public static function ready(drawPanel: Object, bufferVal: Object, completeFunc: Function = null): void
		{
			if(bufferVal.operation == "new")
			{
			}
			if(completeFunc != null) completeFunc.call();
		}

		public static function rendering(reportID: String, piece: Object): void
		{
			var target: EditBox = Draw.drawList[reportID][piece.id] as EditBox;
			if(!target) return;
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
					//case "baseWidth":
					//case "baseHeight":
					case "scaleX":
					case "scaleY":
					case "rotation":
					case "visible":
						target[i] = piece[i];
						break;
					case "front":
						//trace("front", target.name, target.targetLayer.vcName);
						target.targetLayer.body.setChildIndex(target, target.targetLayer.body.numChildren-1);
						break;
				}
			}
			if(target.border.attached) target.refreshBorder();
		}
	}
}
