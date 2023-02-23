/*
画像共有通信処理



*/
package model.app.network
{
	import model.plugin.report.*;
	import model.plugin.network.channel.*;
	import model.plugin.network.clusterdata.*;
	import model.plugin.network.clusterdata.data.*;
	import model.plugin.network.clusterdata.sender.*;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.net.FileFilter;
	import flash.utils.ByteArray;
	import flash.errors.IOError;

	public class ShareImage extends Plug
	{
		public function ShareImage()
		{
			super();
		}

		//レポート共有
		public function PB_shareImage(): void
		{
			var param: Object = PostBox.get("PB_shareImage");
			var targetList: Array = null;

			//オナーの場合はそのまま全員へ送信
			if(Channel.members.isOwner(Global.get("currentChannelName")))
			{
				targetList = ["@" + Global.get("currentChannelName")];
			}
			//オーナーではない場合、まずオーナーに送信
			else
			{
				//オーナーIDを取得
				var ownerID: String = Channel.members.getOwnerID(Global.get("currentChannelName"));
				if(ownerID != null) targetList = [ownerID + "@" + Global.get("currentChannelName")];
			}

			//現在の状態を一時ディレクトリに保存
			if(targetList != null)
			{
				param.option.type = "image";
				param.option.author = Channel.myID;

				_sendClusterData(param.option.id, targetList, param.bytes, param.option);
			}
		}

		//クラスタ化データ送信
		private function _sendClusterData(stockKey: String, targetList: Array, bytes: ByteArray, option: Object): void
		{
			var inst: Object;
			inst = {};
			inst.action = "regist";
			inst.stockKey  = stockKey;
			inst.bytes = bytes;
			inst.separateBytes = ChannelManager.separateBytes;
			inst.option = option;
			ClusterDataSender.setInstruction(inst);

			inst = {};
			inst.action = "send";
			inst.sendType = SequentialMethod.TYPE;
			inst.stockKeyList = [stockKey];
			inst.targetList = targetList;
			inst.delayForTarget = ChannelManager.sendDataDelayTime;
			inst.delayForData = ChannelManager.sendDataDelayTime;
			ClusterDataSender.setInstruction(inst);
		}

		//クラスタ化データ受信
		public function PB_receivedClusterData(): void
		{
			var param: Object = PostBox.get("PB_receivedClusterData");
			var clusterData: ClusterData = param.data as ClusterData;
			var file: File;

			//画像受信
			if(clusterData.option.type == "image")
			{
				var page: Page;
				if(clusterData.option.author != Channel.myID)
				{
					//画像ファイルを保存
					page = ReportUtils.getPagePanel(clusterData.option.report, clusterData.option.panel);
					if(page != null)
					{
						file = page.getOwnDirectory().resolvePath(clusterData.option.id + ".image");//m2ok 通信のタイミングなどによってdrawPanelが無いということはないか？
						_save(file, clusterData.getByteArray());
					}
					else
					{
						trace("ERROR Page not found. at PB_receivedClusterData");
					}

					//描画共有データDrawツールへの引き渡し
					PostBox.send("receiveShareDraw", clusterData.option);
				}

				//オーナーは全員に送信
				if(Channel.members.isOwner(Global.get("currentChannelName")))
				{
					_sendClusterData(
						clusterData.option.id,
						["@" + Global.get("currentChannelName")],
						clusterData.getByteArray(),
						clusterData.option
					);
				}
			}
		}

		private function _save(file: File, bytes: ByteArray): void
		{
			var stream: FileStream = new FileStream();
			try
			{
				stream.open(file, FileMode.WRITE);
				stream.writeBytes(bytes);
				stream.close();
			}
			catch(ioError: IOError){}
			catch(securityError: SecurityError){}
		}
	}
}