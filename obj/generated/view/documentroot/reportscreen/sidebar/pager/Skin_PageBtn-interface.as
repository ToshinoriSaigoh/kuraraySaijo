

package view.documentroot.reportscreen.sidebar.pager
{
import controller.documentroot.reportscreen.sidebar.pager.PageBtn;
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
import spark.components.HGroup;
import spark.components.Label;
import view.documentroot.reportscreen.sidebar.pager.CtrlBox;
import view.utils.Skin_ToggleBtn;
import view.utils.states;
import spark.primitives.Rect;
import spark.components.Group;
import view.utils.Skin_ToggleBtn;
import mx.states.State;
import mx.graphics.SolidColor;

public class Skin_PageBtn extends view.utils.Skin_ToggleBtn
{
	public function Skin_PageBtn() {}

	[Bindable]
	public var ctrlr : controller.documentroot.reportscreen.sidebar.pager.PageBtn;
	[Bindable]
	public var itemGroup : spark.components.HGroup;
	[Bindable]
	public var label : spark.components.Label;
	[Bindable]
	public var ctrlBox : view.documentroot.reportscreen.sidebar.pager.CtrlBox;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;

include "F:/git/KuraraySaijo/src/view/documentroot/reportscreen/sidebar/pager/Skin_PageBtn.mxml:17,24";

}}
