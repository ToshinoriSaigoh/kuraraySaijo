package kuraraysaijo.model.plugin.config
{
	import flash.filesystem.File;
	public class SensorConfig
	{
		private var _configClass: Class;
		private var _tagName: String;
		private var _fileName: String;
		private var _data: XML;
		private var _warningList: Array;
		public function SensorConfig(tagName: String, configClass: Class, fileName: String)
		{
			super();
			_tagName = tagName;
			_configClass = configClass;
			_fileName = fileName;
			_load();
		}

		//作成
		public function create(): XML
		{
			return XML(new _configClass());
		}

		//設定値読み込み
		private function _load(): void
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
			_convertToList();
			_save();
		}

		private function _convertToList(): void
		{
			var i: int;
			var info: WarningInfo;
			var typeXML: XML;
			var warningXMLList: XMLList;

			//一度リセット
			_warningList = [];

			//XMLListを取得
			typeXML = Config.configTree[_tagName][0];
			if(typeXML != null)
			{
				//XMLリストからWarningInfoを生成して保持
				warningXMLList = typeXML.warning[0].level;
				for(i = 0; i < warningXMLList.length(); i++)
				{
					info = new WarningInfo();
					info.loadFromXML(warningXMLList[i]);
					_warningList.push(info);
				}
			}
			_warningList.sort(sortByID);

			function sortByID(a: WarningInfo, b: WarningInfo): int
			{
				if(a == null && b == null) return 0;
				if(a != null && b == null) return -1;
				if(a == null && b != null) return 1;
				if(a.id < b.id) return -1;
				else if(a.id > b.id) return 1;
				return 0;
			}
		}

		//保存
		private function _save(): void
		{
			Config.saveConfigXML(_data, _fileName);
		}

		//警告情報取得
		public function getWarningByID(id: String): WarningInfo
		{
			var i:int;
			if(_warningList != null)
			{
				for(i = 0; i < _warningList.length; i++)
				{
					if(_warningList[i].id == id) return _warningList[i];
				}
			}
			return null;
		}

		//警告情報取得
		public function getWarning(value: Number): WarningInfo
		{
			var info: WarningInfo;
			var tmp: WarningInfo;
			var i:int;
			for(i = 0; i < _warningList.length; i++)
			{
				tmp = _warningList[i] as WarningInfo;
				if(tmp != null)
				{
					if(tmp.isInRange(value))
					{
						info = tmp;
						break;
					}
				}
			}
			return info;
		}

		//警告レベル指定で情報取得
		public function getWarningByLv(value: Number): WarningInfo
		{
			var info: WarningInfo;
			var tmp: WarningInfo;
			var i:int;
			for(i = 0; i < _warningList.length; i++)
			{
				tmp = _warningList[i] as WarningInfo;
				if(tmp != null)
				{
					if(tmp.id == String(value))
					{
						info = tmp;
						break;
					}
				}
			}
			return info;
		}
	}
}