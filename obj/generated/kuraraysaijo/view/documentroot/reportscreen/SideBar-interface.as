

package kuraraysaijo.view.documentroot.reportscreen
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
import kuraraysaijo.controller.documentroot.reportscreen.SideBar;
import kuraraysaijo.view.documentroot.reportscreen.sidebar.SettingsBox;
import mx.binding.*;
import mx.containers.ViewStack;
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
import spark.components.Group;
import spark.components.HGroup;
import spark.components.NavigatorContent;
import spark.components.VGroup;
import spark.core.SpriteVisualElement;
import view.documentroot.reportscreen.sidebar.FileListBox;
import spark.primitives.Rect;
import spark.components.HGroup;
import mx.graphics.SolidColor;

public class SideBar extends spark.components.HGroup
{
	public function SideBar() {}

	[Bindable]
	public var ctrlr : kuraraysaijo.controller.documentroot.reportscreen.SideBar;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;
	[Bindable]
	public var mainToolBox : spark.components.Group;
	[Bindable]
	public var menuTop : spark.components.VGroup;
	[Bindable]
	public var toggleSideBarBtn : spark.components.Button;
	[Bindable]
	public var mainToolGroup : spark.components.VGroup;
	[Bindable]
	public var calendarBtn : spark.components.Button;
	[Bindable]
	public var changeModeBtn : spark.components.Button;
	[Bindable]
	public var settingsBtn : spark.components.Button;
	[Bindable]
	public var closeAppBtn : spark.components.Button;
	[Bindable]
	public var subToolBox : spark.components.Group;
	[Bindable]
	public var toolBoxContainer : mx.containers.ViewStack;
	[Bindable]
	public var none : spark.components.NavigatorContent;
	[Bindable]
	public var fileTool : view.documentroot.reportscreen.sidebar.FileListBox;
	[Bindable]
	public var settings : kuraraysaijo.view.documentroot.reportscreen.sidebar.SettingsBox;
	[Bindable]
	public var pagerViewStack : mx.containers.ViewStack;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
