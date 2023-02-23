

package view.documentroot.reportscreen.palletcontainer.timelinepallet
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
import spark.components.Button;
import spark.components.Group;
import spark.skins.SparkSkin;
import view.documentroot.reportscreen.palletcontainer.timelinepallet.Skin_TimelineSliderInnerClass0;
import mx.states.State;
import spark.skins.SparkSkin;


			[HostComponent("spark.components.HSlider")]
		
public class Skin_TimelineSlider extends spark.skins.SparkSkin
{
	public function Skin_TimelineSlider() {}

	[Bindable]
	public var dataTip : mx.core.IFactory;
	[Bindable]
	public var slideBar : spark.components.Group;
	[Bindable]
	public var track : spark.components.Button;
	[Bindable]
	public var thumb : spark.components.Button;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
