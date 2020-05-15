package model.plugin.report.emergency
{
	import model.plugin.report.*;
	import model.plugin.report.emergency.view.*;
	import spark.components.Group;

	public class EmergencyReportBody extends ReportBody
	{
		public var emergencyTypeItem: EmergencyTypeItem;

		public function EmergencyReportBody(controller: VC)
		{
			super(controller);
		}
	}
}
