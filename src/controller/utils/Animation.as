package controller.utils
{
	/*
	MC.asでnewする
	*/
	import flash.events.Event;
	public class Animation
	{
		public var movingFlag: Boolean;
		private var _caller: Object;
		public function Animation(parent: VC)
		{
			_caller = parent;
			movingFlag = false;
		}

		public function show(val: Boolean, interval: Number = 20): void
		{
			if(_caller.visible == val) return;
			var mode: Number = val ? +1 : -1;
			var startAlpha: Number = _caller.alpha;
			var endAlpha: Number;
			if(val)
			{
				_caller.alpha = 0;
				_caller.visible = true;
				endAlpha = 1.0;
			}
			else
			{
				endAlpha = 0;
			}
			var a: Number = 1.0 / interval;
			var cnt: int = 0;
			_caller.bodyMC.addEventListener(Event.ENTER_FRAME, animation);
			function animation(e): void
			{
				if(cnt < interval)
				{
					_caller.alpha = _caller.alpha + (a * mode);
				}
				else
				{
					_caller.bodyMC.removeEventListener(Event.ENTER_FRAME, animation);
					_caller.alpha = endAlpha;
					if(!val) _caller.visible = false;
				}
				cnt++;
			}
		}
		public function slide(vector: String, interval: Number = 15, moveLength: Number = 0): void
		{
			moveLength = moveLength == 0 ? _caller.width : moveLength;
			var startX: Number = _caller.x;
			var mode: Number = vector == "left" ? -1 : +1;
			var endX: Number = startX + (moveLength * mode);
			var cnt: int = 0;
			_caller.bodyMC.addEventListener(Event.ENTER_FRAME, animation);
			function animation(e): void
			{
				var n: Number = moveLength / interval;
				if(cnt < interval)
				{
					_caller.x = _caller.x + (n * mode);
				}
				else
				{
					_caller.bodyMC.removeEventListener(Event.ENTER_FRAME, animation);
					_caller.x = endX;
				}
				cnt++;
			}
		}
		public function slideV(vector: String, interval: Number = 15, moveLength: Number = 0): void
		{
			movingFlag = true;
			moveLength = moveLength == 0 ? _caller.height : moveLength;
			var startY: Number = _caller.y;
			var mode: Number = vector == "top" ? -1 : +1;
			var endY: Number = startY + (moveLength * mode);
			var cnt: int = 0;
			_caller.bodyMC.addEventListener(Event.ENTER_FRAME, animation);
			function animation(e): void
			{
				var n: Number = moveLength / interval;
				if(cnt < interval)
				{
					_caller.y = _caller.y + (n * mode);
				}
				else
				{
					_caller.bodyMC.removeEventListener(Event.ENTER_FRAME, animation);
					_caller.y = endY;
					movingFlag = false;
				}
				cnt++;
			}
		}
		public function slideVisible(visibled, vector: String, moveLength: Number = 0): void
		{
			if(visibled) _caller.visible = visibled;

			moveLength = moveLength == 0 ? _caller.width : moveLength;
			var mode: Number = vector == "left" ? -1 : +1;
			var startX: Number = _caller.x;
			var endX: Number = startX + (moveLength * mode);
			var endAlpha: Number = visibled ? 1.0 : 0;

			var interval: Number = 20;
			var cnt: int = 0;
			_caller.bodyMC.addEventListener(Event.ENTER_FRAME, animation);
			function animation(e): void
			{
				var n: Number = moveLength / interval;
				var a: Number = 1.0 / interval;
				if(cnt < interval)
				{
					_caller.x = _caller.x + (n * mode);
					//_caller.alpha = _caller.alpha + (a * mode);
				}
				else
				{
					_caller.bodyMC.removeEventListener(Event.ENTER_FRAME, animation);
					_caller.x = endX;
					//_caller.alpha = endAlpha;
					if(!visibled) _caller.visible = visibled;
				}
				cnt++;
			}
		}
	}
}


