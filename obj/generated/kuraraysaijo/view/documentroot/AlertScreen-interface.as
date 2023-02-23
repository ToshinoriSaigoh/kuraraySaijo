

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
import kuraraysaijo.controller.documentroot.AlertScreen;
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
import spark.components.TextArea;
import spark.core.SpriteVisualElement;
import spark.primitives.Rect;
import spark.components.Group;
import mx.graphics.SolidColorStroke;
import mx.graphics.SolidColor;

public class AlertScreen extends spark.components.Group
{
	public function AlertScreen() {}

	[Bindable]
	public var ctrlr : kuraraysaijo.controller.documentroot.AlertScreen;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;
	[Bindable]
	public var headLabel : spark.components.Label;
	[Bindable]
	public var textarea : spark.components.TextArea;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
