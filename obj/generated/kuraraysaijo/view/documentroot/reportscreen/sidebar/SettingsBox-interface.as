

package kuraraysaijo.view.documentroot.reportscreen.sidebar
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
import kuraraysaijo.controller.documentroot.reportscreen.sidebar.SettingsBox;
import kuraraysaijo.view.documentroot.reportscreen.sidebar.settingsbox.SettingsKuraraySaijoContainer;
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
import spark.components.Label;
import spark.components.NavigatorContent;
import spark.core.SpriteVisualElement;
import spark.components.NavigatorContent;
import spark.components.Group;
import spark.layouts.BasicLayout;

public class SettingsBox extends spark.components.NavigatorContent
{
	public function SettingsBox() {}

	[Bindable]
	public var ctrlr : kuraraysaijo.controller.documentroot.reportscreen.sidebar.SettingsBox;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;
	[Bindable]
	public var header : spark.components.Group;
	[Bindable]
	public var headerLabel : spark.components.Label;
	[Bindable]
	public var closeBtn : spark.components.Button;
	[Bindable]
	public var settingsViewStack : mx.containers.ViewStack;
	[Bindable]
	public var settingsKuraraySaijoContainer : kuraraysaijo.view.documentroot.reportscreen.sidebar.settingsbox.SettingsKuraraySaijoContainer;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
