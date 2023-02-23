

package kuraraysaijo.view
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
import kuraraysaijo.view.documentroot.AlertScreen;
import kuraraysaijo.view.documentroot.InitScreen;
import kuraraysaijo.view.documentroot.ReportScreen;
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
import spark.core.SpriteVisualElement;
import view.DocumentRoot;
import spark.components.Group;
import mx.states.State;
import view.DocumentRoot;
import view.states;
import spark.layouts.BasicLayout;

public class Client extends view.DocumentRoot
{
	public function Client() {}

	[Bindable]
	public var body : spark.core.SpriteVisualElement;
	[Bindable]
	public var rootViewStack : mx.containers.ViewStack;
	[Bindable]
	public var initScreen : kuraraysaijo.view.documentroot.InitScreen;
	[Bindable]
	public var reportScreen : kuraraysaijo.view.documentroot.ReportScreen;
	[Bindable]
	public var AlertScreen : kuraraysaijo.view.documentroot.AlertScreen;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;

include "F:/git/KuraraySaijo/src/kuraraysaijo/view/Client.mxml:8,10";

}}
