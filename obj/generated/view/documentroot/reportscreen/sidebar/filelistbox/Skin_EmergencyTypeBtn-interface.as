

package view.documentroot.reportscreen.sidebar.filelistbox
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
import spark.components.Group;
import spark.components.Label;
import spark.core.SpriteVisualElement;
import spark.primitives.Rect;
import view.utils.DataTypeMark;
import view.utils.Skin_Btn;
import view.utils.Skin_Btn;
import view.utils.states;
import mx.states.State;
import mx.graphics.SolidColorStroke;
import mx.graphics.SolidColor;

public class Skin_EmergencyTypeBtn extends view.utils.Skin_Btn
{
	public function Skin_EmergencyTypeBtn() {}

	[Bindable]
	public var fill : spark.primitives.Rect;
	[Bindable]
	public var label : spark.components.Label;
	[Bindable]
	public var icon : spark.components.Group;
	[Bindable]
	public var dataTypeMark : view.utils.DataTypeMark;
	[Bindable]
	public var border : spark.primitives.Rect;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;

include "F:/git/KuraraySaijo/src/view/documentroot/reportscreen/sidebar/filelistbox/Skin_EmergencyTypeBtn.mxml:13,22";

}}
