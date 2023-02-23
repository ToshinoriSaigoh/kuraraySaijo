

package kuraraysaijo.model.plugin.report.clock
{
import flash.accessibility.*;
import flash.data.*;
import flash.debugger.*;
import flash.desktop.*;
import flash.display.*;
import flash.errors.*;
import flash.events.*;
import flash.external.*;
import flash.filesystem.*;
import flash.geom.*;
import flash.html.*;
import flash.html.script.*;
import flash.media.*;
import flash.net.*;
import flash.printing.*;
import flash.profiler.*;
import flash.system.*;
import flash.text.*;
import flash.ui.*;
import flash.utils.*;
import flash.xml.*;
import kuraraysaijo.model.plugin.report.clock.DigitalClockCtrl;
import mx.binding.*;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromClass;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IDeferredInstance;
import mx.core.IFactory;
import mx.core.IFlexModuleFactory;
import mx.core.IPropertyChangeNotifier;
import mx.core.mx_internal;
import mx.filters.*;
import mx.styles.*;
import spark.components.Group;
import spark.components.Label;
import spark.core.SpriteVisualElement;
import spark.components.Group;
import spark.components.VGroup;

public class DigitalClock extends spark.components.Group
{
	public function DigitalClock() {}

	[Bindable]
	public var ctrlr : kuraraysaijo.model.plugin.report.clock.DigitalClockCtrl;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;
	[Bindable]
	public var date : spark.components.Label;
	[Bindable]
	public var time : spark.components.Label;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
