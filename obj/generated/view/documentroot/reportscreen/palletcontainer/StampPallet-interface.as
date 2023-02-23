

package view.documentroot.reportscreen.palletcontainer
{
import controller.documentroot.reportscreen.palletcontainer.StampPallet;
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
import spark.components.DataGroup;
import spark.components.Group;
import spark.components.Scroller;
import spark.core.SpriteVisualElement;
import view.documentroot.reportscreen.palletcontainer.StampPalletInnerClass0;
import view.documentroot.reportscreen.palletcontainer.StampPalletInnerClass1;
import spark.primitives.Rect;
import spark.layouts.TileLayout;
import spark.components.Group;
import mx.core.IFactory;
import spark.components.HGroup;
import mx.graphics.SolidColor;
import spark.layouts.VerticalLayout;

public class StampPallet extends spark.components.Group
{
	public function StampPallet() {}

	[Bindable]
	public var ctrlr : controller.documentroot.reportscreen.palletcontainer.StampPallet;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;
	[Bindable]
	public var bg : spark.components.Group;
	[Bindable]
	public var stampFolders : spark.components.Scroller;
	[Bindable]
	public var folderList : spark.components.DataGroup;
	[Bindable]
	public var stampListContainer : spark.components.Scroller;
	[Bindable]
	public var stampList : spark.components.DataGroup;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
