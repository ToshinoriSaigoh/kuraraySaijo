package common
{
	public class DateUtils
	{
		//日付比較
		//a == b :  0
		//a <  b :  1
		//a >  b : -1
		public static function compare(a: Date, b: Date): int
		{
			if(a == null && b != null)
			{
				return 1;
			}
			if(a != null && b == null)
			{
				return -1;
			}
			if(a.getTime() < b.getTime())
			{
				return 1;
			}
			if(a.getTime() > b.getTime())
			{
				return -1;
			}
			return 0;
		}
	}
}