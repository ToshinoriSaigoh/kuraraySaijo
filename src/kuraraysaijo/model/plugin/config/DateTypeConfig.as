package kuraraysaijo.model.plugin.config
{
	import common.PaddingUtils;
	import common.StringUtils;
	import common.csv.CSVLoader;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	//import flash.system.System;
	public class DateTypeConfig
	{
		private var _tagName: String;
		private var _fileName: String;
		private var _data: XML;
		private var _csvLoader: CSVLoader;

		public function DateTypeConfig(tagName: String, fileName: String)
		{
			_tagName = tagName;
			_fileName = fileName;
			load();
			_csvLoader = new CSVLoader();
		}

		//データへのアクセス
		public function get data(): XML
		{
			return _data;
		}

		//作成
		public function create(): XML
		{
			return <{_tagName} />;
		}

		//検索
		public function search(key: String): XML
		{
			var existsData: XMLList = data.day.(@id == key);
			if(existsData.length() > 0)
			{
				return existsData[0];
			}
			return null;
		}

		//読み込み
		public function load(): void
		{
			var tree: XML = Config.loadConfigXML(_fileName);
			if(tree == null)
			{
				_data = create();
			}
			else
			{
				_data = tree;
			}
			Config.configTree.appendChild(_data);
		}

		//保存
		public function save(): void
		{
			Config.saveConfigXML(_data, _fileName);
		}

		//CSV取り込み
		public function importCSVFile(csvFile: File): void
		{
			//System.useCodePage = true;//SJIS
			var csv: Array = _csvLoader.load(csvFile);
			var i: uint;
			var row: Array;
			var dayXML: XML;
			var date: String;
			var text: String;
			var tmpList: Array = [];
			var tmpData: Object = {};
			var list: Array;
			for(i = 0; i < csv.length; i++)
			{
				row = csv[i];
				if(row.length >= 2 )
				{
					date = _validate(row[0]);
					text = row[1];
					if(date != null)
					{
						if(tmpData.hasOwnProperty(date) == false)
						{
							tmpData[date] = [];
							tmpList.push(date);
						}
						tmpData[date].push(text);
					}
				}
			}

			for(i = 0; i < tmpList.length; i++)
			{
				date = tmpList[i];
				list = tmpData[date];
				text = list.join(StringUtils.LF);
				dayXML = search(date);
				if(dayXML == null)
				{
					data.appendChild(<day id={date} />);
					dayXML = search(date);
				}
				dayXML.setChildren(text);
			}
		}
		private function _validate(dateString: String): String
		{
			var result: String = null;
			var list: Array;
			var i: uint;
			if(dateString != null)
			{
				list = dateString.split("/");
				if(list.length >= 3)
				{
					result = "";
					result += PaddingUtils.zeroPaddingString(list[0], 4);
					result += "/";
					result += PaddingUtils.zeroPaddingString(list[1], 2);
					result += "/";
					result += PaddingUtils.zeroPaddingString(list[2], 2);
				}
			}
			return result;
		}
	}
}