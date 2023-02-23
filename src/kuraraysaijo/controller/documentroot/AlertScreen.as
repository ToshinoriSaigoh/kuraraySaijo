package kuraraysaijo.controller.documentroot
{
/**
 * アラート表示スクリーン.
 *
 * 使用方法
 * PostBox.send("alert", {visible: true, headText: "アラートテスト", contentText: "コメントテスト\r\n改行テスト"});
 *
 * update 2018/03/02
 * Since 2018/03/02
 * @private
 */
	public class AlertScreen extends VC
	{
		[Bindable]
		public var headText: String;
		[Bindable]
		public var contentText: String;
		public function AlertScreen()
		{
			vcName = "alertScreen";
			elementName = "screen";
			super();
		}

		public function PB_alert(): void
		{
			var param: Object = PostBox.get("PB_alert");
			headText = param.headText;
			contentText = param.contentText;

			if(param.visible)
			{
				caller.mxml.currentState = "alert";
			}
			else
			{
				caller.mxml.currentState = "normal";
			}
		}
	}
}
