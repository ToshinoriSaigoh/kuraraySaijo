package common
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.getTimer;

	public class EnterFrameProccess
	{
		private static var _movieClip: MovieClip;//ENTER_FRAME用MovieClip
		private static var _functions: Object = {};//呼び出し関数

		//後始末処理
		public static function dispose(): void
		{
			if(_movieClip != null)
			{
				_movieClip.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			}
			_movieClip = null;
			_functions = null;
		}

		//ENTER FRAME 開始
		public static function start(key: String, fnc: Function): void
		{
			_functions[key] = fnc;
			if(_movieClip == null)
			{
				_movieClip = new MovieClip();
			}
			_movieClip.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			_movieClip.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		//ENTER FRAME 停止
		public static function stop(key: String): void
		{
			if(key != null && _functions.hasOwnProperty(key))
			{
				delete _functions[key];
			}

			var tmpKey: String;
			var count: uint;
			if(_functions != null)
			{
				for(tmpKey in _functions)
				{
					count++;
					break;
				}
			}
			if(_movieClip != null && count == 0)
			{
				_movieClip.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			}
		}

		//ENTER FRAME ハンドラ
		private static function enterFrameHandler(e: Event): void
		{
			var key: String;
			for(key in _functions)
			{
				if(_functions[key] != null) _functions[key].call(null, e);
			}
		}
	}
}
