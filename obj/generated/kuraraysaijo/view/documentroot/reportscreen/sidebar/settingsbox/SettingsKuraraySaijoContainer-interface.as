

package kuraraysaijo.view.documentroot.reportscreen.sidebar.settingsbox
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
import kuraraysaijo.controller.documentroot.reportscreen.sidebar.settingsbox.SettingsKuraraySaijoContainer;
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
import spark.components.Label;
import spark.components.NavigatorContent;
import spark.components.Scroller;
import spark.core.SpriteVisualElement;
import spark.components.NavigatorContent;
import spark.components.Group;
import spark.components.VGroup;
import spark.primitives.Line;
import mx.graphics.SolidColorStroke;
import spark.components.HGroup;

public class SettingsKuraraySaijoContainer extends spark.components.NavigatorContent
{
	public function SettingsKuraraySaijoContainer() {}

	[Bindable]
	public var ctrlr : kuraraysaijo.controller.documentroot.reportscreen.sidebar.settingsbox.SettingsKuraraySaijoContainer;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;
	[Bindable]
	public var scroller : spark.components.Scroller;
	[Bindable]
	public var scheduleHead : spark.components.Label;
	[Bindable]
	public var importScheduleBtn : spark.components.Button;
	[Bindable]
	public var importHolidayBtn : spark.components.Button;
	[Bindable]
	public var dutyHead : spark.components.Label;
	[Bindable]
	public var importMorningBtn : spark.components.Button;
	[Bindable]
	public var importExerciseBtn : spark.components.Button;
	[Bindable]
	public var importDustBtn : spark.components.Button;
	[Bindable]
	public var importPatrolBtn : spark.components.Button;
	[Bindable]
	public var importTrainerBtn : spark.components.Button;
	[Bindable]
	public var attendanceHead : spark.components.Label;
	[Bindable]
	public var importAttendanceBtn : spark.components.Button;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
