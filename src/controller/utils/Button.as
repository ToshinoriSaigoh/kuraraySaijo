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
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class Button extends VC
	{
		public function Button()
		{
			elementName = "Button";
			super();
		}
		override protected function init(): void
		{
			vcName = mxml.hostComponent.id;
			mxml.hostComponent.addEventListener(MouseEvent.CLICK, clickHandler);
		}

		private function clickHandler(e: MouseEvent): void
		{
			doing();
		}
		public function actionDoing(): void
		{
			doing();
		}
		//ボタンクリック時の動作
		//メッセージを飛ばしたくない場合は派生クラスでオーバーライドする
		protected function doing(): void
		{
			//trace("■Button doing, PostBox.set(VC_" + vcName + ")");
			PostBox.set("VC_" + vcName, this);
		}
	}
}


