package common
{
	import flash.utils.ByteArray;

	public class ObjectUtils
	{
		//ハッシュの指定プロパティ値を取得
		public static function getPropertyValue(obj: Object, key: String, defaultValue: *): *
		{
			if(hasOwnPropertyCheck(obj, key))
			{
				return obj[key];
			}
			return defaultValue;
		}

		//ハッシュに指定のプロパティがあるかどうか
		public static function hasOwnPropertyCheck(obj: Object, key: String): Boolean
		{
			if(obj != null)
			{
				if(key != null && key.length > 0)
				{
					if(obj.hasOwnProperty(key))
					{
						return true;
					}
				}
			}
			return false;
		}

		//ハッシュに指定のプロパティがあるかどうか
		//またそのハッシュ値が空文字でないかのチェック
		public static function hasOwnPropertyNotEmptyString(obj: Object, key: String): Boolean
		{
			if(hasOwnPropertyCheck(obj, key))
			{
				if(obj[key] != null && obj[key].length > 0)
				{
					return true;
				}
			}
			return false;
		}

		//ハッシュに指定のプロパティがすべてあるか
		public static function hasOwnPropertyInList(obj: Object, plist: Array): Boolean
		{
			var i: uint;
			if(obj != null)
			{
				if(plist != null)
				{
					for(i=0; i<plist.length; ++i)
					{
						if(obj.hasOwnProperty(plist[i]) === false)
						{
							return false;
						}
					}
				}
				return true;
			}
			return false;
		}

		//ハッシュに指定のプロパティの削除
		public static function deleteProperty(obj: Object, key: String): void
		{
			if(hasOwnPropertyCheck(obj, key))
			{
				delete obj[key];
			}
		}

		//オブジェクトクローン
		public static function clone(obj: Object): Object
		{
			var bytes: ByteArray;
			if(obj != null)
			{
				bytes = new ByteArray();
				bytes.writeObject(obj);
				bytes.position = 0;
				return bytes.readObject();
			}
			return null;
		}

		//オブジェクトの要素数を返す
		public static function getPropertyNum(obj: Object): uint
		{
			var res: uint;
			var key: String;
			res = 0;
			if(obj != null)
			{
				for(key in obj)
				{
					res++;
				}
			}
			return res;
		}
	}
}