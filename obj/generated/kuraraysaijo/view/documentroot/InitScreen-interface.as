

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
import kuraraysaijo.controller.documentroot.InitScreen;
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
import spark.components.NavigatorContent;
import spark.core.SpriteVisualElement;
import spark.components.NavigatorContent;

public class InitScreen extends spark.components.NavigatorContent
{
	public function InitScreen() {}

	[Bindable]
	public var ctrlr : kuraraysaijo.controller.documentroot.InitScreen;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;
	[Bindable]
	public var panel : spark.components.Group;
	[Bindable]
	public var logo : spark.components.Group;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;

include "F:/git/KuraraySaijo/src/kuraraysaijo/view/documentroot/InitScreen.mxml:12,20";

}}
