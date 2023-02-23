

package view.documentroot.reportscreen.sidebar.pager
{
import controller.documentroot.reportscreen.sidebar.pager.CtrlBox;
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
import spark.components.Button;
import spark.components.DataGroup;
import spark.components.Group;
import spark.components.Scroller;
import spark.components.VGroup;
import spark.core.SpriteVisualElement;
import view.documentroot.reportscreen.sidebar.pager.CtrlBoxInnerClass0;
import spark.primitives.Rect;
import spark.components.Group;
import mx.states.State;
import mx.core.IFactory;
import mx.graphics.SolidColor;
import spark.layouts.VerticalLayout;

public class CtrlBox extends spark.components.Group
{
	public function CtrlBox() {}

	[Bindable]
	public var ctrlr : controller.documentroot.reportscreen.sidebar.pager.CtrlBox;
	[Bindable]
	public var thumbBox : spark.components.Button;
	[Bindable]
	public var layerBox : spark.components.VGroup;
	[Bindable]
	public var layerBoxFooter : spark.components.Group;
	[Bindable]
	public var addLayer : spark.components.Button;
	[Bindable]
	public var layerListBox : spark.components.Scroller;
	[Bindable]
	public var layerListData : spark.components.DataGroup;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
