package model.plugin.report
{
/**
 * DrawPanelを継承したページそのもの.
 * ページ作成完了後(creationComplete)レイヤーを作成する
 * createPageFile()でページ単体データをzipに圧縮できる
 *
 * update 2018/01/24
 * Since 2018/01/24
 * @private
 */
	import common.*;
	import model.plugin.report.*;
	import model.plugin.draw.*;
	import mx.collections.ArrayCollection;

	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.*;
	import flash.utils.ByteArray;
	import flash.data.SQLStatement;
	import flash.data.SQLResult;
	import flash.errors.SQLError;
	import flash.events.SQLErrorEvent;

	public class Page extends DrawPanel
	{
		[Bindable]
		public var id: uint;
		[Bindable]
		public var label: String;
		[Bindable]
		public var scale: Number;
		[Bindable]
		public var report: Report;

		public var activeLayer: DrawLayer;
		[Bindable]
		public var layerCollection: ArrayCollection;
		public var myDataElement: XML;

		public function Page(parent: VC, pageID: uint, dataElement: XML = null)
		{
			id = Report(parent).pageCollection.source.length;
			label = String(id + 1);
			vcName = String(pageID);
			elementName = "page";
			scale = 1.0;
			layerCollection = new ArrayCollection([]);

			report = parent as Report;
			super(parent, report.viewWidth, report.viewHeight);

			report.pageList[vcName] = this;
			Report(parent).pageCollection.addItemAt(this, id);

			if(dataElement == null)
			{
				myDataElement = <{elementName} id={vcName} name={vcName}><layer id="0" name="0"/><layer id="1" name="1"/></{elementName}>;
				caller.myDataElement.appendChild(myDataElement);
			}
			else
			{
				myDataElement = dataElement;
			}
		}
		public function creationComplete(): void
		{
			_createLayers();
		}

		//////////////////////////////////////////////////////
		private var _createdLayersNum: int;
		private function _createLayers(): void
		{
			var layerXMLList: XMLList = myDataElement.layer;
			var layer: Layer;
			var i: uint;
			if(layerXMLList != null)
			{
				_createdLayersNum = 0;
				for(i = 0; i < layerXMLList.length(); i++)
				{
					_addLayer(layerXMLList[i].@name, layerXMLList[i]);
				}
			}
		}
		//レイヤー作成完了ごとにレイヤーから呼び出す
		public function creationCompleteLayer(): void
		{
			var layerXMLList: XMLList = myDataElement.layer;
			if(layerXMLList != null)
			{
				_createdLayersNum++;
				if(layerXMLList.length() == _createdLayersNum)//全レイヤー作成完了時の処理
				{
					_createdLayersNum = 0;
					var targetLayer: Layer = layerCollection.getItemAt(0) as Layer;
					PostBox.send("changeLayer", {report: report.vcName, page: vcName, layer: targetLayer.vcName});
					//m2okアクティブなレポートであればChangePageを呼ぶ
					if(Draw.activeReport != null && Draw.activeReport.vcName == report.vcName) PostBox.send("changePage", {report: report.vcName, page: vcName});
					report.creationCompletePage();
				}
			}
		}
		//////////////////////////////////////////////////////

		public function setScale(val: Number): void
		{
			scale = val;
			body.scaleX = val;
			body.scaleY = val;
		}

		public function PB_addLayer(): void
		{
			var param: Object = PostBox.get("PB_addLayer");
			if(param.report != report.vcName) return;
			if(vcName != param.page) return;
			param.layer = String(getNewLayerID());
			PostBox.updateParams("addLayer", param);
			_addLayer(param.layer);
			//PostBox.send("changeLayer", {report: report.vcName, page: vcName, layer: param.layer});
		}

		public function PB_changeLayer(): void
		{
			var param: Object = PostBox.get("PB_changeLayer");
			if(report.vcName != param.report) return;
			if(vcName != param.page) return;
			var layerID: uint;
			if(param.layer == null)
			{
				var layerList: XMLList = myDataElement.layer;
				layerID = int(layerList[layerList.length() - 1].@name);
			}
			else
			{
				layerID = int(param.layer);
			}
			_changeLayer(layerID);
		}

		private function _addLayer(layerName: String = null, dataElement: XML = null): void
		{
			var layerID: uint = layerName == null ? getNewLayerID() : int(layerName);
			createLayer(String(layerID), dataElement);
		}

		//レイヤー作成
		protected function createLayer(layerName: String, dataElement: XML = null): void
		{
			new Layer(this, layerName, dataElement);
		}

		//対象レイヤー変更
		private function _changeLayer(layerID: uint): void
		{
			var targetLayer: Layer = layerCollection.getItemAt(layerCollection.length - layerID - 1) as Layer;
			activeLayer = targetLayer as DrawLayer;
			//targetLayer.body.cacheAsBitmap = false;
			targetLayer.visible = true;
		}
		//レイヤー表示切り替え
		public function PB_showLayer(): void
		{
			var param: Object = PostBox.get("PB_showLayer");
			if(param.report != report.vcName) return;
			if(param.page != vcName) return;
			var targetLayer: Layer = drawLayers[param.layer];
			switch(param.action)
			{
				case "show":
					targetLayer.visible = true;
					break;
				case "hide":
					targetLayer.visible = false;
					break;
				default:
					targetLayer.visible = targetLayer.visible ? false : true;
			}
		}

		//新レイヤーのID取得
		public function getNewLayerID(): uint
		{
			var layerXMLList: XMLList = myDataElement.layer;
			var layerLength: int = layerXMLList.length();
			return layerLength;
		}

		//ページデータ配信用//zipに圧縮
		public function createPageFile(compFunc: Function = null): void
		{
			_savePageData();
			var zipUtil: ZipUtils = new ZipUtils();
			var zipFile: File = report.reportDir.resolvePath(vcName + ".zip");
			zipUtil.compressZip(getOwnDirectory(), zipFile, completeZip);
			function completeZip(): void
			{
				if(compFunc != null) compFunc.call(null);
			}
		}
		private function _savePageData(): void
		{
			var drawData: Array = _getDrawData();
			var byte: ByteArray = new ByteArray();
			byte.writeObject(drawData);
			byte.position = 0;

			var pageFile: File = getOwnDirectory();
			pageFile = pageFile.resolvePath(vcName + ".data");
			var stream: FileStream = new FileStream();
			stream.open(pageFile, FileMode.WRITE);
			stream.writeBytes(byte, 0, byte.length);
			stream.close();
		}
		//DBからページデータを配列で取得する
		private function _getDrawData(): Array
		{
			report.reportDB.stmt = new SQLStatement();
			report.reportDB.stmt.sqlConnection = report.reportDB.dbConn;

			var drawDataArr: Array = [];
			var drawTableName: String = "draw";
			var selectSql: String =
				"SELECT id, firstTime, lastTime, author, target, operation, data FROM " + drawTableName +
				" WHERE target = :target;";
			report.reportDB.stmt.text = selectSql;

			report.reportDB.stmt.parameters[":target"] = vcName;
			report.reportDB.stmt.execute();
			try
			{
				var result: SQLResult = report.reportDB.stmt.getResult();
				var drawData: Object = {};
				if(result.data != null)
				{
					var n: int;
					for(n = 0; n < result.data.length; n++)
					{
						drawDataArr.push(result.data[n].data);
					}
				}
			}
			catch (error: SQLError)
			{
				trace("Error message: ", error.message);
				trace("Details: ", error.details);
			}
			return drawDataArr;
		}

		private function _uncompress(zipFile: File): void
		{
			//解凍先
			var pageDir: File = getOwnDirectory();
			//解凍するページと同名のフォルダがあれば消す

			if(pageDir.exists)
			{
				StorageUtils.deleteDirectory(pageDir, uncompress, true);
			}
			else
			{
				uncompress();
			}
			//解凍処理
			function uncompress(): void
			{
				var zipUtil: ZipUtils = new ZipUtils();
				zipUtil.uncompressZip(zipFile, pageDir, complete);
				function complete(): void
				{
					_loadPageFile(pageDir);
				}
			}
		}

		private function _loadPageFile(pageDir: File): void
		{
			var byte: ByteArray = new ByteArray();
			var stream: FileStream = new FileStream();
			stream.open(pageDir.resolvePath(vcName + ".data"), FileMode.READ);
			stream.position = 0;
			stream.readBytes(byte);
			stream.close();

			var drawDataArr: Object = byte.readObject();
			var i: uint;
			for(i = 0; i < drawDataArr.length; i++)
			{
				Draw.drawBuffer["simpleBuffer"][report.vcName][vcName].push(drawDataArr[i]);
			}
			PostBox.send("flushBuffer", {buffer: "simpleBuffer", report: report.vcName, page: vcName});
		}

	}
}
