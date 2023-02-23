package common.crypto
{
	/*
import common.crypto;
var blowfish: Blowfish = new Blowfish();

var text: String = "1234567890";
var enc: String = blowfish.encrypt( text );
trace(text);
trace(enc);
*/
	import flash.utils.ByteArray;
	import com.hurlant.crypto.Crypto;
	import com.hurlant.util.Hex;
	import com.hurlant.util.Base64;
	import com.hurlant.crypto.hash.*;
	import com.hurlant.crypto.symmetric.*;
	import com.hurlant.crypto.symmetric.ICipher;
	import com.hurlant.crypto.symmetric.IPad;
	import com.hurlant.crypto.symmetric.PKCS5;

	public class Blowfish
	{
		public var key: String = 'test';

		/**
		 * constructorz
		 * @param key 暗号鍵
		 */
		public function Blowfish(key: String = '')
		{
			this.key = key;
		}

		/**
		 * ECBを利用して平文を暗号化させます。
		 * @param txt 平文
		 * @return 暗号化された文字
		 */
		public function encrypt(txt: String):String
		{
			var type: String = 'blowfish-ecb';
			var key_: ByteArray = Hex.toArray(Hex.fromString(key));
			var data: ByteArray = Hex.toArray(Hex.fromString(txt));
			var pad: IPad = new PKCS5;
			var cipher: ICipher = Crypto.getCipher(type, key_, pad);
			pad.setBlockSize(cipher.getBlockSize());
			try
			{
				cipher.encrypt(data);
				return Base64.encodeByteArray(data);
			}
			catch(error:Error) {
				trace(error);
			}
			return null;
		}

		/**
		 * ECBを利用して暗号化された文字を復元させます。
		 * @param txt 暗号化された文字
		 * @return 平文
		 */
		public function decrypt(txt: String):String
		{
			var type: String = 'blowfish-ecb';
			var key_: ByteArray = Hex.toArray(Hex.fromString(key));
			var data: ByteArray = Base64.decodeToByteArray(txt);
			var pad: IPad = new PKCS5;
			var cipher: ICipher = Crypto.getCipher(type, key_, pad);
			pad.setBlockSize(cipher.getBlockSize());
			try
			{
				cipher.decrypt(data);
				return Hex.toString(Hex.fromArray(data));
			}
			catch(error:Error) {
				trace(error);
			}
			return null;
		}
	}
}