package
{
	import spark.components.TextArea;
	public class Log
	{
		public static var logPanel: TextArea;

		//ログに追加する
		public static function trace(... args): void
		{
			if(logPanel == null) return;
			var val: String = "";
			var i: uint;
			for (i = 0; i < args.length; i++)
			{
				val += String(args[i]) + " ";
			}
			val += "\n";
			logPanel.appendText(val);
		}
	}
}
