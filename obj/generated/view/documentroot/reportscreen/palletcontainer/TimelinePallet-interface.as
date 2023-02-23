

package view.documentroot.reportscreen.palletcontainer
{
import controller.documentroot.reportscreen.palletcontainer.TimelinePallet;
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
import spark.components.Button;
import spark.components.DropDownList;
import spark.components.Group;
import spark.components.HGroup;
import spark.components.HSlider;
import spark.components.Label;
import spark.core.SpriteVisualElement;
import spark.primitives.Rect;
import spark.components.Group;
import mx.graphics.SolidColor;

public class TimelinePallet extends spark.components.Group
{
	public function TimelinePallet() {}

	[Bindable]
	public var ctrlr : controller.documentroot.reportscreen.palletcontainer.TimelinePallet;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;
	[Bindable]
	public var contents : spark.components.HGroup;
	[Bindable]
	public var dateTimeBox : spark.components.Group;
	[Bindable]
	public var nowDate : spark.components.Label;
	[Bindable]
	public var nowTime : spark.components.Label;
	[Bindable]
	public var ctrlBox : spark.components.HGroup;
	[Bindable]
	public var playBtn : spark.components.Button;
	[Bindable]
	public var pauseBtn : spark.components.Button;
	[Bindable]
	public var prevBtn : spark.components.Button;
	[Bindable]
	public var selectTimeBox : spark.components.DropDownList;
	[Bindable]
	public var nextBtn : spark.components.Button;
	[Bindable]
	public var contentsCenter : spark.components.Group;
	[Bindable]
	public var timelineSlider : spark.components.HSlider;
	[Bindable]
	public var closeBtn : spark.components.Button;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;

include "F:/git/KuraraySaijo/src/view/documentroot/reportscreen/palletcontainer/TimelinePallet.mxml:18,25";

}}
