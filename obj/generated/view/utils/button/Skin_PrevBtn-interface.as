

package view.utils.button
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
import spark.components.Label;
import view.utils.Skin_BtnCircle;
import view.utils.states;
import mx.states.State;
import view.utils.Skin_BtnCircle;
import mx.graphics.SolidColorStroke;
import mx.graphics.SolidColor;

public class Skin_PrevBtn extends view.utils.Skin_BtnCircle
{
	public function Skin_PrevBtn() {}

	[Bindable]
	public var label : spark.components.Label;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;

include "F:/git/KuraraySaijo/src/view/utils/button/Skin_PrevBtn.mxml:12,19";

}}
