

package model.plugin.report.emergency.view
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
import model.plugin.report.emergency.EmergencyHeader;
import model.plugin.report.emergency.view.EmergencyHeaderInnerClass0;
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
import spark.components.DataGroup;
import spark.components.Group;
import spark.components.Label;
import spark.layouts.TileLayout;
import spark.components.Group;
import mx.core.IFactory;

public class EmergencyHeader extends spark.components.Group
{
	public function EmergencyHeader() {}

	[Bindable]
	public var ctrlr : model.plugin.report.emergency.EmergencyHeader;
	[Bindable]
	public var emergencyHeadMenu : spark.components.Group;
	[Bindable]
	public var datetime : spark.components.Label;
	[Bindable]
	public var title : spark.components.Label;
	[Bindable]
	public var menu : spark.components.Group;
	[Bindable]
	public var menuList : spark.components.DataGroup;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
