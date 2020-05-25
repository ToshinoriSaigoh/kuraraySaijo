package kuraraysaijo.model.sensor
{
	import common.PaddingUtils;
	import common.StringUtils;
	import common.csv.CSVLoader;
	import common.EnterFrameProccess;
	import flash.filesystem.File;
	import flash.events.Event;
	import flash.utils.getTimer;
	import mx.utils.UIDUtil;

	public class PersonInfo extends Plug
	{
		private var _file: File;//読み込み対象ファイル
		private var _csvLoader: CSVLoader;//CSVローダー
		private static var _procKey: String;//エンターフレーム処理キー
		private static var _lastTime: int;//最後に確認した時間
		private static var _currentTime: int;//現在の時間
		private static var _inputInterval: int;//読み込みインターバル//ミリ秒

		public function PersonInfo()
		{
			super();
			_file = new File(Config.get("config", "kuraraySaijo", "person", "inputFile"));
			_csvLoader = new CSVLoader();
			_procKey = UIDUtil.createUID();;
			_currentTime = getTimer();
			_lastTime = 0;
			_inputInterval = int(Config.get("config", "kuraraySaijo", "person", "inputInterval"));
		}

		//制御
		public function PB_personCtrl(): void
		{
			var param: Object = PostBox.get("PB_personCtrl");
			switch(param.command)
			{
				case "start":
					EnterFrameProccess.start(_procKey, enterFrameHandler);
					break;
				case "stop":
					EnterFrameProccess.stop(_procKey);
					break;
				case "request":
					_update();
					break;
			}
		}

		//エンターフレーム処理ｃ
		private function enterFrameHandler(e: Event): void
		{
			_currentTime = getTimer();
			if(_currentTime - _lastTime >= _inputInterval)
			{
				_lastTime = _currentTime;
				_update();
			}
		}

		//センサー情報読み込み更新処理
/*SA0002.csv
Dレジスタ[部員ID]	CSV列名	ステータス	部員名	所属
0	[PLC]D00000000	【0：休み】【１：出社】【２：出張】	野田	設備技術部部長
1	[PLC]D00000001	【0：休み】【１：出社】【２：出張】	古賀	設計ＧＬ
2	[PLC]D00000002	【0：休み】【１：出社】【２：出張】	伊藤広	設計課員1
3	[PLC]D00000003	【0：休み】【１：出社】【２：出張】	兵頭	設計課員2
4	[PLC]D00000004	【0：休み】【１：出社】【２：出張】	宮崎	設計課員3
5	[PLC]D00000005	【0：休み】【１：出社】【２：出張】	森本	設計課員4
6	[PLC]D00000006	【0：休み】【１：出社】【２：出張】	酒井	設計課員5
7	[PLC]D00000007	【0：休み】【１：出社】【２：出張】	埴岡	設計課員6
8	[PLC]D00000008	【0：休み】【１：出社】【２：出張】	渡部健	設計課員7
9	[PLC]D00000009	【0：休み】【１：出社】【２：出張】	杉山	設計課員8
10	[PLC]D00000010	【0：休み】【１：出社】【２：出張】	中村	設計課員9

149	[PLC]D00000149	【0：休み】【１：出社】【２：出張】		電装課員49

*/
		private function _update(): void
		{
			var csv: Array = _csvLoader.load(_file);
			var i: int;
			var row: Array;
			var data: Object;
			if(csv == null) return;
			if(csv.length == 0) return;
			var personList: Array = [];
			var p: uint;
			for(i = 0; i < csv.length; i++)
			{
				row = csv[i];

				for(p = 0; p < row.length; p++)
				{
					if(i == 0)
					{
						personList[p] = [row[p]];
					}
					else
					{
						personList[p].push(row[p]);
					}
				}
			}
			var persons: XML = Config.configTree.persons[0];
			var person: XML;
			var tripList: Array = [];
			var absenceList: Array = [];
			for(p = 0; p < personList.length; p++)
			{
				switch(personList[p][1])
				{
					case "0":
						person = persons.person.(@id == personList[p][0])[0];
						if(person != null)
						{
							absenceList.push(person.@name);
						}
						break;
					case "2":
						person = persons.person.(@id == personList[p][0])[0];
						if(person != null)
						{
							tripList.push(person.@name);
						}
						break;
				}
			}
			PostBox.send("person", {data: [tripList, absenceList]});
		}
	}
}