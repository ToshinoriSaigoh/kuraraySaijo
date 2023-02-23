package common
{
	public class XMLUtils
	{
		private static var _myself: Global;
		private static var _internally: Boolean = false;
		public function XMLUtils()
		{
		}

		//ルートから自分までの@nameをつないだパスを取得する
		public static function getMyNamePath(element: XML): String
		{
			var parent: XML;
			var nameArr: Array = [element.@name];
			getParent(element);
			return nameArr.length > 0 ? nameArr.join(".") : null;
			function getParent(node: XML): void
			{
				parent = node.parent();
				if(parent == null) return;
				nameArr.unshift(parent.@name);
				getParent(parent);
			}
		}

		//子エレメントを全部削除
		public static function removeAllChildren(xml: XML): void
		{
			var i: uint;
			while(xml.children().length() > 0)
			{
				delete xml.children()[0];
			}
		}

		//テキスト設定
		public static function setString(element: XML, value: String): void
		{
			if(element != null)
			{
				element.setChildren(value);
			}
			else
			{
				////Log.error(Dom, "Dom.setString element is null.");
			}
		}

		//テキスト取得
		public static function getString(element: XML): *
		{
			if(element != null)
			{
				return element.toString();
			}
			else
			{
				////Log.error(Dom, "Dom.getText element is null.");
			}
			return null;
		}
	}
}