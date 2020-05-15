package model.plugin.draw.edittool
{
/**
 * 変形用枠線出力、変形用プロパティを保持する.
 * 画像・スタンプ・図形のboxが継承する。
 *
 * update 2018/03/08 最前面に移動する機能を追加
 * Since 2018/03/08
 * @private
 */
	import common.*;
	import controller.App;
	import model.plugin.draw.*;
	import model.plugin.draw.edittool.*;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import flash.events.*;

	public class EditBox extends Sprite
	{
		public var targetPanel: DrawPanel;
		public var targetLayer: DrawLayer;
		public var operation: Operation;
		public var editTool: EditTool;
		public var scale: Number;
		public var box: Sprite;//editBox本体//boxにbodyと描画オブジェクトを入れる
		public var body: *;//shape, image(bitmap), stamp

		public var rect: Rectangle;//リフレッシュ用矩形情報
		public var bg: Sprite;
		public var border: Border;

		private var _selected: Boolean;
		private var _defaultWidth: Number;//editbox作成時width//固定
		private var _defaultHeight: Number;//editbox作成時height//固定
		private var _centerPointX: Number;//中央基点設定時に更新
		private var _centerPointY: Number;//中央基点設定時に更新
		private var _author: String;

		//コンストラクタ
		public function EditBox()
		{
			scale = 1.0;
			_selected = false;
			_defaultWidth = 0;
			_defaultHeight = 0;
			_centerPointX = 0;
			_centerPointY = 0;
			operation = new Operation(this);
			this.mouseEnabled = true;
			bg = new Sprite();
			bg.mouseEnabled = false;
			bg.mouseChildren = false;
			this.addChildAt(bg, 0);
			box = new Sprite();
			box.mouseEnabled = false;
			box.mouseChildren = false;
			this.addChild(box);
		}
		//初期化
		protected function setOperation(operationList: Array): void
		{
			border = new Border(this, operationList);
		}

		public function getProperties(): Object
		{
			return {
				"id": id,
				"f": String(Draw.activeReport.getNowTime()),
				"x": x,
				"y": y,
				"width": width,
				"height": height,
				"baseWidth": rect.width,
				"baseHeight": rect.height,
				"basePointX": centerPointX,
				"basePointY": centerPointY,
				"scaleX": scaleX,
				"scaleY": scaleY,
				"rotation": rotation
			};
		}

		//基点ポイントを中央に設定
		//固定
		public function centeringPoint(): void
		{
			var bounds: Rectangle;
			if(box != null)
			{
				bounds = box.getBounds(box);
				centerPointX = bounds.x + (bounds.width / 2);
				centerPointY = bounds.y + (bounds.height / 2);
			}
			else
			{
				centerPointX = 0.0;
				centerPointY = 0.0;
			}
		}

		//枠線再描画
		public function refreshBorder(): void
		{
			if(box != null)
			{
				rect = box.getBounds(this);

				bg.graphics.clear();
				bg.graphics.beginFill(0x000000, 0.2);
				bg.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
				bg.graphics.endFill();
				bg.mouseEnabled = false;
				bg.mouseChildren = false;

				border.draw();
				centeringPoint();
			}
		}
		//削除
		public function dispose(): void
		{
			CommonUtils.removeFromParent(this);
			rect = null;
			border.dispose();
		}

		public function set selected(val: Boolean): void
		{
			refreshBorder();
			_selected = val;
			if(_selected)
			{
				border.attach();
			}
			else
			{
				border.detach();
				border.changeBorderState("normal");
			}
		}
		public function get selected(): Boolean
		{
			return _selected;
		}
		public function set id(val: String): void
		{
			name = val;
		}
		public function get id(): String
		{
			return name;
		}
		public function set author(val: String): void
		{
			_author = val;
		}
		public function get author(): String
		{
			return _author;
		}
		override public function set width(val: Number): void
		{
			box.width = val;
		}
		override public function get width(): Number
		{
			return box.width;
		}
		override public function set height(val: Number): void
		{
			box.height = val;
		}
		override public function get height(): Number
		{
			return box.height;
		}
		public function set defaultWidth(val: Number): void
		{
			_defaultWidth = val;
		}
		public function get defaultWidth(): Number
		{
			return _defaultWidth;
		}
		public function set defaultHeight(val: Number): void
		{
			_defaultHeight = val;
		}
		public function get defaultHeight(): Number
		{
			return _defaultHeight;
		}
		override public function set scaleX(val: Number): void
		{
			box.scaleX = val;
		}
		override public function get scaleX(): Number
		{
			return box.scaleX;
		}
		override public function set scaleY(val: Number): void
		{
			box.scaleY = val;
		}
		override public function get scaleY(): Number
		{
			return box.scaleY;
		}
		public function set centerPointX(val: Number): void
		{
			_centerPointX = val;
		}
		public function get centerPointX(): Number
		{
			return _centerPointX;
		}
		public function set centerPointY(val: Number): void
		{
			_centerPointY = val;
		}
		public function get centerPointY(): Number
		{
			return _centerPointY;
		}
	}
}