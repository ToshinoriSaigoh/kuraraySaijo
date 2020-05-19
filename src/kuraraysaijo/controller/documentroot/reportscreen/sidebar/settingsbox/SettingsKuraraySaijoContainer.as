package kuraraysaijo.controller.documentroot.reportscreen.sidebar.settingsbox
{
	import kuraraysaijo.model.plugin.config.*;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.net.FileFilter;
	import mx.events.FlexEvent;

	public class SettingsKuraraySaijoContainer extends VC
	{
		[Bindable]
		public var baseDateText: String;
		private var _personConfig: PersonConfig;
		public function SettingsKuraraySaijoContainer()
		{
			vcName = "settingsKuraraySaijoContainer";
			elementName = "NavigatorContent";
			_personConfig = new PersonConfig();
		}

		override protected function init(): void
		{
			//表示テキスト
			mxml.scheduleHead.text = Config.getText("kuraraySaijo", "settings", "schedule", "scheduleHead");
			mxml.dutyHead.text = Config.getText("kuraraySaijo", "settings", "duty", "dutyHead");
			mxml.attendanceHead.text = Config.getText("kuraraySaijo", "settings", "person", "attendanceHead");
			mxml.personHead.text = Config.getText("kuraraySaijo", "settings", "person", "personHead");
/*
			mxml.noAccidentAllHead.text = Config.getText("kuraraySaijo", "settings", "noAccidentAll", "noAccidentAllHead");
			mxml.noAccidentAllTotal.text = Config.getText("kuraraySaijo", "settings", "noAccidentAll", "noAccidentAllTotal");
			mxml.noAccidentAllStartDate.text = Config.getText("kuraraySaijo", "settings", "noAccidentAll", "noAccidentAllStartDate");

			mxml.noAccidentDeptHead.text = Config.getText("kuraraySaijo", "settings", "noAccidentDept", "noAccidentDeptHead");
			mxml.noAccidentDeptTotal.text = Config.getText("kuraraySaijo", "settings", "noAccidentDept", "noAccidentDeptTotal");
			mxml.noAccidentDeptStartDate.text = Config.getText("kuraraySaijo", "settings", "noAccidentDept", "noAccidentDeptStartDate");
			//担当見出し
			mxml.designingPersonList.text = Config.getText("kuraraySaijo", "settings", "duty", "designingPersonList");
			mxml.pipePersonList.text = Config.getText("kuraraySaijo", "settings", "duty", "pipePersonList");
			mxml.electricPersonList.text = Config.getText("kuraraySaijo", "settings", "duty", "electricPersonList");
*/

			//休日・予定読み込みボタン
			mxml.importHolidayBtn.addEventListener(MouseEvent.CLICK, _importHolidayBtnClickHandler);
			mxml.importScheduleBtn.addEventListener(MouseEvent.CLICK, _importScheduleBtnClickHandler);
			//担当読み込みボタン
			mxml.importMorningBtn.addEventListener(MouseEvent.CLICK, _importMorningBtnClickHandler);
			mxml.importExerciseBtn.addEventListener(MouseEvent.CLICK, _importExerciseBtnClickHandler);
			mxml.importDustBtn.addEventListener(MouseEvent.CLICK, _importDustBtnClickHandler);
			mxml.importPatrolBtn.addEventListener(MouseEvent.CLICK, _importPatrolBtnClickHandler);
			//勤怠管理.csv読込ボタン
			mxml.setAttendanceBtn.addEventListener(MouseEvent.CLICK, _setAttendanceBtnClickHandler);



			//基準日セット
			//baseDateText = Config.configTree.config.kuraraySaijo.duty.baseDate[0];
			//基準日設定ボタン
			//mxml.setBaseDateBtn.addEventListener(MouseEvent.CLICK, _setBaseDateBtnClickHandler);

			//config.xml保存ボタン
			//mxml.saveBtn.addEventListener(MouseEvent.CLICK, _saveBtnClickHandler);
			//設定値を反映
			_refreshConfigValue();
		}

		/*
		//今日を担当順の基準日に設定する
		private function _setBaseDateBtnClickHandler(e: MouseEvent): void
		{
			var date: Date = new Date();
			var year: String = date.getFullYear().toString();
			var month: String = Lib.digitNum(date.getMonth() + 1, 2);
			var day: String = Lib.digitNum(date.getDate(), 2);
			var today: String = year + "/" + month + "/" + day;

			var targetNode: XML = Config.configTree.config.kuraraySaijo.duty[0];
			if(targetNode.baseDate != null)
			{
				targetNode.baseDate = today;
			}
			else
			{
				targetNode.appendChild(<baseDate>{today}</baseDate>);
			}
			Config.saveConfigXML(Config.configTree.config[0], "config.xml");

			baseDateText = today;

			PostBox.send("refreshSettings");
		}
		*/
		//設定値Config._myTree: XMLを反映させる
		private function _refreshConfigValue(): void
		{

			/*
			mxml.textAreaDesigningPersonList.text = Config.get("config", "kuraraySaijo", "duty", "designingPersonList");
			mxml.textAreaPipePersonList.text = Config.get("config", "kuraraySaijo", "duty", "pipePersonList");
			mxml.textAreaElectricPersonList.text = Config.get("config", "kuraraySaijo", "duty", "electricPersonList");
			mxml.inputNoAccidentAllTotal.text = Config.get("config", "kuraraySaijo", "noAccidentAll", "noAccidentTotal");
			mxml.inputNoAccidentAllStartDate.text = Config.get("config", "kuraraySaijo", "noAccidentAll", "noAccidentStartDate");
			mxml.inputNoAccidentDeptTotal.text = Config.get("config", "kuraraySaijo", "noAccidentDept", "noAccidentTotal");
			mxml.inputNoAccidentDeptStartDate.text = Config.get("config", "kuraraySaijo", "noAccidentDept", "noAccidentStartDate");
			*/
		}
		//保存ボタン処理
		/*
		private function _saveBtnClickHandler(e: MouseEvent): void
		{
			//担当者
			Config.set("config", "kuraraySaijo", "duty", "designingPersonList", mxml.textAreaDesigningPersonList.text);
			Config.set("config", "kuraraySaijo", "duty", "pipePersonList", mxml.textAreaPipePersonList.text);
			Config.set("config", "kuraraySaijo", "duty", "electricPersonList", mxml.textAreaElectricPersonList.text);
			Config.set("config", "kuraraySaijo", "noAccidentAll", "noAccidentTotal", mxml.inputNoAccidentAllTotal.text);
			Config.set("config", "kuraraySaijo", "noAccidentAll", "noAccidentStartDate", mxml.inputNoAccidentAllStartDate.text);
			Config.set("config", "kuraraySaijo", "noAccidentDept", "noAccidentTotal", mxml.inputNoAccidentDeptTotal.text);
			Config.set("config", "kuraraySaijo", "noAccidentDept", "noAccidentStartDate", mxml.inputNoAccidentDeptStartDate.text);
			Config.saveConfigXML(Config.configTree.config[0], "config.xml");
			PostBox.send("refreshSettings");
		}
		*/

		//保存ボタン処理
		private function _importHolidayBtnClickHandler(evt: MouseEvent): void
		{
			_selectFile(__selectedHolidayFile);
			function __selectedHolidayFile(file: File): void
			{
				HolidayConfig.importCSVFile(file);
				PostBox.send("refreshCalendar");
			}
		}

		//保存ボタン処理
		private function _importScheduleBtnClickHandler(evt: MouseEvent): void
		{
			_selectFile(ScheduleConfig.importCSVFile);
		}

		//保存ボタン処理
		private function _importMorningBtnClickHandler(evt: MouseEvent): void
		{
			_selectFile(DutyConfig.importCSVFile);
		}
		//保存ボタン処理
		private function _importExerciseBtnClickHandler(evt: MouseEvent): void
		{
			_selectFile(DutyConfig.importCSVFile);
		}
		//保存ボタン処理
		private function _importDustBtnClickHandler(evt: MouseEvent): void
		{
			_selectFile(DutyConfig.importCSVFile);
		}
		//保存ボタン処理
		private function _importPatrolBtnClickHandler(evt: MouseEvent): void
		{
			_selectFile(DutyConfig.importCSVFile);
		}

		//勤怠管理.xlsを読み込む
		private function _setAttendanceBtnClickHandler(e: MouseEvent): void
		{
			_selectFile(__selectedAttendanceFile);
			function __selectedAttendanceFile(file: File): void
			{
				_personConfig.importCSVFile(file);
				PostBox.send("refreshSettings");
			}
		}

		private function _selectFile(cmpFnc: Function): void
		{
			var file: File = new File();
			var fileFilter: FileFilter;
			file.addEventListener( Event.SELECT , fileSelectHandler );
			fileFilter = new FileFilter("CSVファイル", "*.csv;*.CSV");
			file.browseForOpen( "開く", [fileFilter] );
			function fileSelectHandler(evt: Event): void
			{
				file.removeEventListener(Event.SELECT , fileSelectHandler);
				if( cmpFnc != null ) cmpFnc.call( null, file );
			}
		}
	}
}
