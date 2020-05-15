package model.plugin.network.clusterdata.data
{
	import flash.utils.ByteArray;

	public class ClusterDataStock
	{
		private var _stock: Object;

		//コンストラクタ
		public function ClusterDataStock()
		{
			reset();
		}

		//ストックリセット
		public function reset(): void
		{
			var key: String;
			if(_stock != null)
			{
				for(key in _stock)
				{
					_stock[key].reset();
				}
			}
			_stock = {};
		}

		//ストック設定
		public function setClusterData(key: String, data: ClusterData): void
		{
			if(_stock.hasOwnProperty(key)) _stock[key].reset();
			_stock[key] = data;
		}

		//ストック取得
		public function getClusterData(key: String): ClusterData
		{
			if(_stock.hasOwnProperty(key)) return _stock[key];
			return null;
		}

		//登録(ByteArrayと分割サイズ、オプションで登録)
		public function regist(key: String, bytes: ByteArray, option: Object, separateBytes: uint): void
		{
			var data: ClusterData;
			if(bytes == null) return;
			if(_stock.hasOwnProperty(key))
			{
				data = _stock[key] as ClusterData;
				data.reset();
			}
			else
			{
				data = new ClusterData();
			}
			data.dataID    = key;
			data.option    = option;
			data.timestamp = new Date();
			data.setByteArray(bytes, separateBytes);
			_stock[key] = data;
		}

		//登録抹消
		public function remove(key: String): void
		{
			if(_stock.hasOwnProperty(key))
			{
				_stock[key].reset();
				delete _stock[key];
			}
		}

		//キーリスト
		public function get keyList(): Array
		{
			var list: Array = [];
			var key: String;
			for(key in _stock)
			{
				list.push(key);
			}
			return list;
		}
	}
}