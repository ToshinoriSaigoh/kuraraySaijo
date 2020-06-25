package kuraraysaijo.model.plugin.config
{
	import common.PaddingUtils;
	import common.StringUtils;
	import common.csv.CSVLoader;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	//import flash.system.System;
	public class DutyConfig
	{
		private var _tagName: String;
		private var _fileName: String;
		private var _data: XML;
		private var _branchXML: XML;
		private var _csvLoader: CSVLoader;

		public function DutyConfig()
		{
			_tagName = "duty";
			_fileName = "duty.xml";
			_load();
			_csvLoader = new CSVLoader();
		}

		//xmlファイル読み込み
		public function _load(): void
		{
			var tree: XML = Config.loadConfigXML(_fileName);
			if(tree == null)
			{
				_data = <{_tagName}><morning/><exercise/><dust/><patrol/></{_tagName}>;
			}
			else
			{
				_data = tree;
			}
			Config.configTree.appendChild(_data);
		}

		//CSV取り込み
		public function importCSVFile(csvFile: File, branch: String): void
		{
			//System.useCodePage = true;//SJIS
			if(csvFile != null)
			{
				_branchXML = <{branch}/>;
				/*
				*/
				//_branchXML = <{branch}/>;//中身を空にする
				if(branch == "dust")
				{
					_importCSVFileDust(csvFile);
				}
				else
				{
					_importCSVFile(csvFile);
				}
				var existsData: XMLList = data.elements(branch);
				if(existsData.length() == 0)
				{
					data.appendChild(_branchXML);
				}
				else
				{
					//_branchXML = existsData[0];
					data.replace(branch, _branchXML);
				}
				
				_save();
			}
		}

		//CSV取り込み
		private function _importCSVFile(csvFile: File): void
		{
			//System.useCodePage = true;
			var csv: Array = _csvLoader.load(csvFile);
			var i: uint;
			var row: Array;
			var dayXML: XML;
			var node: XML;
			var date: String;
			var design: String;
			var pipe: String;
			var electric: String;
			var tmpList: Array = [];
			var tmpData: Object = {};
			var list: Array;
			for(i = 0; i < csv.length; i++)
			{
				row = csv[i];
				if(row.length >= 2 )
				{
					date = _validate(row[0]);
					design = row[1];
					pipe = row[2];
					electric = row[3];
					if(date != null)
					{
						if(tmpData.hasOwnProperty(date) == false)
						{
							tmpList.push(date);
						}
						tmpData[date] = [design, pipe, electric];
					}
				}
			}

			for(i = 0; i < tmpList.length; i++)
			{
				date = tmpList[i];
				dayXML = _search(date);
				node = <day id={date} design={tmpData[date][0]} pipe={tmpData[date][1]} electric={tmpData[date][2]}/>;
				if(dayXML == null)
				{
					_branchXML.appendChild(node);
					dayXML = _search(date);
				}
				else
				{
					dayXML = node;//ノード置き換え
				}
			}
		}
		//ゴミCSV取り込み
		private function _importCSVFileDust(csvFile: File): void
		{
			var csv: Array = _csvLoader.load(csvFile);
			var i: uint;
			var row: Array;
			var dayXML: XML;
			var node: XML;
			var date: String;
			var design: Array = [];
			var pipe: Array = [];
			var electric: Array = [];
			var tmpList: Array = [];
			var tmpData: Object = {};
			var list: Array;
			for(i = 0; i < csv.length; i++)
			{
				row = csv[i];
				if(row.length >= 2 )
				{
					date = _validate(row[0]);
					design = [row[1], row[2]];
					pipe = [row[3], row[4]];
					electric = [row[5], row[6]];
					if(date != null)
					{
						if(tmpData.hasOwnProperty(date) == false)
						{
							tmpList.push(date);
						}
						tmpData[date] = [design, pipe, electric];
					}
				}
			}

			for(i = 0; i < tmpList.length; i++)
			{
				date = tmpList[i];
				dayXML = _search(date);
				node = <day id={date} design1={tmpData[date][0][0]} design2={tmpData[date][0][1]} pipe1={tmpData[date][1][0]} pipe2={tmpData[date][1][1]} electric1={tmpData[date][2][0]} electric2={tmpData[date][2][1]}/>;
				if(dayXML == null)
				{
					_branchXML.appendChild(node);
					dayXML = _search(date);
				}
				else
				{
					dayXML = node;//ノード置き換え
				}
			}
		}

		//列１の日付からデータ検索
		public function _search(key: String): XML
		{
			var existsData: XMLList = _branchXML.day.(@id == key);
			if(existsData.length() > 0)
			{
				return existsData[0];
			}
			return null;
		}

		//xmlファイル保存
		public function _save(): void
		{
			Config.saveConfigXML(_data, _fileName);
		}

		//日付フォーマット
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

		//xmlデータへのアクセス
		public function get data(): XML
		{
			return _data;
		}


	}
}