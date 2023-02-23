package model.app.network
{
	import controller.documentroot.reportscreen.DrawContents;
	import model.plugin.draw.*;
	import model.plugin.report.*;
	import model.plugin.network.channel.*;

	public class ReportUtils
	{
		public static function getPagePanel(reportID: String, panelName: String): Page
		{
			var i: uint;
			var report: Report;
			for(i = 0; i < DrawContents.reportCollection.length; i++)
			{
				report = DrawContents.reportCollection.getItemAt(i) as Report;
				if(report.id == reportID)
				{
					return report.getPage(uint(panelName));
				}
			}
			return null;
		}
		public static function isOpendReport(reportID: String): Boolean
		{
			var i: uint;
			var report: Report;
			for(i = 0; i < DrawContents.reportCollection.length; i++)
			{
				report = DrawContents.reportCollection.getItemAt(i) as Report;
				if(report.id == reportID)
				{
					return true;
				}
			}
			return false;
		}
	}
}
