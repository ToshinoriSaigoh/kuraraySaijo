package model.app
{
	import controller.*;

	public class ClientApp
	{
		public var clientType: String;
		public function ClientApp(app: App)
		{
			clientType = "client";
			//Global.define("clientType", this);
		}
	}
}
