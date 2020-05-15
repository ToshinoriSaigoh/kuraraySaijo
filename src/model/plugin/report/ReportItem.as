package model.plugin.report
{
	public class ReportItem
	{
/**
 * レポート一覧ボタンなど、レポート情報クラス.
 *
 * update 2018/01/24
 * Since 2018/01/24
 * @private
 */
		[Bindable]
		public var name: String;
		[Bindable]
		public var title: String;
		[Bindable]
		public var color: Number;
		[Bindable]
		public var type: String;

		public function ReportItem(name: String, title: String, type: String, color: Number)
		{
			this.name = name;
			this.title = title;
			this.type = type;
			this.color = color;
		}
	}
}
