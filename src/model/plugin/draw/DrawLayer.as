package model.plugin.draw
{
/**
 * 描画用レイヤークラス.
 *
 * update 2018/01/24
 * Since 2018/01/24
 * @private
 */
	import spark.core.SpriteVisualElement;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.filesystem.File;
	public class DrawLayer extends VC
	{
		public function DrawLayer(parent: VC, layerName: String)
		{
			super(parent);
			_createDrawLayer(layerName);
		}

		//描画レイヤー作成
		private function _createDrawLayer(layerName: String): void
		{
			body = new SpriteVisualElement();
			body.name = layerName;
			//body.cacheAsBitmap = false;

			/*//範囲確認用
			body.graphics.beginFill(0x22eeff, 0.2);
			body.graphics.drawRect(0, 0, 200, 200);
			body.graphics.endFill();
			*/
			caller.layers.addChild(body);
			caller.drawLayers[layerName] = this;
		}
		//対応フォルダ
		public function getOwnDirectory(): File
		{
			return caller.caller.reportDir.resolvePath("data/" + caller.vcName);
		}
		//対応フォルダ
		public function getOwnTrashBox(): File
		{
			return caller.caller.reportDir.resolvePath("trashbox/" + caller.vcName);
		}

	}
}
