package
{
	import common.*;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.errors.*;
	import flash.errors.IllegalOperationError;

	public class Config
	{
		public static const TEST_VERSION_FLAG: Boolean = false;//テストバージョンフラグ
		public static const TEST_VERSION: String = ".0";//テストバージョン
		public static const SERVER_DATA_DIRECTORY_NAME: String     = "KuraraySaijo";//アプリデータディレクトリ
		public static const SERVER_BASE: String = "http://localhost/";//サーバベースURL
		public static const BOARD_WIDTH: uint = 1920;//ボード幅
		public static const BOARD_HEIGHT: uint = 1080;//ボード高さ
		public static const IMAGE_DATA_EXTENSION: String = "img";//画像データ拡張子

		//色設定
		public static const COLOR_BLACK: uint                   = 0x000000;
		public static const COLOR_WHITE: uint                   = 0xffffff;
		public static const COLOR_RED: uint                     = 0xcc1111;
		public static const COLOR_BLUE: uint                    = 0x0a6ca7;
		public static const COLOR_YELLOW: uint                  = 0xe6dc48;
		public static const COLOR_WATER: uint                   = 0x58abdc;
		public static const COLOR_GREEN: uint                   = 0x13916b;
		public static const COLOR_PINK: uint                    = 0xc2749f;

		public static const COLOR_GREY: uint                    = 0xcccccc;
		public static const COLOR_LIGHTGREY: uint               = 0x888888;
		public static const COLOR_LIGHTRED: uint                = 0xf0cccc;
		public static const COLOR_LIGHTBLUE: uint               = 0xccccf0;
		public static const COLOR_LIGHTYELLOW: uint             = 0xf0f0cc;
		public static const COLOR_LIGHTWATER: uint              = 0xccddf0;
		public static const COLOR_LIGHTGREEN: uint              = 0xccf0cc;
		public static const COLOR_LIGHTPINK: uint               = 0xddccf0;

		public static const COLOR_BABY_PINK: uint               = 0xffcccc;
		public static const COLOR_LAVENDER: uint                = 0xccccff;
		public static const COLOR_LIGHTGOLDENRODYELLOW: uint    = 0xffffcc;
		public static const COLOR_LIGHTCYAN: uint               = 0xccffff;
		public static const COLOR_CORNSILK: uint                = 0xfff6cc;
		public static const COLOR_MAUVE: uint                   = 0xddccff;
		public static const COLOR_AAAA: uint                    = 0xccddff;

		//[Embed(source="./xml/dom.xml", mimeType="application/octet-stream")]
		//public static const DOM_XML_CLASS: Class;

		[Embed(source="./xml/messages.xml", mimeType="application/octet-stream")]
		public static const MESSAGES_XML_CLASS: Class;

		[Embed(source="./xml/config.xml", mimeType="application/octet-stream")]
		public static const CONFIG_XML_CLASS: Class;

		[Embed(source="./xml/text.xml", mimeType="application/octet-stream")]
		public static const TEXT_XML_CLASS: Class;

		public static var configTree: XML;
		public static var textTree: XML;

		private static var _myself: Config;
		private static var _internally: Boolean = false;

		public static var owner: Boolean = false;//仮設定オーナーフラグ


		public function Config()
		{
			configTree = <root></root>;
			_init();
			textTree = XML(new Config.TEXT_XML_CLASS());

			//------------------------------------START オーナーフラグ仮設定
			var file: File = Lib.getSystemFileObject("owner");
			owner = file.exists;
			//------------------------------------END
		}

		private static function _init(): void
		{
			configTree.appendChild(new XML(new Config.CONFIG_XML_CLASS()));
			updateFromXMLFile("config.xml");
			saveConfigXML(Config.configTree.config[0], "config.xml");
		}

		//C:にxmlファイルがあれば上書き//設定値上書き
		public static function updateFromXMLFile(fileName: String): void
		{
			var tree: XML = loadConfigXML(fileName);
			if(tree != null && tree.length() == 1)
			{
				var path: Array = [];
				__pickUpValue(tree);
			}

			function __pickUpValue(xml: XML): void
			{
				path.push(xml.name());
				if(xml.elements().length() > 0)
				{
					var children: XMLList = xml.elements();
					var i: uint;
					for(i = 0; i < children.length(); i++)
					{
						__pickUpValue(children[i]);
					}
				}
				else
				{
					_appendValue(path, xml.toString());
				}
				path.pop();
			}
		}
		//更新//elementPathに従ってvalueを子要素に登録する
		private static function _appendValue(elementPath: Array, value: String): void
		{
			var element: XML = configTree;
			var i: uint;
			if(elementPath.length < 1) return;
			for(i = 0; i < elementPath.length; i++)
			{
				if(element.elements(elementPath[i])[0] != null)
				{
					element = element.elements(elementPath[i])[0];
				}
				else
				{
					element = null;
					break;
				}
			}
			if(element != null) element.setChildren(value);
		}

		//設定ファイルの読み込み
		public static function loadConfigXML(fileName: String): XML
		{
			var file: File = Lib.getAppFileObject(fileName);
			var stream: FileStream;
			var xml: XML;
			if(file.exists)
			{
				try
				{
					stream = new FileStream();
					stream.open(file, FileMode.READ);
					stream.position = 0;
					//xml = stream.readUTFBytes(file.size) as XML;//xmlがnullになる
					xml = XML(stream.readUTFBytes(file.size));
					stream.close();
				}
				catch(ioError: IOError){trace("■ioError");}
				catch(securityError: SecurityError){trace("■securityError");}
				return xml;
			}
			return null;
		}

		//設定ファイルの保存
		public static function saveConfigXML(xml: XML, fileName: String): void
		{
			if(xml == null || xml.length() != 1) return;
			var file: File = Lib.getAppFileObject(fileName);
			var stream: FileStream = new FileStream();
			try
			{
				stream.open(file, FileMode.WRITE);
				stream.position = 0;
				stream.writeUTFBytes(xml.toXMLString());
				stream.close();
			}
			catch(ioError: IOError){}
			catch(securityError: SecurityError){}
		}


		//項目取得
		public static function get(...args: Array): String
		{
			var element: XML = configTree;
			var text: String;
			var i: uint;
			for(i = 0; i < args.length; i++)
			{
				if(element.elements(args[i])[0] != null)
				{
					element = element.elements(args[i])[0];
				}
				else
				{
					break;
				}
			}
			return element.toString();
		}

		//項目設定
		public static function set(...args: Array): void
		{
			var value: String;
			if(args.length >= 2)
			{
				value = String(args.pop());
				//args.unshift("config");
				_appendValue(args, value);
			}
		}

		public static function getText(...args: Array): String
		{
			var element: XML = textTree;
			var text: String;
			var i: uint;
			for(i = 0; i < args.length; i++)
			{
				if(element.elements(args[i])[0] != null)
				{
					element = element.elements(args[i])[0];
				}
				else
				{
					break;
				}
			}
			if(element.elements().length() > 0)
			{
				return "----";
			}
			else
			{
				return element.toString();
			}
		}
	}
}