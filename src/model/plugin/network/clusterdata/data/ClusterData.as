package model.plugin.network.clusterdata.data
{
	import flash.utils.ByteArray;
	import common.ObjectUtils;

	public class ClusterData
	{
		//パーツ項目リスト
		private static const PARTS_ITEM_LIST: Array = ["dataID", "index", "length", "parts", "option", "timestamp"];

		private var _dataID: String;//データID
		private var _data: Array;//データ
		private var _option: Object;//オプションデータ
		private var _timestamp: Date;//タイムスタンプ

		//コンストラクタ
		function ClusterData(): void
		{
			reset();
		}

		//データリセット
		public function reset(): void
		{
			_dataID     = null;
			_data       = null;
			_option     = null;
			_timestamp  = null;
		}


		//パーツデータ有効判定
		public static function validPartsData(partsData: Object): Boolean
		{
			if(ObjectUtils.hasOwnPropertyInList(partsData, PARTS_ITEM_LIST))
			{
				return true;
			}
			return false;
		}

		//ID設定
		public function set dataID(value: String): void
		{
			_dataID = value;
		}

		//ID取得
		public function get dataID(): String
		{
			return _dataID;
		}

		//オプション設定
		public function set option(value: Object): void
		{
			_option = value;
		}

		//オプション取得
		public function get option(): Object
		{
			return _option;
		}

		//タイムスタンプ設定
		public function set timestamp(value: Date): void
		{
			_timestamp = value;
		}

		//タイムスタンプ取得
		public function get timestamp(): Date
		{
			return _timestamp;
		}

		//データ数設定
		public function setDataNum(num: uint): void
		{
			var end: uint;
			var i: uint;
			if(_data == null)
			{
				_data = new Array();
			}
			if(num > _data.length)
			{
				end = num - _data.length;
				for(i=0; i<end; ++i)
				{
					_data.push(null);
				}
			}
		}

		//データ設定
		public function setData(index: uint, bytes: ByteArray): void
		{
			setDataNum(index + 1);
			if(index < _data.length)
			{
				_data[index] = bytes;
			}
		}

		//データ取得
		public function getData(index: uint): ByteArray
		{
			if(_data != null)
			{
				if(index >= 0 && index < _data.length)
				{
					return _data[index] as ByteArray;
				}
			}
			return null;
		}

		//データ数取得
		public function get length(): uint
		{
			if(_data != null)
			{
				return _data.length;
			}
			return 0;
		}

		//トータルバイト数取得
		public function get totalBytes(): uint
		{
			var i: uint;
			var res: uint;
			var parts: ByteArray;

			res = 0;
			if(_data != null)
			{
				for(i=0; i < _data.length; ++i)
				{
					parts = _data[i] as ByteArray;
					if(parts != null)
					{
						res += parts.length;
					}
				}
			}
			return res;
		}

		//データが全て揃っているかどうかを取得
		public function isComplete(): Boolean
		{
			var index: uint;
			var res: Boolean;

			res = false;
			if(_data != null)
			{
				index = getEmptyIndex();
				if(_data.length == index || _data.length == 0)
				{
					res = true;
				}
			}
			return res;
		}

		//空データINDEX取得
		//データが全て揃っている場合はデータ長が返る
		public function getEmptyIndex(): uint
		{
			var i: uint;
			var parts: ByteArray;

			if(_data != null)
			{
				for(i=0; i < _data.length; ++i)
				{
					parts = _data[i] as ByteArray;
					if(parts == null)
					{
						return i;
					}
				}
				return _data.length;
			}
			return 0;
		}

		//データ設定
		public function setByteArray(bytes: ByteArray, sepBytes: uint): void
		{
			var i: uint;
			var _dataNum: uint;
			var remnant: uint;
			var parts: ByteArray;

			_data = new Array();

			if(bytes != null && sepBytes > 0)
			{
				//データ分割数
				_dataNum = Math.ceil(bytes.length / sepBytes);
				remnant = bytes.length % sepBytes;

				for(i=0; i < _dataNum; ++i)
				{
					bytes.position = i * sepBytes;

					parts = new ByteArray();
					parts.position = 0;
					if((_dataNum - 1) == i)
					{
						bytes.readBytes(parts, 0, remnant);
					}
					else
					{
						bytes.readBytes(parts, 0, sepBytes);
					}
					_data.push(parts);
				}
			}
		}

		//データ取得
		public function getByteArray(): ByteArray
		{
			var bytes: ByteArray;
			var parts: ByteArray;
			var i: uint;

			if(isComplete())
			{
				bytes = new ByteArray();
				bytes.position=0;
				for(i=0; i < _data.length; ++i)
				{
					parts = _data[i] as ByteArray;
					if(parts != null)
					{
						bytes.writeBytes(parts, 0, parts.length);
					}
				}
			}
			return bytes;
		}

		//データ作成
		public function createPartsData(index: uint): Object
		{
			var parts: ByteArray = getData(index);
			var partsData: Object = null;
			if(parts != null)
			{
				partsData = new Object();
				partsData.dataID      = dataID;
				partsData.index       = index;
				partsData.length      = length;
				partsData.parts       = parts;
				partsData.option      = _option;

				//タイムスタンプ
				if(_timestamp != null)
				{
					partsData.timestamp = _timestamp.getTime().toString();
				}
				else
				{
					partsData.timestamp = "0";
				}
			}
			return partsData;
		}

		//データ受け取り
		public function receivePartsData(partsData: Object): Boolean
		{
			if(validPartsData(partsData) == false) return false;
			_dataID   = partsData.dataID;
			setDataNum(partsData.length);
			setData(partsData.index, partsData.parts);
			_option = partsData.option
			_timestamp = new Date(Number(partsData.timestamp));
			return true;
		}
	}
}