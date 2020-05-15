package controller.documentroot.reportscreen.palletcontainer
{
	import controller.App;
	import model.plugin.draw.Draw;
	import model.plugin.draw.DrawPlayer;
	import spark.core.SpriteVisualElement;
	import mx.events.FlexEvent;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.CapsStyle;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.collections.ArrayCollection;
	import mx.binding.utils.BindingUtils;
	public class TimelinePallet extends VC
	{
		[Bindable]
		public var timeLength: Number;
		private var _timeTypeCollection: ArrayCollection;

		public function TimelinePallet()
		{
			vcName = "timelinePallet";
			elementName = "Group";
			super();

			timeLength = 0;
		}

		override protected function init(): void
		{
			mxml.selectTimeBox.dataProvider = new ArrayCollection([
				{name: "time00Btn", text: Config.getText("TimelinePallet", "timeList", "time00"), milisec: 1000},//要修正//オブジェクトをクラスにしてプロパティをバインド
				{name: "time01Btn", text: Config.getText("TimelinePallet", "timeList", "time01"), milisec: 10000},//要修正//オブジェクトをクラスにしてプロパティをバインド
				{name: "time02Btn", text: Config.getText("TimelinePallet", "timeList", "time02"), milisec: 60000},//要修正//オブジェクトをクラスにしてプロパティをバインド
				{name: "time03Btn", text: Config.getText("TimelinePallet", "timeList", "time03"), milisec: 600000},//要修正//オブジェクトをクラスにしてプロパティをバインド
				{name: "time04Btn", text: Config.getText("TimelinePallet", "timeList", "time04"), milisec: 3600000},//要修正//オブジェクトをクラスにしてプロパティをバインド
				{name: "time05Btn", text: Config.getText("TimelinePallet", "timeList", "time05"), milisec: 86400000},//要修正//オブジェクトをクラスにしてプロパティをバインド
				{name: "time06Btn", text: Config.getText("TimelinePallet", "timeList", "time06"), milisec: 2592000000}//要修正//オブジェクトをクラスにしてプロパティをバインド
			]);
			BindingUtils.bindSetter(_updateOpenBtn, this.mxml.selectTimeBox, "selectedItem");

			mxml.timelineSlider.dataTipFormatFunction = this.dataTipFormatter;
			//mxml.timelineSlider.addEventListener(Event.CHANGE, _timeChangeHundler);//スライダーの値が変化したとき
			mxml.timelineSlider.addEventListener(FlexEvent.CHANGE_END, _changeEndHundler);//スライダー操作終了時
			mxml.ctrlBox.addEventListener(MouseEvent.CLICK, _ctrlBoxClickHandler);
			mxml.closeBtn.addEventListener(MouseEvent.CLICK, _ctrlBoxClickHandler);

		}

		private function _updateOpenBtn(txt: String): void
		{
			if(mxml.selectTimeBox.selectedItem != null)
			{
				mxml.selectTimeBox.skin.label.text = mxml.selectTimeBox.selectedItem.text;
			}
		}

		private function _ctrlBoxClickHandler(evt: Event): void
		{
			var cueTime: Number;
			switch(evt.target.name)
			{
				case "closeBtn":
					PostBox.send("changeTool", {tool: "penTool"});
					PostBox.send("showPallet", {pallet: "timelinePallet", value: "hide"});
					break;
				case "playBtn":
					PostBox.send("actionMovie", {action: "play"});
					break;
				case "pauseBtn":
					PostBox.send("actionMovie", {action: "pause"});
					break;
				case "prevBtn":
					Draw.activeDrawPanel.report.nowTime = Draw.activeDrawPanel.report.nowTime - mxml.selectTimeBox.selectedItem.milisec;
					if(Draw.activeDrawPanel.report.nowTime < 0)
					{
						Draw.activeDrawPanel.report.nowTime = 0;
					}
					cueTime = Draw.activeDrawPanel.report.nowTime;
					PostBox.send("actionMovie", {action: "cue", time: cueTime});
					break;
				case "nextBtn":
					Draw.activeDrawPanel.report.nowTime = Draw.activeDrawPanel.report.nowTime + mxml.selectTimeBox.selectedItem.milisec;
					if(Draw.activeDrawPanel.report.nowTime > Draw.activeDrawPanel.report.lastTime)
					{
						Draw.activeDrawPanel.report.nowTime = Draw.activeDrawPanel.report.lastTime;
					}
					cueTime = Draw.activeDrawPanel.report.nowTime;
					PostBox.send("actionMovie", {action: "cue", time: cueTime});
					break;
			}
		}

		private function _timeChangeHundler(e: Event): void
		{
		}

		private function _changeEndHundler(e: FlexEvent): void
		{
			Draw.activeDrawPanel.report.nowTime = mxml.timelineSlider.value;
			var cueTime: Number = Draw.activeDrawPanel.report.nowTime == Draw.activeDrawPanel.report.lastTime ? Draw.activeDrawPanel.report.nowTime + DrawPlayer.adjustTime : Draw.activeDrawPanel.report.nowTime;
			PostBox.send("actionMovie", {action: "cue", time: cueTime});
		}
		public function PB_actionMovie_after(): void
		{
			var param: Object = PostBox.get("PB_actionMovie_after");
			switch(param.action)
			{
				case "stop":
				case "pause":
					break;
			}
		}
		public function PB_creationCompleteReport(): void
		{
			var param: Object = PostBox.get("PB_creationCompleteReport");
		}

		public function PB_changeReport_after(): void
		{
		}

		//データチップの表示変更
		public function dataTipFormatter(data: Number): String
		{
			return Lib.getMilisecFormatter(Draw.activeDrawPanel.report.baseTime + data);
		}
	}
}
