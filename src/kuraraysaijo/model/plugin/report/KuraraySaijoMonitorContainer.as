package kuraraysaijo.model.plugin.report
{
	import common.PaddingUtils;
	import kuraraysaijo.model.plugin.holiday.Holiday;
	import kuraraysaijo.model.plugin.config.WarningInfo;
	import kuraraysaijo.model.plugin.config.ScheduleConfig;
	import kuraraysaijo.model.plugin.config.AnemometerConfig;
	import kuraraysaijo.model.plugin.config.WBGTConfig;
	import kuraraysaijo.model.plugin.config.WarningInfo;
	import model.plugin.draw.Draw;
	import model.plugin.draw.ControlPanel;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import spark.formatters.NumberFormatter;

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
		public var absenceLabel: String;//欠勤
		[Bindable]
		public var tripLabel: String;//出張
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
		[Bindable]
		public var anemometerAlert: String;//風速計

		//会議室
		[Bindable]
		public var MeetingRoomLamp1: String;
		[Bindable]
		public var MeetingRoomLamp2: String;
		[Bindable]
		public var MeetingRoomLamp3: String;
		[Bindable]
		public var MeetingRoomLamp4: String;
		[Bindable]
		public var MeetingRoomLamp5: String;
		[Bindable]
		public var emptyColor: Number;
		[Bindable]
		public var useColor: Number;


		private var _today: Date;

		public function KuraraySaijoMonitorContainer()
		{
			vcName = "kuraraySaijoMonitorContainer";
			elementName = "Group";

/*
			//WBGT
			warningInfo = WBGTConfig.getWarningInfo(0);
			if(warningInfo != null)
			{
				alertColorLv0 = warningInfo.color;
				alertBgLv0 = warningInfo.backgroundColor;
			}
			warningInfo = WBGTConfig.getWarningInfo(1);
			if(warningInfo != null)
			{
				alertColorLv1 = warningInfo.color;
				alertBgLv1 = warningInfo.backgroundColor;
			}
			warningInfo = WBGTConfig.getWarningInfo(2);
			if(warningInfo != null)
			{
				alertColorLv2 = warningInfo.color;
				alertBgLv2 = warningInfo.backgroundColor;
			}
			warningInfo = WBGTConfig.getWarningInfo(3);
			if(warningInfo != null)
			{
				alertColorLv3 = warningInfo.color;
				alertBgLv3 = warningInfo.backgroundColor;
			}

			//Anemometer
			warningInfo = AnemometerConfig.getWarningInfo(0);
			if(warningInfo != null)
			{
				alertAnemometerColorLv0 = warningInfo.color;
				alertAnemometerBgLv0 = warningInfo.backgroundColor;
			}
			warningInfo = AnemometerConfig.getWarningInfo(1);
			if(warningInfo != null)
			{
				alertAnemometerColorLv1 = warningInfo.color;
				alertAnemometerBgLv1 = warningInfo.backgroundColor;
			}
*/

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

			emptyColor = 0xaaaaaa;
			useColor = 0x66ff00;

			super();
		}

		override protected function init(): void
		{
			_today = new Date();
			//_setNoAccidentAllValue();
			//_setNoAccidentDeptValue();
			_setScheduleHead();
			_setTextLabel();
			_setDuty("morning");
			_setDuty("exercise");
			_setDuty("dust");
			_setDuty("patrol");
			//_setDesigningPerson();
			//_setPipePerson();
			//_setElectricPerson();
			mxml.insertSchedule.addEventListener(MouseEvent.CLICK, _insertScheduleBtnClickHandler);

			mxml.MeetingRoomLamp1.label.text = "会議室１";
			mxml.MeetingRoomLamp2.label.text = "会議室２";
			mxml.MeetingRoomLamp3.label.text = "会議室３";
			mxml.MeetingRoomLamp4.label.text = "面談室１";
			mxml.MeetingRoomLamp5.label.text = "面談室２";
			mxml.MeetingRoomLamp1.currentState = "empty";
			mxml.MeetingRoomLamp2.currentState = "empty";
			mxml.MeetingRoomLamp3.currentState = "empty";
			mxml.MeetingRoomLamp4.currentState = "empty";
			mxml.MeetingRoomLamp5.currentState = "empty";

			PostBox.send("sensorCtrl", {command:"request"});
			PostBox.send("meetingroomCtrl", {command:"request"});
			PostBox.send("personCtrl", {command:"request"});

			/*
			//test
			thermometerOutDoor = "21.5";
			hygrometerOutDoor = "46.8";
			WBGTOutDoor = "35.0";
			anemometer = "20.5";
			//mxml.anemometer.currentState = "level0";//level0 ～ level4

			WBGTAlertOutDoor = "注意";
			mxml.WBGTAlertOutDoor.currentState = "level3";//level0 ～ level4
			anemometerAlert = "暴風";
			mxml.anemometerAlert.currentState = "level0";//level0 ～ level4
			*/
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
				//mxml.absence.text = absenceLabel;
				//mxml.trip.text = tripLabel;
				mxml.schedule.text = scheduleLabel;
				mxml.nextschedule.text = nextscheduleLabel;
				mxml.message.text = messageLabel;
				//mxml.absence.addEventListener(FocusEvent.FOCUS_OUT, _changeAbsenceHandler);
				//mxml.trip.addEventListener(FocusEvent.FOCUS_OUT, _changeTripHandler);
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
				//mxml.absence.removeEventListener(FocusEvent.FOCUS_OUT, _changeAbsenceHandler);
				//mxml.trip.removeEventListener(FocusEvent.FOCUS_OUT, _changeTripHandler);
				mxml.schedule.removeEventListener(FocusEvent.FOCUS_OUT, _changeScheduleHandler);
				mxml.nextschedule.removeEventListener(FocusEvent.FOCUS_OUT, _changeNextscheduleHandler);
				mxml.message.removeEventListener(FocusEvent.FOCUS_OUT, _changeMessageHandler);
				_setTextLabel();
			}
		}
		//担当表示
		private function _setDuty(type: String): void
		{
			var dutyList: Array;
			var targetNode: XML = Config.configTree.duty.elements(type)[0];
			if(targetNode == null) return;
			switch(type)
			{
				case "morning":
					dutyList = _setDutyTheDay(targetNode, new Date());
					morningDesigning = dutyList[0];
					morningPipe = dutyList[1];
					morningElectric = dutyList[2];
					break;
				case "exercise":
					dutyList = _setDutyTheDay(targetNode, new Date());
					exerciseDesigning = dutyList[0];
					exercisePipe = dutyList[1];
					exerciseElectric = dutyList[2];
					break;
				case "dust":
					dutyList = _setDutyDustTheDay(targetNode, new Date());
					var design: Array = [dutyList[0], dutyList[1]];
					var pipe: Array = [dutyList[2], dutyList[3]];
					var electric: Array = [dutyList[4], dutyList[5]];
					dust1Designing = design[0];
					dust1Pipe = pipe[0];
					dust1Electric = electric[0];
					dust2Designing = design[1];
					dust2Pipe = pipe[1];
					dust2Electric = electric[1];
					break;
				case "patrol":
					var today: Date = new Date();
					var todayDay: Number = today.day;
					var tue: Date;
					var thu: Date;
					//火曜
					switch(true)
					{
						case todayDay < 2:
							tue = new Date(today.fullYear, today.month, today.date + (2 - todayDay));
							break;
						case todayDay == 2:
							tue = today;
							break;
						case todayDay > 2:
							tue = new Date(today.fullYear, today.month, today.date - (todayDay - 2));
							break;
					}
					//木曜
					switch(true)
					{
						case todayDay < 4:
							thu = new Date(today.fullYear, today.month, today.date + (4 - todayDay));
							break;
						case todayDay == 4:
							thu = today;
							break;
						case todayDay > 4:
							thu = new Date(today.fullYear, today.month, today.date - (todayDay - 4));
							break;
					}
					var dutyList1: Array = _setDutyTheDay(targetNode, tue);
					patrol1Designing = dutyList1[0];
					patrol1Pipe = dutyList1[1];
					patrol1Electric = dutyList1[2];
					var dutyList2: Array = _setDutyTheDay(targetNode, thu);
					patrol2Designing = dutyList2[0];
					patrol2Pipe = dutyList2[1];
					patrol2Electric = dutyList2[2];
					break;
			}
		}
		private function _setDutyTheDay(xml: XML, date: Date): Array {
			if(xml == null || date == null)
			{
				return [];
			}
			var day: String = Lib.getYMDString(date);
			var node: XML = xml.day.(attribute("id") == day)[0];
			return node == null ? [] : [node.@design[0], node.@pipe[0], node.@electric[0]];
		}
		private function _setDutyDustTheDay(xml: XML, date: Date): Array {
			if(xml == null || date == null)
			{
				return [];
			}
			var day: String = Lib.getYMDString(date);
			var node: XML = xml.day.(attribute("id") == day)[0];
			return node == null ? [] : [node.@design1[0], node.@design2[0], node.@pipe1[0], node.@pipe2[0], node.@electric1[0], node.@electric2[0]];
		}
/*
		//設計担当者
		private function _setDesigningPerson(): void
		{
			var targetNode: XML = Config.configTree.config.kuraraySaijo.duty.designingPersonList[0];
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
			patrol1Designing = personArr[(todayNum + 4) % personArr.length];
			patrol2Designing = personArr[(todayNum + 5) % personArr.length];
		}
		private function _setPipePerson(): void
		{
			var targetNode: XML = Config.configTree.config.kuraraySaijo.duty.pipePersonList[0];
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
			patrol1Pipe = personArr[(todayNum + 4) % personArr.length];
			patrol2Pipe = personArr[(todayNum + 5) % personArr.length];
		}
		private function _setElectricPerson(): void
		{
			var targetNode: XML = Config.configTree.config.kuraraySaijo.duty.electricPersonList[0];
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
			patrol1Electric = personArr[(todayNum + 4) % personArr.length];
			patrol2Electric = personArr[(todayNum + 5) % personArr.length];
		}
*/
		private function _getReportDate(): Date
		{
			return new Date(Number(mxml.parent.parent.parent.parent.owner.ctrlr.year), Number(mxml.parent.parent.parent.parent.owner.ctrlr.month) - 1 , Number(mxml.parent.parent.parent.parent.owner.ctrlr.day));
		}

		//予定見出し日付セット
		private function _setScheduleHead(): void
		{
			scheduleHead = Lib.getDateString(_getReportDate()) + "の予定";
		}
		/*
		//欠勤書き換え
		private function _changeAbsenceHandler(evt: FocusEvent): void
		{
			_setTextValue("absenceList", evt.target.text);
		}
		//出張書き換え
		private function _changeTripHandler(evt: FocusEvent): void
		{
			_setTextValue("tripList", evt.target.text);
		}
		*/
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
/*
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
*/

		//本日の予定//連絡事項//欠勤//出張
		private function _setTextLabel(): void
		{
			absenceLabel = mxml.parent.parent.parent.parent.owner.ctrlr.myDataElement.elements("absenceList")[0].toString();//KuraraySaijoReport.absence
			tripLabel = mxml.parent.parent.parent.parent.owner.ctrlr.myDataElement.elements("tripList")[0].toString();//KuraraySaijoReport.trip
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
			_setDuty("morning");
			_setDuty("exercise");
			_setDuty("dust");
			_setDuty("patrol");
			//_setNoAccidentAllValue();
			//_setNoAccidentDeptValue();
			//_setDesigningPerson();
			//_setPipePerson();
			//_setElectricPerson();
		}

		//センサー情報
		public function PB_sensor(): void
		{
			var param: Object = PostBox.get("PB_sensor");
			var temperature: Number = param.data.temperature;
			var humidity: Number = param.data.humidity;
			var windSpeed: Number = param.data.windSpeed;
			var wbgtInfo: WarningInfo;
			var anemometerInfo: WarningInfo;

			var Yi: Number = 0.90739;
			var Xi: Number = 0.14775;
			var YXi: Number = -0.003665;
			var wbgt: Number = Yi * temperature + Xi * humidity + YXi * temperature * humidity;

			thermometerOutDoor = _formatedNumber(temperature);
			hygrometerOutDoor = _formatedNumber(humidity);
			WBGTOutDoor = _formatedNumber(wbgt);
			anemometer = _formatedNumber(windSpeed);

			noAccidentAll = param.data.recordAll;
			noAccidentDept = param.data.recordDept;
			//WBGT
			wbgtInfo = WBGTConfig.getWarning(wbgt);
			if(wbgtInfo != null)
			{
				mxml.WBGTAlertOutDoor.currentState = "level" + wbgtInfo.id;
				WBGTAlertOutDoor = wbgtInfo.label;
			}
			else
			{
				mxml.WBGTAlertOutDoor.currentState = "level0";
				WBGTAlertOutDoor = "";
			}

			//風速
			anemometerInfo = AnemometerConfig.getWarning(windSpeed);
			if(anemometerInfo != null)
			{
				mxml.anemometerAlert.currentState = "level" + anemometerInfo.id;
				anemometerAlert = anemometerInfo.label;
			}
			else
			{
				mxml.anemometerAlert.currentState = "level0";
				anemometerAlert = "";
			}
		}

		//小数点第一位の数値文字列に変換
		private function _formatedNumber(value: Number): String
		{
			var nf:NumberFormatter = new NumberFormatter();
			nf.fractionalDigits = 1;
			return nf.format(Math.round(value * 10) / 10);
		}

		//会議室情報
		public function PB_meetingroom(): void
		{
			var param: Object = PostBox.get("PB_meetingroom");
			var temperature: Number = param.data.room1;
			var humidity: Number = param.data.room2;

			mxml.MeetingRoomLamp1.currentState = param.data.room1 == 1 ? "use" : "empty";
			mxml.MeetingRoomLamp2.currentState = param.data.room2 == 1 ? "use" : "empty";
			mxml.MeetingRoomLamp3.currentState = param.data.room3 == 1 ? "use" : "empty";
			mxml.MeetingRoomLamp4.currentState = param.data.room4 == 1 ? "use" : "empty";
			mxml.MeetingRoomLamp5.currentState = param.data.room5 == 1 ? "use" : "empty";
		}
		//勤怠情報
		public function PB_person(): void
		{
			var param: Object = PostBox.get("PB_person");
			var tripList: Array = param.data[0];
			var absenceList: Array = param.data[1];
		//出張書き換え
			tripLabel = tripList.length > 0 ? tripList.join("\r") : "";
		//欠勤書き換え
			absenceLabel = absenceList.length > 0 ? absenceList.join("\r") : "";
		}
	}
}
