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
		public function SettingsKuraraySaijoContainer()
		{
			vcName = "settingsKuraraySaijoContainer";
			elementName = "NavigatorContent";
		}

		override protected function init(): void
		{
			//表示テキスト
			mxml.safetyHead.text = Config.getText("kuraraySaijo", "settings", "safety", "safetyHead");
			mxml.noAccidentHead.text = Config.getText("kuraraySaijo", "settings", "noAccident", "noAccidentHead");
			mxml.noAccidentTotal.text = Config.getText("kuraraySaijo", "settings", "noAccident", "noAccidentTotal");
			mxml.noAccidentStartDate.text = Config.getText("kuraraySaijo", "settings", "noAccident", "noAccidentStartDate");
			mxml.noAccidentTargetDate.text = Config.getText("kuraraySaijo", "settings", "noAccident", "noAccidentTargetDate");
			mxml.spotlessDrivingHead.text = Config.getText("kuraraySaijo", "settings", "spotlessDriving", "spotlessDrivingHead");
			mxml.spotlessDrivingTotal.text = Config.getText("kuraraySaijo", "settings", "spotlessDriving", "spotlessDrivingTotal");
			mxml.spotlessDrivingStartDate.text = Config.getText("kuraraySaijo", "settings", "spotlessDriving", "spotlessDrivingStartDate");
			mxml.spotlessDrivingTargetDate.text = Config.getText("kuraraySaijo", "settings", "spotlessDriving", "spotlessDrivingTargetDate");

			mxml.safetyPersonList.text = Config.getText("kuraraySaijo", "settings", "safety", "safetyPersonList");

			//休日・予定読み込みボタン
			mxml.importHolidayBtn.addEventListener(MouseEvent.CLICK, _importHolidayBtnClickHandler);
			mxml.importScheduleBtn.addEventListener(MouseEvent.CLICK, _importScheduleBtnClickHandler);

			//基準日セット
			baseDateText = Config.configTree.config.kuraraySaijo.safety.baseDate[0];
			//基準日設定ボタン
			mxml.setBaseDateBtn.addEventListener(MouseEvent.CLICK, _setBaseDateBtnClickHandler);
			//config.xml保存ボタン
			mxml.saveBtn.addEventListener(MouseEvent.CLICK, _saveBtnClickHandler);
			//設定値を反映
			_refreshConfigValue();
		}

		//今日を基準日に設定する
		private function _setBaseDateBtnClickHandler(e: MouseEvent): void
		{
			var date: Date = new Date();
			var year: String = date.getFullYear().toString();
			var month: String = Lib.digitNum(date.getMonth() + 1, 2);
			var day: String = Lib.digitNum(date.getDate(), 2);
			var today: String = year + "/" + month + "/" + day;

			var targetNode: XML = Config.configTree.config.kuraraySaijo.safety[0];
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

		//設定値Config._myTree: XMLを反映させる
		private function _refreshConfigValue(): void
		{
			/*
			var personNodes: XMLList = Config.configTree.config.kuraraySaijo.safety.safetyPersonList.person;
			var personText: String = "";
			var i: uint;
			for(i = 0; i < personNodes.length(); i++)
			{
			trace("■personNodes[i]■", personNodes[i]);
				personText+= personNodes[i] + "\n";
			}
			*/

			mxml.textAreaSafetyPersonList.text = Config.get("config", "kuraraySaijo", "safety", "safetyPersonList");

			mxml.inputNoAccidentTotal.text = Config.get("config", "kuraraySaijo", "noAccident", "noAccidentTotal");
			mxml.inputNoAccidentStartDate.text = Config.get("config", "kuraraySaijo", "noAccident", "noAccidentStartDate");
			mxml.inputNoAccidentTargetDate.text = Config.get("config", "kuraraySaijo", "noAccident", "noAccidentTargetDate");
			mxml.inputSpotlessDrivingTotal.text = Config.get("config", "kuraraySaijo", "spotlessDriving", "spotlessDrivingTotal");
			mxml.inputSpotlessDrivingStartDate.text = Config.get("config", "kuraraySaijo", "spotlessDriving", "spotlessDrivingStartDate");
			mxml.inputSpotlessDrivingTargetDate.text = Config.get("config", "kuraraySaijo", "spotlessDriving", "spotlessDrivingTargetDate");
			//Config.saveConfigXML(Config.configTree.config[0], "config.xml");
		}
		//保存ボタン処理
		private function _saveBtnClickHandler(e: MouseEvent): void
		{
			//安全担当者
			Config.set("config", "kuraraySaijo", "safety", "safetyPersonList", mxml.textAreaSafetyPersonList.text);

			Config.set("config", "kuraraySaijo", "noAccident", "noAccidentTotal", mxml.inputNoAccidentTotal.text);
			Config.set("config", "kuraraySaijo", "noAccident", "noAccidentStartDate", mxml.inputNoAccidentStartDate.text);
			Config.set("config", "kuraraySaijo", "noAccident", "noAccidentTargetDate", mxml.inputNoAccidentTargetDate.text);
			Config.set("config", "kuraraySaijo", "spotlessDriving", "spotlessDrivingTotal", mxml.inputSpotlessDrivingTotal.text);
			Config.set("config", "kuraraySaijo", "spotlessDriving", "spotlessDrivingStartDate", mxml.inputSpotlessDrivingStartDate.text);
			Config.set("config", "kuraraySaijo", "spotlessDriving", "spotlessDrivingTargetDate", mxml.inputSpotlessDrivingTargetDate.text);
			Config.saveConfigXML(Config.configTree.config[0], "config.xml");
			PostBox.send("refreshSettings");
		}

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
