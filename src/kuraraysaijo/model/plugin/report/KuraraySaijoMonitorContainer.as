package kuraraysaijo.model.plugin.report
{
	import common.PaddingUtils;
	import kuraraysaijo.model.plugin.holiday.Holiday;
	import model.plugin.draw.Draw;
	import model.plugin.draw.ControlPanel;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;

	public class KuraraySaijoMonitorContainer extends VC
	{
		[Bindable]
		public var noAccidentRecord: String;
		[Bindable]
		public var noAccidentTarget: String;
		[Bindable]
		public var noAccidentDaysToGo: String;
		[Bindable]
		public var spotlessDrivingRecord: String;
		[Bindable]
		public var spotlessDrivingTarget: String;
		[Bindable]
		public var spotlessDrivingDaysToGo: String;
		[Bindable]
		public var todayPerson: String;
		[Bindable]
		public var nextPerson: String;
		[Bindable]
		public var afterNextPerson: String;

		[Bindable]
		public var thermometerOutDoor: String;
		[Bindable]
		public var hygrometerOutDoor: String;
		[Bindable]
		public var WBGTOutDoor: String;
		[Bindable]
		public var WBGTAlertOutDoor: String;
		[Bindable]
		public var alertBgLv0: Number;
		[Bindable]
		public var alertBgLv1: Number;
		[Bindable]
		public var alertBgLv2: Number;
		[Bindable]
		public var alertBgLv3: Number;
		[Bindable]
		public var alertBgLv4: Number;
		[Bindable]
		public var alertColorLv0: Number;
		[Bindable]
		public var alertColorLv1: Number;
		[Bindable]
		public var alertColorLv2: Number;
		[Bindable]
		public var alertColorLv3: Number;
		[Bindable]
		public var alertColorLv4: Number;




		/*
		[Bindable]
		public var thermometerInDoor: String;
		[Bindable]
		public var hygrometerInDoor: String;
		[Bindable]
		public var WBGTInDoor: String;
		*/
		[Bindable]
		public var anemometer: String;
		[Bindable]
		public var scheduleLabel: String;
		[Bindable]
		public var messageLabel: String;
		[Bindable]
		public var scheduleHead: String;

		private var _today: Date;

		public function KuraraySaijoMonitorContainer()
		{
			vcName = "kuraraySaijoMonitorContainer";
			elementName = "Group";

			//test
			//ステートのテキスト色はcreationComplete前に設定しておく
			alertBgLv0 = 0xffffff;
			alertBgLv1 = 0x00aa00;
			alertBgLv2= 0xFFDD00;
			alertBgLv3 = 0xFF4F00;
			alertBgLv4 = 0xDD0000;
			alertColorLv0 = 0x000000;
			alertColorLv1 = 0xffffff;
			alertColorLv2= 0x000000;
			alertColorLv3 = 0xffffff;
			alertColorLv4 = 0xffffff;

			super();
		}

		override protected function init(): void
		{
			_today = new Date();
			_setNoAccidentValue();
			_setSpotlessDrivingValue();
			_setScheduleHead();
			_setTextLabel();
			_setSafetyPerson();
			mxml.insertSchedule.addEventListener(MouseEvent.CLICK, _insertScheduleBtnClickHandler);


			//test
			WBGTAlertOutDoor = "高温注意";
			anemometer = "10.5";
			mxml.WBGTAlertOutDoor.currentState = "level0";//level0 ～ level4
			mxml.anemometer.currentState = "level0";//level0 ～ level4
		}

		public function PB_changeTool(): void
		{
			var param: Object = PostBox.get("PB_changeTool");
			if(param.tool == "changeMode" && mxml.currentState == "normal")
			{
				mxml.currentState = "edit";
				_start();
			}
			else
			{
				mxml.currentState = "normal";
				_stop();
			}

		}

		//編集モードスタート
		private function _start(): void
		{
			if(Draw.activeDrawPanel != null)
			{
				ControlPanel.controlPanel.visible = false;//手書きポイント読み取り用レイヤー非表示
				mxml.schedule.text = scheduleLabel;
				mxml.message.text = messageLabel;
				mxml.schedule.addEventListener(FocusEvent.FOCUS_OUT, _changeScheduleHandler);
				mxml.message.addEventListener(FocusEvent.FOCUS_OUT, _changeMessageHandler);
			}
		}

		//編集モードストップ
		private function _stop(): void
		{
			if(Draw.activeDrawPanel != null)
			{
				mxml.schedule.removeEventListener(FocusEvent.FOCUS_OUT, _changeScheduleHandler);
				mxml.message.removeEventListener(FocusEvent.FOCUS_OUT, _changeMessageHandler);
				_setTextLabel();
			}
		}

		//安全担当者
		private function _setSafetyPerson(): void
		{
			var targetNode: XML = Config.configTree.config.kuraraySaijo.safety.safetyPersonList[0];
			var __lf: String = "\n";
			var personArr: Array = targetNode.toString().split(__lf);
			var i: uint;
			for(i = 0; i < personArr.length; i++)
			{
				if(personArr[i] == null || personArr[i] == "")
				{
					personArr.splice(i, 1);
				}
			}

			var today: Date = new Date();
			var todayNum: int = Holiday.getWorkDays(today);

			todayPerson = personArr[todayNum % personArr.length];
			nextPerson = personArr[(todayNum + 1) % personArr.length];
			afterNextPerson = personArr[(todayNum + 2) % personArr.length];
		}

		private function _getReportDate(): Date
		{
			return new Date(Number(mxml.parent.parent.parent.parent.owner.ctrlr.year), Number(mxml.parent.parent.parent.parent.owner.ctrlr.month) - 1 , Number(mxml.parent.parent.parent.parent.owner.ctrlr.day));
		}

		//予定見出し日付セット
		private function _setScheduleHead(): void
		{
			scheduleHead = Lib.getDateString(_getReportDate()) + "の予定";
		}
		//本日の予定書き換え
		private function _changeScheduleHandler(evt: FocusEvent): void
		{
			_setTextValue("schedule", evt.target.text);
		}
		//連絡事項書き換え
		private function _changeMessageHandler(evt: FocusEvent): void
		{
			_setTextValue("message", evt.target.text);
		}

		//データツリーに値をセット
		private function _setTextValue(target: String, val: String): void
		{
			mxml.parent.parent.parent.parent.owner.ctrlr.myDataElement.elements(target)[0].setChildren(val);
		}

		//無災害記録
		private function _setNoAccidentValue(): void
		{
			var total: Number = Number(Config.get("config", "kuraraySaijo", "noAccident", "noAccidentTotal"));
			var startDate: Number = Date.parse(Config.get("config", "kuraraySaijo", "noAccident", "noAccidentStartDate"));
			var targetDate: Number = Date.parse(Config.get("config", "kuraraySaijo", "noAccident", "noAccidentTargetDate"));

			noAccidentDaysToGo = String(Math.floor((targetDate - _today.time) / 1000 / 60 / 60 / 24) + 1);
			noAccidentRecord = String(Math.floor((_today.time - startDate) / 1000 / 60 / 60 / 24) + 1 + total);
			//目標値=積算日数＋（目標年月日－起点年月日）－1日
			noAccidentTarget = String(Math.floor((_today.time - startDate) / 1000 / 60 / 60 / 24) + 1 + total + (Math.floor((targetDate - _today.time) / 1000 / 60 / 60 / 24)));
		}

		//無事故無違反記録
		private function _setSpotlessDrivingValue(): void
		{
			var total: Number = Number(Config.get("config", "kuraraySaijo", "spotlessDriving", "spotlessDrivingTotal"));
			var startDate: Number = Date.parse(Config.get("config", "kuraraySaijo", "spotlessDriving", "spotlessDrivingStartDate"));
			var targetDate: Number = Date.parse(Config.get("config", "kuraraySaijo", "spotlessDriving", "spotlessDrivingTargetDate"));

			spotlessDrivingDaysToGo = String(Math.floor((targetDate - _today.time) / 1000 / 60 / 60 / 24) + 1);
			spotlessDrivingRecord = String(Math.floor((_today.time - startDate) / 1000 / 60 / 60 / 24) + 1 + total);
			//目標値=積算日数＋(目標年月日－起点年月日）－1日
			spotlessDrivingTarget = String(Math.floor((_today.time - startDate) / 1000 / 60 / 60 / 24) + 1 + total + (Math.floor((targetDate - _today.time) / 1000 / 60 / 60 / 24)));
		}

		//本日の予定//連絡事項
		private function _setTextLabel(): void
		{
			scheduleLabel = mxml.parent.parent.parent.parent.owner.ctrlr.myDataElement.elements("schedule")[0].toString();
			messageLabel = mxml.parent.parent.parent.parent.owner.ctrlr.myDataElement.elements("message")[0].toString();
		}

		//スケジュール取り込みボタン処理
		private function _insertScheduleBtnClickHandler(evt: MouseEvent): void
		{
			var reportDate: Date = _getReportDate();
			var targetDay: String = "";
			targetDay += PaddingUtils.zeroPadding(reportDate.getFullYear(), 4);
			targetDay += "/";
			targetDay += PaddingUtils.zeroPadding(reportDate.getMonth() + 1, 2);
			targetDay += "/";
			targetDay += PaddingUtils.zeroPadding(reportDate.getDate(), 2);

			var schedule: XML = Config.configTree.schedule[0];
			var text: String = null;
			if(schedule != null)
			{
				text = schedule.day.(@id == targetDay)[0];
				if(text != null)
				{
					mxml.schedule.text = text;
					scheduleLabel = text;
					_setTextValue("schedule", text);
				}
			}
		}

		//安全担当者更新
		public function MSG_refreshSettings(): void
		{
			_setNoAccidentValue();
			_setSpotlessDrivingValue();
			_setSafetyPerson();
		}
	}
}
