package kuraraysaijo.model.plugin.config
{
	import common.PaddingUtils;
	import common.StringUtils;
	import common.csv.CSVLoader;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	//import flash.system.System;
	
	public class PersonConfig
	{
		private var _tagName: String;
		private var _fileName: String;
		private var _data: XML;
		private var _csvLoader: CSVLoader;
		public function PersonConfig()
		{
			super();
			_tagName = "persons";
			_fileName = "persons.xml";
			_load();
			_csvLoader = new CSVLoader();
		}

		//CSV取り込み
		public function importCSVFile(csvFile: File): void
		{
			if(csvFile != null)
			{
				_importCSV(csvFile);
				_save();
			}
		}

		//データへのアクセス
		public function get data(): XML
		{
			return _data;
		}

		//作成
		private function _create(): XML
		{
			return <{_tagName} />;
		}

		//検索
		private function _search(key: String): XML
		{
			var existsData: XMLList = data.day.(@id == key);
			if(existsData.length() > 0)
			{
				return existsData[0];
			}
			return null;
		}

		//読み込み
		private function _load(): void
		{
			var tree: XML = Config.loadConfigXML(_fileName);
			if(tree == null)
			{
				_data = _create();
			}
			else
			{
				_data = tree;
			}
			Config.configTree.appendChild(_data);
		}

		//保存
		private function _save(): void
		{
			Config.saveConfigXML(_data, _fileName);
		}

		//CSV取り込み
		private function _importCSV(csvFile: File): void
		{
			_data = _create();
			//System.useCodePage = true;
			var csv: Array = _csvLoader.load(csvFile);
			var i: uint;
			var row: Array;
			var xml: XML;
			var num: String;
			var enrollment: String;//在籍〇
			var name: String;
			var bizTitle: String;
			var bizCode: String;
			var tmpList: Array = [];
			var tmpData: Object = {};
			var list: Array;
			for(i = 0; i < csv.length; i++)
			{
				row = csv[i];
				if(row.length >= 2 )
				{
					num = row[0];
					bizCode = '[PLC]D' + padLeft(row[0], '0', 8);
					enrollment = row[1];
					name = row[2];
					bizTitle = row[3];
					if(enrollment == "○" || enrollment == "〇")
					{
						tmpData[num] = [bizCode, name, bizTitle];
						tmpList.push(num);
					}
				}
			}

			for(i = 0; i < tmpList.length; i++)
			{
				num = tmpList[i];
				bizCode = tmpData[num][0];
				name = tmpData[num][1];
				bizTitle = tmpData[num][2];
				xml = _search(num);
				if(xml == null)
				{
					data.appendChild(<person id={bizCode} num={num} name={name} title={bizTitle} />);
				}
			}

			var targetElement: XML = Config.configTree.persons[0];
			if(targetElement == null)
			{
				Config.configTree.appendChild(_data);
			}
			else
			{
				Config.configTree.replace("persons", _data);
			}

			PostBox.send("personCtrl", {command:"request"});
		}
		public function padLeft(value: String, padChar: String, length: uint):String {
			var s: String = value;
			while(s.length < length) {
				s = padChar + s;
			}
			return s;
		}
	}
}