package controller.documentroot.reportscreen.sidebar.settingsbox
{
	import view.documentroot.reportscreen.sidebar.settingsbox.settingstoolcontainer.*;
	import model.plugin.draw.imagetool.ImageTool;
	import model.plugin.draw.stamptool.StampTool;

	import flash.events.MouseEvent;
	import mx.collections.ArrayCollection;
	import mx.binding.utils.BindingUtils;
	public class SettingsToolContainer extends VC
	{
		//private var _colorCollection: ArrayCollection;
		private var _imageSizeCollection: ArrayCollection;
		private var _stampSizeCollection: ArrayCollection;
		public function SettingsToolContainer()
		{
			vcName = "settingsToolContainer";
			elementName = "NavigatorContent";
		}

		override protected function init(): void
		{
			//表示テキスト
			mxml.colorHead.text = Config.getText("Settings", "tools", "colorHead");
			mxml.colorLine.text = Config.getText("Settings", "tools", "colorLine");
			mxml.colorFill.text = Config.getText("Settings", "tools", "colorFill");
			mxml.toolsHead.text = Config.getText("Settings", "tools", "toolsHead");
			mxml.toolsPenTime.text = Config.getText("Settings", "tools", "toolsPenTime");
			mxml.toolsPenWeight.text = Config.getText("Settings", "tools", "toolsPenWeight");
			mxml.toolsImageSize.text = Config.getText("Settings", "tools", "toolsImageSize");
			mxml.toolsStampSize.text = Config.getText("Settings", "tools", "toolsStampSize");

			//画像サイズドロップダウンリスト
			_imageSizeCollection = new ArrayCollection([]);
			var i: uint;
			for(i = 0; i < ImageTool.sizeArr.length; i++)
			{
				_imageSizeCollection.addItemAt({val: ImageTool.sizeArr[i], text: String(ImageTool.sizeArr[i])}, i);
			}
			mxml.selectImageSize.dataProvider = _imageSizeCollection;
			BindingUtils.bindSetter(_updateImageSize, this.mxml.selectImageSize, "selectedItem");

			//スタンプサイズドロップダウンリスト
			_stampSizeCollection = new ArrayCollection([]);
			for(i = 0; i < StampTool.sizeArr.length; i++)
			{
				_stampSizeCollection.addItemAt({val: StampTool.sizeArr[i], text: String(StampTool.sizeArr[i])}, i);
			}
			mxml.selectStampSize.dataProvider = _stampSizeCollection;
			BindingUtils.bindSetter(_updateStampSize, this.mxml.selectStampSize, "selectedItem");

			//設定値を反映
			_refreshConfigValue();
			//イベントセット
			_setEvents();
		}

		private function _setEvents(): void
		{
			mxml.lineColorBtn.addEventListener(MouseEvent.CLICK, _clickHandler);
			mxml.fillColorBtn.addEventListener(MouseEvent.CLICK, _clickHandler);
		}

		private function _clickHandler(evt: MouseEvent): void
		{
			switch(evt.target.name)
			{
				case "lineColorBtn":
					PostBox.send("showPallet", {pallet: "colorPallet", type: "line", mode: "settings"});
					break;
				case "fillColorBtn":
					PostBox.send("showPallet", {pallet: "colorPallet", type: "fill", mode: "settings"});
					break;
			}
		}

		//設定値Config._myTree: XMLを反映させる
		private function _refreshConfigValue(): void
		{
			//線色
			mxml.lineColorBtn.skin.lineColor.color = Config.get("config", "tools", "colorLine");
			//塗り色
			mxml.fillColorBtn.skin.fillColor.color = Config.get("config", "tools", "colorFill");

			//時限マーカー時間
			mxml.incDecPenTime.counter.text = Config.get("config", "tools", "penTime");
			//線幅
			mxml.incDecPenWeight.counter.text = Config.get("config", "tools", "penWeight");

			//画像貼り付けサイズ
			var imageIndex: int = ImageTool.sizeArr.indexOf(Number(Config.get("config", "tools", "imageSize")));
			if(imageIndex != -1)
			{
				mxml.selectImageSize.selectedIndex = imageIndex;
			}
			//スタンプ貼り付けサイズ
			var stampIndex: int = StampTool.sizeArr.indexOf(Number(Config.get("config", "tools", "stampSize")));
			if(stampIndex != -1)
			{
				mxml.selectStampSize.selectedIndex = stampIndex;
			}
			Config.saveConfigXML(Config.configTree.config[0], "config.xml");
		}

		//ドロップダウンリストで選択された値をテキストに反映させる
		private function _updateImageSize(txt: String): void
		{
			if(mxml.selectImageSize.selectedItem != null)
			{
				mxml.selectImageSize.skin.label.text = mxml.selectImageSize.selectedItem.text;
				Config.set("config", "tools", "imageSize", mxml.selectImageSize.selectedItem.val);
			}
			_refreshConfigValue();
		}

		//ドロップダウンリストで選択された値をテキストに反映させる
		private function _updateStampSize(txt: String): void
		{
			if(mxml.selectStampSize.selectedItem != null)
			{
				mxml.selectStampSize.skin.label.text = mxml.selectStampSize.selectedItem.text;
				Config.set("config", "tools", "stampSize", mxml.selectStampSize.selectedItem.val);
			}
			_refreshConfigValue();
		}
	}
}
