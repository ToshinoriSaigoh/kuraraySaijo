

package kuraraysaijo.model.plugin.report
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
import kuraraysaijo.model.plugin.report.KuraraySaijoMonitorContainer;
import kuraraysaijo.model.plugin.report.monitorcontainer.AnemometerAlert;
import kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp;
import kuraraysaijo.model.plugin.report.monitorcontainer.OtherIcon;
import kuraraysaijo.model.plugin.report.monitorcontainer.WBGTAlert;
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
import spark.components.Label;
import spark.components.TextArea;
import spark.components.VGroup;
import spark.core.SpriteVisualElement;
import spark.components.Group;
import mx.states.State;
import kuraraysaijo.model.plugin.report.clock.DigitalClock;
import kuraraysaijo.model.plugin.report.clock.AnalogClock;

public class MonitorContainer extends spark.components.Group
{
	public function MonitorContainer() {}

	[Bindable]
	public var ctrlr : kuraraysaijo.model.plugin.report.KuraraySaijoMonitorContainer;
	[Bindable]
	public var monitorContainer : spark.components.Group;
	[Bindable]
	public var background : spark.core.SpriteVisualElement;
	[Bindable]
	public var clock : spark.components.VGroup;
	[Bindable]
	public var noAccidentAll : spark.components.Label;
	[Bindable]
	public var noAccidentDept : spark.components.Label;
	[Bindable]
	public var MeetingRoomLamp1 : kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp;
	[Bindable]
	public var MeetingRoomLamp2 : kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp;
	[Bindable]
	public var MeetingRoomLamp3 : kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp;
	[Bindable]
	public var MeetingRoomLamp4 : kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp;
	[Bindable]
	public var MeetingRoomLamp5 : kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp;
	[Bindable]
	public var morningDesigning : spark.components.Label;
	[Bindable]
	public var exerciseDesigning : spark.components.Label;
	[Bindable]
	public var dust1Designing : spark.components.Label;
	[Bindable]
	public var dust2Designing : spark.components.Label;
	[Bindable]
	public var patrol11 : spark.components.Label;
	[Bindable]
	public var patrol12 : spark.components.Label;
	[Bindable]
	public var patrol21 : spark.components.Label;
	[Bindable]
	public var patrol22 : spark.components.Label;
	[Bindable]
	public var morningPipe : spark.components.Label;
	[Bindable]
	public var exercisePipe : spark.components.Label;
	[Bindable]
	public var dust1Pipe : spark.components.Label;
	[Bindable]
	public var dust2Pipe : spark.components.Label;
	[Bindable]
	public var morningElectric : spark.components.Label;
	[Bindable]
	public var exerciseElectric : spark.components.Label;
	[Bindable]
	public var dust1Electric : spark.components.Label;
	[Bindable]
	public var dust2Electric : spark.components.Label;
	[Bindable]
	public var trainerLabel : spark.components.Label;
	[Bindable]
	public var workingNum : spark.components.Label;
	[Bindable]
	public var thermometerOutDoor : spark.components.Label;
	[Bindable]
	public var hygrometerOutDoor : spark.components.Label;
	[Bindable]
	public var WBGTOutDoor : spark.components.Label;
	[Bindable]
	public var anemometer : spark.components.Label;
	[Bindable]
	public var WBGTAlertOutDoor : kuraraysaijo.model.plugin.report.monitorcontainer.WBGTAlert;
	[Bindable]
	public var anemometerAlert : kuraraysaijo.model.plugin.report.monitorcontainer.AnemometerAlert;
	[Bindable]
	public var workingLabel1 : spark.components.Label;
	[Bindable]
	public var workingOtherIcon : kuraraysaijo.model.plugin.report.monitorcontainer.OtherIcon;
	[Bindable]
	public var absenceLabel1 : spark.components.Label;
	[Bindable]
	public var absenceLabel2 : spark.components.Label;
	[Bindable]
	public var absenceOtherIcon : kuraraysaijo.model.plugin.report.monitorcontainer.OtherIcon;
	[Bindable]
	public var tripLabel1 : spark.components.Label;
	[Bindable]
	public var tripOtherIcon : kuraraysaijo.model.plugin.report.monitorcontainer.OtherIcon;
	[Bindable]
	public var scheduleHead : spark.components.Label;
	[Bindable]
	public var scheduleLabel : spark.components.Label;
	[Bindable]
	public var nextscheduleLabel : spark.components.Label;
	[Bindable]
	public var messageLabel : spark.components.Label;
	[Bindable]
	public var schedule : spark.components.TextArea;
	[Bindable]
	public var nextschedule : spark.components.TextArea;
	[Bindable]
	public var message : spark.components.TextArea;
	[Bindable]
	public var insertSchedule : spark.components.Button;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
