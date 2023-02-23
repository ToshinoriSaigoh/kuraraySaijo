package common
{
	public class ColorUtils
	{
		private static const SCALE: Number = 255;
		private static const hSCALE: Number = 256;
		private static const GETA: Number = 2;
		private static const hGETA: Number = 2;

		/**
		 * RGBからHSVを得る
		 *
		 * @param r Red 0~255
		 * @param g Green 0~255
		 * @param b Blue 0~255
		 * @return Vector.<int> H: 0~3066, S: 0~511, V: 0~511
		 */
		public static function RGBtoHSV(r: int, g: int, b: int): Vector.<int>
		{
			var rr: Number, gg: Number, bb: Number;
			var hh: Number, ss: Number, vv: Number;
			var cmax: Number, cmin: Number, cdes: Number;

			rr = Number(r);
			gg = Number(g);
			bb = Number(b);

			cmax = (rr > gg) ? rr : gg;
			if (bb > cmax) {
				cmax = bb;
			}

			cmin = (rr < gg) ? rr : gg;
			if (bb < cmin) {
				cmin = bb;
			}

			cdes = cmax - cmin;
			vv = cmax;
			if (cdes != 0) {
				ss = cdes * SCALE / cmax;
				if (cmax == rr) {
					hh = (gg - bb) * SCALE / cdes;
				}else if (cmax == gg) {
					hh = (bb - rr) * SCALE / cdes + 2 * hSCALE;
				}else {
					hh = (rr - gg) * SCALE / cdes + 4 * hSCALE;
				}
			}else if (cmax != 0) {
				ss = cdes * SCALE / cmax;
				hh = 0;
			}else {
				ss = 0;
				hh = 0;
			}
			if (hh < 0) {
				hh += 6 * hSCALE;
			}

			return Vector.<int>([int(hh * hGETA), int(ss * hGETA), int(vv * hGETA)]);
		}

		/**
		 * RGBからHSVを得る
		 *
		 * @param h Hue 0~3066
		 * @param s Saturation 0~511
		 * @param v Value 0~511
		 * @return Vector.<int> R: 0~255, G: 0~255, B: 0~255
		 */
		public static function HSVtoRGB(h: int, s: int, v: int): Vector.<int>
		{
			var rr: Number, gg: Number, bb: Number;
			var hh: Number, ss: Number, vv: Number;
			var r: Number, g: Number, b: Number;

			if (h == 6 * hGETA * hSCALE) {
				h = 0;
			}
			hh = Number(h / hGETA);
			ss = Number(s / GETA);
			vv = Number(v / GETA);

			switch(int(hh / hSCALE)) {
			case 0:
				rr = SCALE;
				gg = hh;
				bb = 0;
				break;
			case 1:
				rr = 2 * hSCALE - hh;
				gg = SCALE;
				bb = 0;
				break;
			case 2:
				rr = 0;
				gg = SCALE;
				bb = hh - 2 * hSCALE;
				break;
			case 3:
				rr = 0;
				gg = 4 * hSCALE - hh;
				bb = SCALE;
				break;
			case 4:
				rr = hh - 4 * hSCALE;
				gg = 0;
				bb = SCALE;
				break;
			case 5:
				rr = SCALE;
				gg = 0;
				bb = 6 * hSCALE - hh;
				break;
			}

			rr = (rr + (SCALE - rr) * (SCALE - ss) / SCALE) * vv / SCALE;
			gg = (gg + (SCALE - gg) * (SCALE - ss) / SCALE) * vv / SCALE;
			bb = (bb + (SCALE - bb) * (SCALE - ss) / SCALE) * vv / SCALE;

			r = int(rr);
			g = int(gg);
			b = int(bb);
			if (r > 255) { r = 255 }
			if (g > 255) { g = 255 }
			if (b > 255) { b = 255 }
			return Vector.<int>([r, g, b]);
		}

		private static function sgn(x: Number): Number
		{
			return (x < 0) ? -1 : 1;
		}

		private static function CINT(x: Number): int
		{
			return int(x + sgn(x) * 0.5);
		}

		private static var FL: Number;

		//ここから追加した分

		/**
		 * RGBから16進数を得る
		 *
		 * @param r Red 0~255
		 * @param g Green 0~255
		 * @param b Blue 0~255
		 * @return int 0~0xffffff
		 */
		public static function RGBtoHex(r: int, g: int, b: int): int
		{
			return r << 16 | g << 8 | b;
		}

		/**
		 * ARGBから16進数を得る
		 *
		 * @param a Alpha 0~255
		 * @param r Red 0~255
		 * @param g Green 0~255
		 * @param b Blue 0~255
		 * @return int 0~0xffffffff
		 */
		public static function ARGBtoHex(a: int, r: int, g: int, b: int): int
		{
			return a << 24 | r << 16 | g << 8 | b;
		}

		/**
		 * 16進数からRGBを得る
		 *
		 * @param hex 16進数
		 * @return Vector.<int> R: 0~255, G: 0~255, B: 0~255
		 */
		public static function HextoRGB(hex: int): Vector.<int>
		{
			var r: int = hex >> 16;
			var g: int = hex >> 8 & 0xff;
			var b: int = hex & 0xff;
			return Vector.<int>([r, g, b]);
		}

		/**
		 * 16進数からRGBを得る
		 *
		 * @param hex 16進数
		 * @return Vector.<int> A: 0~255, R: 0~255, G: 0~255, B: 0~255
		 */
		public static function HextoARGB(hex: int): Vector.<int>
		{
			var a: int = hex >> 24;
			var r: int = hex >> 16 & 0xff;
			var g: int = hex >> 8 & 0xff;
			var b: int = hex & 0xff;
			return Vector.<int>([a, r, g, b]);
		}
	}
}