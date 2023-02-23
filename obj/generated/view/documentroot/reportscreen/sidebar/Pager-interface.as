

package view.documentroot.reportscreen.sidebar
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
import spark.components.NavigatorContent;
import spark.components.Scroller;
import spark.core.SpriteVisualElement;
import view.documentroot.reportscreen.sidebar.PagerInnerClass0;
import spark.components.NavigatorContent;
import spark.components.Group;
import mx.core.IFactory;
import spark.layouts.BasicLayout;
import spark.layouts.VerticalLayout;

public class Pager extends spark.components.NavigatorContent
{
	public function Pager() {}

	[Bindable]
	public var topBox : spark.components.Group;
	[Bindable]
	public var addPageBtn : spark.components.Button;
	[Bindable]
	public var pageListBox : spark.components.Scroller;
	[Bindable]
	public var pageList : spark.components.DataGroup;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
