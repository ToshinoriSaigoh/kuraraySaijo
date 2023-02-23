

package kuraraysaijo.view.documentroot
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
import kuraraysaijo.controller.documentroot.ReportScreen;
import kuraraysaijo.view.documentroot.reportscreen.DrawContents;
import kuraraysaijo.view.documentroot.reportscreen.SideBar;
import model.plugin.report.emergency.view.EmergencyHeader;
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
import spark.components.NavigatorContent;
import spark.core.SpriteVisualElement;
import view.documentroot.reportscreen.PalletContainer;
import spark.components.NavigatorContent;

public class ReportScreen extends spark.components.NavigatorContent
{
	public function ReportScreen() {}

	[Bindable]
	public var ctrlr : kuraraysaijo.controller.documentroot.ReportScreen;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;
	[Bindable]
	public var drawContents : kuraraysaijo.view.documentroot.reportscreen.DrawContents;
	[Bindable]
	public var EmergencyHeader : model.plugin.report.emergency.view.EmergencyHeader;
	[Bindable]
	public var sideBar : kuraraysaijo.view.documentroot.reportscreen.SideBar;
	[Bindable]
	public var palletContainer : view.documentroot.reportscreen.PalletContainer;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
