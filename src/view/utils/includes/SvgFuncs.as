import flash.display.Sprite;
import mx.core.UIComponent;
import common.SVGUtils;
import spark.components.Group;
public function setSvg(Svg: Class, id: String = null): void
{
	/*
	貼り付け対象はGroupを継承したコンポーネントに限る
	*/
	var target: Group = (id != null) ? this[id] : this as Group;
	if(target == null)
	{
		trace("■ error ■ no Group, SvgFuncs.as");
		return;
	}
	var svgContainer: UIComponent = new UIComponent();
	var sprite: Sprite = SVGUtils.loadSVG(Svg);
	sprite = Lib.fittingSprite(target, sprite);
	svgContainer.addChild(sprite);
	target.addElement(svgContainer);
	target.mouseChildren = false;
}
