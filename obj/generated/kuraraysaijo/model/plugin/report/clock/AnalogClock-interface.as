

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
import kuraraysaijo.model.plugin.report.clock.AnalogClockCtrl;
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
import spark.core.SpriteVisualElement;
import spark.components.Group;

public class AnalogClock extends spark.components.Group
{
	public function AnalogClock() {}

	[Bindable]
	public var ctrlr : kuraraysaijo.model.plugin.report.clock.AnalogClockCtrl;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;
	[Bindable]
	public var bg : spark.components.Group;
	[Bindable]
	public var hHandContainer : spark.components.Group;
	[Bindable]
	public var hHand : spark.components.Group;
	[Bindable]
	public var mHandContainer : spark.components.Group;
	[Bindable]
	public var mHand : spark.components.Group;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;

include "F:/git/KuraraySaijo/src/kuraraysaijo/model/plugin/report/clock/AnalogClock.mxml:12,26";

}}
