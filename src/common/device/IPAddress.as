package common.device
{
	import flash.net.InterfaceAddress;
	import flash.net.NetworkInfo;
	import flash.net.NetworkInterface;

	public class IPAddress
	{
		public static function getActiveIPv4Address(): Array
		{
			var networkInfo: NetworkInfo = NetworkInfo.networkInfo;
			var interfaces: Vector.<NetworkInterface> = networkInfo.findInterfaces();
			var res: Array = [];
			if(interfaces != null)
			{
				for each(var interfaceObj: NetworkInterface in interfaces)
				{
					if(interfaceObj.active)
					{
						for each(var address: InterfaceAddress in interfaceObj.addresses)
						{
							if(address.ipVersion.toLowerCase() == "ipv4" && _isLinkLocalAddressIPv4(address.address) == false)
							{
								res.push(address.address);
							}
						}
					}
				}
			}
			return res;
		}

		private static function _isLinkLocalAddressIPv4(address: String): Boolean
		{
			var list: Array = address.split(".");
			if(list.length >= 2)
			{
				if(list[0] == "169" && list[1] == "254")
				{
					return true;
				}
			}
			return false;
		}
	}
}

