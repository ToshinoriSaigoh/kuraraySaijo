package common.keyboard
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;

	public class KeyboardChecker
	{
		//キーボードの入力状態を記録するバッファ
		private var inputKeyBuffer: Object;

		//ステージ（参照）
		private var stage: Stage;

		//登録リスト
		private var list: Array;

		//コンストラクタ
		public function KeyboardChecker()
		{
			super();
			reset();
		}

		//初期化
		public function init(stg: Stage): void
		{
			reset();
			stage = stg;
			if( stage != null )
			{
				stage.addEventListener(KeyboardEvent.KEY_DOWN , keyDownHandler);
				stage.addEventListener(KeyboardEvent.KEY_UP , keyUpHandler);
				stage.addEventListener(Event.DEACTIVATE , deactiveHandler);
			}
		}

		//リセット
		public function reset(): void
		{
			if( stage != null )
			{
				stage.removeEventListener(KeyboardEvent.KEY_DOWN , keyDownHandler);
				stage.removeEventListener(KeyboardEvent.KEY_UP , keyUpHandler);
				stage.removeEventListener(Event.DEACTIVATE , deactiveHandler);
			}
			stage = null;
			inputKeyBuffer = null;
			list = new Array();
		}

		//チェックキーと関数を登録
		public function addFunction(keys: Array, fnc: Function) : void
		{
			if( keys != null && fnc != null )
			{
				if( keys.length > 0 )
				{
					list.push({keys: keys, fnc: fnc});
				}
			}
		}

		//キーボードダウン
		private function keyDownHandler(e: KeyboardEvent) : void
		{
			checkKeyAll(e.keyCode, true);
		}

		//キーボードアップ
		private function keyUpHandler(e: KeyboardEvent) : void
		{
			checkKeyAll(e.keyCode, false);
		}

		//キーチェック
		private function checkKeyAll(keyCode: uint, flg: Boolean) : void
		{
			var before: Boolean;
			var i: uint;
			var checkItem: Object;

			if( inputKeyBuffer == null )
			{
				inputKeyBuffer = new Object();
			}
			inputKeyBuffer["key" + keyCode] = flg;

			for( i=0; i<list.length; ++i )
			{
				checkItem = list[i];
				if( checkItem != null )
				{
					if( checkKey(checkItem) )
					{
						if( checkItem.fnc != null )
						{
							checkItem.fnc.call();
						}
					}
				}
			}
		}

		//キーチェック
		private function checkKey(checkItem: Object): Boolean
		{
			var i: uint;
			var keys: Array;
			var key: String;
			keys = checkItem.keys;
			if( keys != null )
			{
				for( i=0; i<keys.length; ++i )
				{
					key = "key"+keys[i];
					if( inputKeyBuffer.hasOwnProperty(key) == false )
					{
						return false;
					}
					else
					{
						if( inputKeyBuffer[key] == false )
						{
							return false;
						}
					}
				}
				return true;
			}
			return false;
		}


		//非アクティブ化の時にキーバッファを削除
		private function deactiveHandler(e: Event): void
		{
			inputKeyBuffer = null;
		}
	}
}
