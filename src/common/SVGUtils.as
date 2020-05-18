package common
{
	//import flash.events.Event;
	import flash.display.Sprite;
	import frocessing.shape.FShapeSVG;

	public class SVGUtils extends Sprite
	{
		public function SVGUtils()
		{
		}
		public static function loadSVG(SvgClass: Class): Sprite
		{
			var svg: XML = XML(new SvgClass());
			var shapedata: FShapeSVG = new FShapeSVG(svg);//shapeデータの生成
			return shapedata.toSprite();//Spriteに変換

			/*
			var fileStream:　FileStream = new FileStream();
			fileStream.addEventListener(Event.COMPLETE, completed);
			fileStream.openAsync(svgFile, FileMode.READ);
			function completed(e: Event): void
			{
				fileStream.removeEventListener(Event.COMPLETE, completed);
				var svg: XML = fileStream.readUTFBytes(fileStream.bytesAvailable);//XML取得
				var shapedata: FShapeSVG = new FShapeSVG(svg);//shapeデータの生成
				return shapedata.toSprite();//Spriteに変換
			}
			*/
		}
	}
}