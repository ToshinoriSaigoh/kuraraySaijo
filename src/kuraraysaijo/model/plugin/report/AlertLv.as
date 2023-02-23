package kuraraysaijo.model.plugin.report
{
/**
 * アラートのプロパティ用オブジェクト.
 *
 * update 2020/06/30
 * Since 2020/06/30
 * @private
 */
	public class AlertLv
	{
		[Bindable]
		public var text: String;
		[Bindable]
		public var fontSize: String;
		[Bindable]
		public var color: String;
		[Bindable]
		public var bgColor: Number;
		public function AlertLv(t: String, f: String, c: String, b: Number)
		{
			text = t;
			fontSize = f;
			color = c;
			bgColor = b;
		}
	}
}
