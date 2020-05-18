package common
{
	import flash.text.TextField;
	import flash.text.TextFieldType;

	public class TextFieldUtils
	{
		public static function setText(textField: TextField, txt: String): void
		{
			if(textField != null)
			{
				if(CommonUtils.isEmptyString(txt) == false)
				{
					textField.text = txt;
				}
				else
				{
					textField.text = "";
				}
			}
		}
	}
}