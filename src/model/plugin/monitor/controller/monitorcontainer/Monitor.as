package model.plugin.monitor.controller.monitorcontainer
{
	import controller.App;
	import model.plugin.monitor.controller.MonitorContainer;
	import flash.geom.Rectangle;
	import flash.events.MouseEvent;
	public class Monitor extends VC
	{
		public var monitorName: String;
		public var styleName: String;

		private var _operation: String;//equal: 等, over: 超, orOver: 以上, under: 未満, orUnder: 以下
		private var _borderValue: Number;//しきい値
		public function Monitor()
		{
			//設定
			elementName = "Group";
			super();
		}

		//データ取得時の処理
		public function PB_IoTData(): void
		{
			//param.monitor//モニタ名
			//param.value//データ
			var param: Object = PostBox.get("PB_IoTData");
			if(monitorName != param.monitor) return;

			//データ表示
			mxml.text.text = param.value;

			//
			var __borderNum: Number = Number(Config.get("monitors", monitorName, "borderValue"));
			switch(_operation)
			{
				case "over":
					if(__borderNum < Number(param.value))
					{
						trace("■");
						/*
						var reportID: String = Lib.getDateTimeString();
						PostBox.send("addReport", {type: "emergency", emergency: "1", report: reportID});
						PostBox.end("sendEmergencyNotification", {type: "emergency", emergency: "1", report: reportID});
						*/
					}
					break;
				case "orOver":
					if(__borderNum <= Number(param.value))
					{

					}
					break;
				case "under":
					if(__borderNum > Number(param.value))
					{

					}
					break;
				case "orUnder":
					if(__borderNum >= Number(param.value))
					{

					}
					break;
				case "equal":
					if(__borderNum == Number(param.value))
					{

					}
					break;
			}
		}

		override protected function init(): void
		{
			vcName = String(mxml.id);
			monitorName = vcName;
			mxml.label.text = Config.get("monitors", monitorName, "label");
			mxml.text.text = Config.get("monitors", monitorName, "text");
			mxml.unit.text = Config.get("monitors", monitorName, "unit");
			mxml.width = Number(Config.get("monitors", monitorName, "width"));
			mxml.height = Number(Config.get("monitors", monitorName, "height"));

			_borderValue = Number(Config.get("monitors", monitorName, "borderValue"));
			_operation = Config.get("monitors", monitorName, "operation");

			switch(Config.get("monitors", monitorName, "horizontalAlign"))
			{
				case "right":
					mxml.right = Number(Config.get("monitors", monitorName, "x"));
					break;
				case "left":
				default:
					mxml.left = Number(Config.get("monitors", monitorName, "x"));
					break;
			}
			switch(Config.get("monitors", monitorName, "verticalAlign"))
			{
				case "bottom":
					mxml.bottom = Number(Config.get("monitors", monitorName, "y"));
					break;
				case "top":
				default:
					mxml.top = Number(Config.get("monitors", monitorName, "y"));
					break;
			}
			MonitorContainer.monitorCollection.addItem(this);
		}
	}
}
