package model.plugin.draw
{
/**
 * 描画用パネルクラス.
 *
 * update 2018/01/24
 * Since 2018/01/24
 * @private
 */
	import controller.*;
	import model.plugin.draw.*;
	import model.plugin.draw.edittool.EditBox;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.events.*;
	import flash.filesystem.File;

	public class DrawPanel extends VC
	{
		public var targetEditBox: EditBox;
		public var drawPanelWidth: Number;
		public var drawPanelHeight: Number;
		public var dragRect: Rectangle;
		public var layers: Sprite;//レイヤーリスト
		public var drawLayers: Object;
		public var drawPanel: Sprite;//body//activeDrawPanel
		private var _distanceX: Number;
		private var _distanceY: Number;
		//境界線
		private var _borderline: Shape;
		private var _borderColor: Number;
		private var _borderThick: uint;
		private var _borderAlpha: Number;

		public function DrawPanel(parent: VC, w: Number, h: Number)
		{
			drawPanelWidth = w;
			drawPanelHeight = h;
			_borderColor = 0x00ccee;
			_borderThick = 2;
			_borderAlpha = 0.5;
			targetEditBox = null;
			super(parent);
			_createDrawPanel();
			create_borderline();
			resize();
			Draw.createDrawBuffer(caller.vcName, vcName);
		}

		public function MSG_windowResize(): void
		{
			resize();
		}

		//境界線作成
		protected function create_borderline(): void
		{
			_borderline = new Shape();
			var border: Graphics = _borderline.graphics;
			drawPanel.addChild(_borderline);
			drawBorder(0, 0, drawPanelWidth, drawPanelHeight, _borderColor);
			drawBorder(- _borderThick, - _borderThick, drawPanelWidth + _borderThick, drawPanelHeight + _borderThick, 0xffffff);
			function drawBorder(ptLeft: Number, ptTop: Number, ptRight: Number, ptBottom: Number, color: Number): void
			{
				border.lineStyle (2, color, _borderAlpha);
				border.moveTo (ptLeft, ptTop);
				border.lineTo (ptRight, ptTop);
				border.lineTo (ptRight, ptBottom);
				border.lineTo (ptLeft, ptBottom);
				border.lineTo (ptLeft, ptTop);
			}
		}
		//描画用パネル作成
		private function _createDrawPanel(): void
		{
			drawPanel = new Sprite();
			drawPanel.name = vcName;
			drawPanel.mouseEnabled = false;
			layers = new Sprite();
			layers.name = "layers";
			body = drawPanel;
			drawLayers = {};
			drawPanel.addChild(layers);
			caller.body.addChildAt(drawPanel, 0);
			_distanceX = 0;
			_distanceY = 0;
		}
		//ウィンドウリサイズ時、パネルサイズと位置の調整
		protected function resize(): void
		{
			setPosition();
			setDragArea();
		}
		//位置調整
		public function setPosition(): void
		{
			x = getBaseX() + _distanceX;
			y = getBaseY() + _distanceY;
		}
		//App.mainStageに合わせた基準位置からのX軸移動距離
		public function setDistanceX(): void
		{
			_distanceX = x - getBaseX();
		}
		//App.mainStageに合わせた基準位置からのY軸移動距離
		public function setDistanceY(): void
		{
			_distanceY = y - getBaseY();
		}
		//ウィンドウに合わせた描画パネルの基準X座標を返す
		protected function getBaseX(): Number
		{
			return (App.mainStage.stageWidth - drawPanelWidth * scaleX) / 2;
		}
		//ウィンドウに合わせた描画パネルの基準Y座標を返す
		protected function getBaseY(): Number
		{
			return (App.mainStage.stageHeight - drawPanelHeight * scaleY) / 2;
		}
		//ドラッグ可能エリア矩形をセット
		public function setDragArea(): void
		{
			dragRect = new Rectangle(
				- drawPanelWidth * scaleX / 2 + getBaseX(),
				- drawPanelHeight * scaleY / 2 + getBaseY(),
				drawPanelWidth * scaleX,
				drawPanelHeight * scaleY
			);
		}

		//drawPanelのビットマップを返す
		public function createBitmapData(): BitmapData
		{
			var bitmapData: BitmapData = new BitmapData( drawPanelWidth, drawPanelHeight, true, 0x00FFFFFF );
			//bitmapData.draw(body, null, null, null, null, true);
			return bitmapData;
		}

		//対応フォルダ
		public function getOwnDirectory(): File
		{
			return caller.reportDir.resolvePath("data/" + vcName);
		}
		//対応フォルダ
		public function getOwnTrashBox(): File
		{
			return caller.reportDir.resolvePath("trashbox/" + vcName);
		}

	}
}
