

package view.documentroot.reportscreen
{
import controller.documentroot.reportscreen.PalletContainer;
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
import view.documentroot.reportscreen.palletcontainer.ColorPallet;
import view.documentroot.reportscreen.palletcontainer.StampPallet;
import view.documentroot.reportscreen.palletcontainer.TimelinePallet;
import spark.components.Group;

public class PalletContainer extends spark.components.Group
{
	public function PalletContainer() {}

	[Bindable]
	public var ctrlr : controller.documentroot.reportscreen.PalletContainer;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;
	[Bindable]
	public var colorPallet : view.documentroot.reportscreen.palletcontainer.ColorPallet;
	[Bindable]
	public var stampPallet : view.documentroot.reportscreen.palletcontainer.StampPallet;
	[Bindable]
	public var timelinePallet : view.documentroot.reportscreen.palletcontainer.TimelinePallet;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
