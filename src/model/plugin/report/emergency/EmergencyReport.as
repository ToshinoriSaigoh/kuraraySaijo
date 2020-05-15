package model.plugin.report.emergency
{
	import common.*;
	import model.plugin.report.*;
	import model.plugin.draw.Draw;
	import mx.collections.ArrayCollection;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.utils.ByteArray;
	import mx.collections.ArrayCollection;
	public class EmergencyReport extends Report
	{
		public var emergencyType: String;//dir name
		public var emergencyReportType: String;//emergency or trouble

		public function EmergencyReport(parent: VC, reportType: String, reportID: String, dataElement: XML = null, type: String = "0", mode: String = null)
		{
			emergencyReportType = reportType;
			emergencyType = type;
			elementName = "EmergencyReport";

			var now: Date = new Date();
			var yearTxt: String = String(now.getFullYear());
			var monthTxt: String = String(now.getMonth() + 1);
			var dayTxt: String = String(now.getDate());
			var hourTxt: String = String(now.getHours());
			var minTxt: String = String(now.getMinutes());
			var secTxt: String = String(now.getSeconds());
			if(dataElement != null)
			{
				dataElement.@id = reportID;
				dataElement.@name = reportID;
				dataElement.@category = emergencyType;
				dataElement.@datetime =  yearTxt + "/" + monthTxt + "/" + dayTxt + " " + hourTxt + ":" + minTxt + ":" + secTxt;
			}
			super(parent, reportID, dataElement, "emergency", mode);
		}

		override protected function createBody(): void
		{
			mxml = new EmergencyReportBody(this);
		}

		override public function creationComplete(): void
		{
			super.creationComplete();

			_mount();
			PostBox.send("changeReport", {report: id});
		}

		private function _mount(): void
		{
			var imageFile: File;
			var i: uint = 0;
			loadImage();
			function loadImage(): void
			{
				imageFile = Lib.getAppFileObject("emergency/" + emergencyType + "/" + i + ".png");
				ImageUtils.loadImage(imageFile, completeLoadImage, err, err);
			}
			function completeLoadImage(loader: Loader, bytes: ByteArray): void
			{
				i++;
				if(loader != null)
				{
					var bmp: Bitmap;
					var bmpData: BitmapData = ImageUtils.cloneImage(loader);
					if(bmpData != null)
					{
						bmp = new Bitmap(bmpData);
						bmp.smoothing = true;
						ImageUtils.unloadImage(loader);
						//pageCollection.source[i - 1].drawLayers[0].body.cacheAsBitmap = false;
						pageCollection.source[i - 1].drawLayers[0].body.addChildAt(bmp, 0);
						//pageCollection.source[i - 1].drawLayers[0].body.cacheAsBitmap = false;
						bmp.x = 200;
						bmp.y = 140;
					}
				}
				if(i < pageCollection.source.length) loadImage();
			}
			function err(): void
			{
				i++;
				if(i < pageCollection.source.length) loadImage();
			}
		}

	}
}
