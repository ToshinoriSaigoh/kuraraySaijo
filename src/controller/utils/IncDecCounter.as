/*
■１
vcNameは呼び出し元MXML（SparkSkin）にhostComponentを定義して配置したMXMLで設定したidの値から取得する
<ボタンを配置したMXML>
	<s:Button id="vcName" skinClass="view..Skin__Btn">
</ボタンを配置したMXML>

Skin__Btn.mxml
<s:SparkSkin>
	<fx:Metadata>
		<![CDATA[ 
			[HostComponent("spark.components.Button")]
		]]>
	</fx:Metadata>
</s:SparkSkin>

■2
initialized -> FlexEvent.CREATION_COMPLETE でコンポーネント構築完了後メソッドinit()をオーバーライドしてvcNameを設定する
*/
package controller.utils
{
	import mx.events.FlexEvent;
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class IncDecCounter extends VC
	{
		public function IncDecCounter()
		{
			elementName = "IncDecCounter";
			super();
		}
		override protected function init(): void
		{
			mxml.increase.addEventListener(FlexEvent.BUTTON_DOWN, _clickHandler);
			mxml.decrease.addEventListener(FlexEvent.BUTTON_DOWN, _clickHandler);
		}
		private function _clickHandler(e: FlexEvent): void
		{
			doing(e.target.name);
		}

		public function actionDoing(): void
		{
			doing();
		}
		//ボタンクリック時の動作
		//メッセージを飛ばしたくない場合は派生クラスでオーバーライドする
		protected function doing(btnName: String = null): void
		{
			//trace("■Button doing, PostBox.set(VC_" + vcName + ")");
			PostBox.set("VC_" + vcName, this);
		}
	}
}


