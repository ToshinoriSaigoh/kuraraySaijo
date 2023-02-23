package controller
{
	public class Ctrlr extends VC
	{
		public function Ctrlr()
		{
			elementName = "common";
			super();
		}
		override protected function init(): void
		{
			vcName = mxml.hostComponent.id;
		}
	}
}
