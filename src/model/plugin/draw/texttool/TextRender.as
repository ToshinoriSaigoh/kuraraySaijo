package model.plugin.draw.texttool
{
	import model.plugin.*;
	import model.plugin.draw.*;
	import model.plugin.draw.texttool.TextBox;

	public class TextRender
	{
		public static function ready(drawPanel: Object, bufferVal: Object, completeFunc: Function = null): void
		{
			var targetLayer: Object = drawPanel.drawLayers[bufferVal.layer];
			var textBox: TextBox;

			switch(bufferVal.operation)
			{
				case "remove":
					break;
				case "edit":
					if(textBox != null)
					{
						//_setTextBody(textBox, strokeData);
					}
					break;
				case "new":
					textBox = new TextBox(drawPanel, targetLayer, bufferVal);
					targetLayer.body.addChild(textBox);
					Draw.drawList[drawPanel.report.vcName][bufferVal.id] = textBox;
					//_setTextBody(textBox, strokeData);
					break;
			}
			if(completeFunc != null) completeFunc.call();
		}

		//ストローク処理
		//stroke.fを除いたstrokeのプロパティをキーとして、_textBoxMC[キー]になるよう値を設定する
		public static function rendering(reportID: String, piece: Object): void
		{
			var target: TextBox = Draw.drawList[reportID][piece.id] as TextBox;
			if(target == null) return;
			target.visible = true;
			var i: String;
			for(i in piece)
			{
				switch(i)
				{
					case "x":
					case "y":
					case "alpha":
					case "scaleX":
					case "scaleY":
					case "rotation":
					case "visible":
						target[i] = piece[i];
						break;
					case "width"://サイズで不具合
						target.defaultWidth = piece[i];
						break;
					case "height"://サイズで不具合
						target.defaultHeight = piece[i];
						break;
					case "text":
						target.text = piece[i];
						break;
				}
			}
			target.centeringPoint();
		}
	}
}
