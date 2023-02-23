package model.plugin.report
{
/**
 * レポートそのもの.
 *
 * update 2018/01/24
 * Since 2018/01/24
 * @private
 */
	import spark.components.NavigatorContent;
	import spark.core.SpriteVisualElement;
	import flash.display.Sprite;
	import flash.display.Graphics;

	public class ReportBody extends NavigatorContent
	{
		public var ctrlr: VC;
		public var body: SpriteVisualElement;
		public function ReportBody(controller: VC)
		{
			ctrlr = controller;
			super();
			createBody();
		}

		protected function createBody(): void
		{
			body = new SpriteVisualElement();
			this.addElement(body);
		}
	}
}
