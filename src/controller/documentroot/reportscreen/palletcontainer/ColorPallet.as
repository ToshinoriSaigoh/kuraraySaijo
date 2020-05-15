package controller.documentroot.reportscreen.palletcontainer
{
	import common.ColorUtils;
	import controller.App;
	import controller.documentroot.reportscreen.palletcontainer.colorpallet.ColorData;
	import flash.geom.Rectangle;
	import flash.events.MouseEvent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Shape;
	import mx.collections.ArrayCollection;

	import flash.utils.getQualifiedClassName;

	public class ColorPallet extends VC
	{
		public var colorCollection: ArrayCollection;
		private var _type: String;
		private var _mode: String;
		public function ColorPallet()
		{
			vcName = "colorPallet";
			elementName = "Group";
			super();
		}

		override protected function init(): void
		{
			mxml.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler);

			colorCollection = new ArrayCollection([]);
			mxml.colorList.dataProvider = colorCollection;
			_initColors();
		}

		private function _mouseDownHandler(evt: MouseEvent): void
		{
			switch(evt.target.name)
			{
				case "bg":
					_startDrag();
					break;
			}
		}

		private function _startDrag(): void
		{
			App.mainStage.addEventListener(MouseEvent.MOUSE_UP, _stopDrag);
			mxml.startDrag(false, new Rectangle(0, 0, App.mainStage.width - mxml.width, App.mainStage.height - mxml.height));
			function _stopDrag(e: MouseEvent): void
			{
				App.mainStage.removeEventListener(MouseEvent.MOUSE_UP, _stopDrag);
				mxml.stopDrag();
			}
		}

		private function _initColors(): void
		{
			var i: uint;
			var j: uint;
			var colors: Array;
			var brightness: Array;
			var data: ColorData;
			var rgb: Vector.<int>;
			var hsv: Vector.<int>;

			brightness = [];
			brightness.push(0.00);
			brightness.push(0.25);
			brightness.push(0.50);
			brightness.push(0.75);
			brightness.push(1.00);
			brightness.push(0.75);
			brightness.push(0.50);
			brightness.push(0.25);
			brightness.push(0.00);

			colors = [];
			colors.push(0xff1515);
			colors.push(0xff8815);
			colors.push(0xffff15);
			colors.push(0x15ff15);
			colors.push(0x15ffff);
			colors.push(0x1515ff);
			colors.push(0x8f15ff);
			colors.push(0xff15ff);

			for(i = 0; i < brightness.length; i++)
			{
				for(j = 0; j < colors.length; j++)
				{
					rgb = ColorUtils.HextoRGB(colors[j]);
					hsv = ColorUtils.RGBtoHSV(rgb[0], rgb[1], rgb[2]);
					if(i < 4)
					{
						hsv[1] = Math.floor(511 * brightness[i]);
					}
					else if(i > 4)
					{
						hsv[2] = Math.floor(511 * brightness[i]);
					}
					rgb = ColorUtils.HSVtoRGB(hsv[0], hsv[1], hsv[2]);
					data = new ColorData();
					data.color = ColorUtils.RGBtoHex(rgb[0], rgb[1], rgb[2]);
					colorCollection.addItem(data);
				}
			}
		}

		public function get type(): String
		{
			return _type;
		}

		public function set type(value: String): void
		{
			_type = value;
		}
		public function get mode(): String
		{
			return _mode;
		}

		public function set mode(value: String): void
		{
			_mode = value;
		}
	}
}
