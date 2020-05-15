package kuraraysaijo.model.plugin.report
{
/**
 * レポート保存用クラス.
 * zip圧縮して保存する。
 *
 * update 2018/06/25
 * Since 2018/06/25
 * @private
 */
	import common.*;
	import common.db.DB;
	import model.plugin.draw.DrawPlayer;
	import model.plugin.report.Report;
	import model.plugin.report.Save;
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.data.SQLResult;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	public class KuraraySaijoSave extends Save
	{
		public function KuraraySaijoSave(report: Report)
		{
			super(report);
		}

		//zipに圧縮
		override public function saveZip(gwKey: String, saveFile: File = null, saveText: Boolean = true): void
		{
			var now: Date = new Date();
			var year: String = caller.myDataElement.@year;
			var month: String = caller.myDataElement.@month;
			var day: String = caller.myDataElement.@day;
			var zipUtil: ZipUtils = new ZipUtils();
			var zipFile: File = saveFile == null ? Lib.getAppFileObject(year + "/" + month + "/" + caller.id + ".zip") : saveFile;
			zipUtil.compressZip(caller.reportDir, zipFile, completeZip);
			function completeZip(): void
			{
				var filesXML: XML;
				var files: File = Lib.getAppFileObject(year + "/files.xml");
				//ファイルリスト
				StorageUtils.loadTextFile(files, createFileList);
				function createFileList(res: String, loadTxt: String): void
				{
					if(loadTxt != null)
					{
						filesXML = new XML(loadTxt);
						if(filesXML.month.(attribute("name") == month)[0] == null)
						{
							filesXML.appendChild(<month name={month}/>);
						}
						if(filesXML.month.(@name == month).day.(attribute("name") == day)[0] == null)
						{
							filesXML.month.(@name == month).appendChild(<day name={day}><files/></day>);
						}
					}
					else
					{
						filesXML =
							<year name={year}>
								<month name={month}>
									<day name={day}>
										<files/>
									</day>
								</month>
							</year>
					}
					var targetNode: XML = filesXML.month.(@name == month).day.(@name == day).files[0];
					if(saveText && targetNode.elements("file").(attribute("name") == caller.id)[0] == null)
					{
						targetNode.appendChild(
							<file name={caller.id}
								date={String(now.getFullYear()) + "/" + String(now.getMonth() + 1) + "/" + String(now.getDate()) + " " + String(now.getHours()) + ":" + String(now.getMinutes()) + ":" + String(now.getSeconds())}
								type={caller.reportType}/>);

						StorageUtils.saveTextFile(files, filesXML.toXMLString(), saveComplete, FileMode.WRITE);
					}
					else
					{
						saveComplete();
					}
					function saveComplete(): void
					{
						GroupWork.done(gwKey);
					}
				}
			}
		}
	}
}
