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
		public var noAccidentAll: String;//事業所無災害記録
		[Bindable]
		public var noAccidentDept: String;//設技部無災害記録
		//設計
		[Bindable]
		public var morningDesigning: String;//朝礼
		[Bindable]
		public var exerciseDesigning: String;//体操
		[Bindable]
		public var dust1Designing: String;//ゴミ
		[Bindable]
		public var dust2Designing: String;//ゴミ
		[Bindable]
		public var patrol1Designing: String;//パトロール
		[Bindable]
		public var patrol2Designing: String;//パトロール
		//設管
		[Bindable]
		public var morningPipe: String;//朝礼
		[Bindable]
		public var exercisePipe: String;//体操
		[Bindable]
		public var dust1Pipe: String;//ゴミ
		[Bindable]
		public var dust2Pipe: String;//ゴミ
		[Bindable]
		public var patrol1Pipe: String;//パトロール
		[Bindable]
		public var patrol2Pipe: String;//パトロール
		//電装
		[Bindable]
		public var morningElectric: String;//朝礼
		[Bindable]
		public var exerciseElectric: String;//体操
		[Bindable]
		public var dust1Electric: String;//ゴミ
		[Bindable]
		public var dust2Electric: String;//ゴミ
		[Bindable]
		public var patrol1Electric: String;//パトロール
		[Bindable]
		public var patrol2Electric: String;//パトロール

		//テキストエリア
		[Bindable]
		public var scheduleHead: String;//今日の予定タイトル
		[Bindable]
		public var scheduleLabel: String;//今日の予定
		[Bindable]
		public var nextscheduleLabel: String;//明日の予定
		[Bindable]
		public var messageLabel: String;//連絡事項




		[Bindable]
		public var thermometerOutDoor: String;//温度計
		[Bindable]
		public var hygrometerOutDoor: String;//湿度計
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

		[Bindable]
		public var anemometer: String;//風速計


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
			_setNoAccidentAllValue();
			_setNoAccidentDeptValue();
			_setScheduleHead();
			_setTextLabel();
			_setDesigningPerson();
			_setPipePerson();
			_setElectricPerson();
			mxml.insertSchedule.addEventListener(MouseEvent.CLICK, _insertScheduleBtnClickHandler);


			//test
			WBGTAlertOutDoor = "注意";
			anemometer = "10.5";
			mxml.WBGTAlertOutDoor.currentState = "level0";//level0 ～ level4
			mxml.anemometer.currentState = "level1";//level0 ～ level4
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
				mxml.nextschedule.text = nextscheduleLabel;
				mxml.message.text = messageLabel;
				mxml.schedule.addEventListener(FocusEvent.FOCUS_OUT, _changeScheduleHandler);
				mxml.nextschedule.addEventListener(FocusEvent.FOCUS_OUT, _changeNextscheduleHandler);
				mxml.message.addEventListener(FocusEvent.FOCUS_OUT, _changeMessageHandler);
			}
		}

		//編集モードストップ
		private function _stop(): void
		{
			if(Draw.activeDrawPanel != null)
			{
				mxml.schedule.removeEventListener(FocusEvent.FOCUS_OUT, _changeScheduleHandler);
				mxml.nextschedule.removeEventListener(FocusEvent.FOCUS_OUT, _changeNextscheduleHandler);
				mxml.message.removeEventListener(FocusEvent.FOCUS_OUT, _changeMessageHandler);
				_setTextLabel();
			}
		}

		//設計担当者
		private function _setDesigningPerson(): void
		{
			var targetNode: XML = Config.configTree.config.kuraraySaijo.person.designingPersonList[0];
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
			morningDesigning = personArr[todayNum % personArr.length];
			exerciseDesigning = personArr[(todayNum + 1) % personArr.length];
			dust1Designing = personArr[(todayNum + 2) % personArr.length];
			dust2Designing = personArr[(todayNum + 3) % personArr.length];
		}
		private function _setPipePerson(): void
		{
			var targetNode: XML = Config.configTree.config.kuraraySaijo.person.pipePersonList[0];
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
			morningPipe = personArr[todayNum % personArr.length];
			exercisePipe = personArr[(todayNum + 1) % personArr.length];
			dust1Pipe = personArr[(todayNum + 2) % personArr.length];
			dust2Pipe = personArr[(todayNum + 3) % personArr.length];
		}
		private function _setElectricPerson(): void
		{
			var targetNode: XML = Config.configTree.config.kuraraySaijo.person.electricPersonList[0];
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
			morningElectric = personArr[todayNum % personArr.length];
			exerciseElectric = personArr[(todayNum + 1) % personArr.length];
			dust1Electric = personArr[(todayNum + 2) % personArr.length];
			dust2Electric = personArr[(todayNum + 3) % personArr.length];
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
		//明日の予定書き換え
		private function _changeNextscheduleHandler(evt: FocusEvent): void
		{
			_setTextValue("nextschedule", evt.target.text);
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
		private function _setNoAccidentAllValue(): void
		{
			var total: Number = Number(Config.get("config", "kuraraySaijo", "noAccidentAll", "noAccidentTotal"));
			var startDate: Number = Date.parse(Config.get("config", "kuraraySaijo", "noAccidentAll", "noAccidentStartDate"));
			noAccidentAll = String(Math.floor((_today.time - startDate) / 1000 / 60 / 60 / 24) + 1 + total);
		}
		private function _setNoAccidentDeptValue(): void
		{
			var total: Number = Number(Config.get("config", "kuraraySaijo", "noAccidentDept", "noAccidentTotal"));
			var startDate: Number = Date.parse(Config.get("config", "kuraraySaijo", "noAccidentDept", "noAccidentStartDate"));
			noAccidentDept = String(Math.floor((_today.time - startDate) / 1000 / 60 / 60 / 24) + 1 + total);
		}


		//本日の予定//連絡事項
		private function _setTextLabel(): void
		{
			scheduleLabel = mxml.parent.parent.parent.parent.owner.ctrlr.myDataElement.elements("schedule")[0].toString();//KuraraySaijoReport.schedule
			nextscheduleLabel = mxml.parent.parent.parent.parent.owner.ctrlr.myDataElement.elements("nextschedule")[0].toString();//KuraraySaijoReport.nextschedule
			messageLabel = mxml.parent.parent.parent.parent.owner.ctrlr.myDataElement.elements("message")[0].toString();//KuraraySaijoReport.message
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

			var nextWorkDay: Date = Holiday.getNextWorkDay(reportDate);
			var targetNextDay: String = "";
			targetNextDay += PaddingUtils.zeroPadding(nextWorkDay.getFullYear(), 4);
			targetNextDay += "/";
			targetNextDay += PaddingUtils.zeroPadding(nextWorkDay.getMonth() + 1, 2);
			targetNextDay += "/";
			targetNextDay += PaddingUtils.zeroPadding(nextWorkDay.getDate(), 2);
			var schedule: XML = Config.configTree.schedule[0];
			var textSchedule: String = null;
			var textNextschedule: String = null;
			if(schedule != null)
			{
				textSchedule = schedule.day.(@id == targetDay)[0];
				if(textSchedule != null)
				{
					mxml.schedule.text = textSchedule;
					scheduleLabel = textSchedule;
					_setTextValue("schedule", textSchedule);
				}

				textNextschedule = schedule.day.(@id == targetNextDay)[0];
				if(textNextschedule != null)
				{
					mxml.nextschedule.text = textNextschedule;
					nextscheduleLabel = textNextschedule;
					_setTextValue("nextschedule", textNextschedule);
				}
			}
		}

		//安全担当者更新
		public function MSG_refreshSettings(): void
		{
			_setNoAccidentAllValue();
			_setNoAccidentDeptValue();
			_setDesigningPerson();
			_setPipePerson();
			_setElectricPerson();
		}
	}
}
