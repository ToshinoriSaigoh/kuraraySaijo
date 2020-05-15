package controller.documentroot.reportscreen.sidebar
{
	//import controller.App;
	import model.plugin.draw.Draw;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	//import flash.geom.Rectangle;
	//import flash.geom.Point;
	//import flash.text.TextField;
	//import mx.collections.ArrayCollection;

	public class TextToolBox extends VC
	{
		//public var textCollection: ArrayCollection;
		public function TextToolBox()
		{
			vcName = "textToolBox";
			elementName = "NavigatorContent";
		}
		override protected function init(): void
		{
			/*
			mxml.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler);
			textCollection = new ArrayCollection([]);
			mxml.textList.dataProvider = textCollection;
			_initTextCollection();
			*/
		}

		/*
		private function _initTextCollection(): void
		{
			var i: uint;
			var data: Object;
			for(i = 0; i < 100; i++)
			{
				data = new Object();
				data.text = "テキスト"+i;
				textCollection.addItem(data);
			}
		}

		private function _mouseDownHandler(evt: MouseEvent): void
		{
			_createTmpText(evt);
		}

		private function _createTmpText(evt: MouseEvent): void
		{
			evt.stopImmediatePropagation();
			//trace(evt.target.document);
			var collectionIndex: int = mxml.textList.getElementIndex(evt.target.document);
			//trace(collectionIndex);
			if( collectionIndex == -1 ) return;
			var textItem: Object = textCollection.getItemAt(collectionIndex) as Object;

			var tmpText: Sprite = new Sprite();
			var textField: TextField;
			createText();

			App.mainStage.addChild(tmpText);
			tmpText.x = App.mainStage.mouseX - (tmpText.width * 0.5);
			tmpText.y = App.mainStage.mouseY - (tmpText.height * 0.5);
			tmpText.startDrag(false, new Rectangle(- App.width / 2, - App.height / 2, App.width * 2, App.height * 2));
			tmpText.addEventListener(MouseEvent.MOUSE_UP, _mouseUpHandler);

			function createText(): void
			{
				textField = new TextField();
				textField.name = "textField";
				textField.text = textItem.text;
				tmpText.addChild(textField);
				tmpText.graphics.beginFill(0x000000, 0);
				tmpText.graphics.drawRect(0, 0, tmpText.width, tmpText.height);
				tmpText.graphics.endFill();
			}
			//テキスト配置完了
			function _mouseUpHandler(e: MouseEvent): void
			{
				tmpText.stopDrag();
				tmpText.removeEventListener(MouseEvent.MOUSE_UP, _mouseUpHandler);
				var tmpPoint: Point = new Point(0, 0);
				tmpPoint.x = tmpText.x;
				tmpPoint.y = tmpText.y;
				tmpPoint = Draw.activeDrawPanel.body.globalToLocal(tmpPoint);
				//_stampTool.pasteStamp(stamp, tmpPoint.x, tmpPoint.y);
				App.mainStage.removeChild(tmpText);
			}
		}
		*/
	}
}
