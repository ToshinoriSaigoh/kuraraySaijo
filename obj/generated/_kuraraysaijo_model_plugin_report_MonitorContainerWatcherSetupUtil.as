







package
{
import mx.core.IFlexModuleFactory;
import mx.binding.ArrayElementWatcher;
import mx.binding.FunctionReturnWatcher;
import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.binding.RepeaterComponentWatcher;
import mx.binding.RepeaterItemWatcher;
import mx.binding.StaticPropertyWatcher;
import mx.binding.XMLWatcher;
import mx.binding.Watcher;

[ExcludeClass]
public class _kuraraysaijo_model_plugin_report_MonitorContainerWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _kuraraysaijo_model_plugin_report_MonitorContainerWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import kuraraysaijo.model.plugin.report.MonitorContainer;
        (kuraraysaijo.model.plugin.report.MonitorContainer).watcherSetupUtil = new _kuraraysaijo_model_plugin_report_MonitorContainerWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import spark.core.SpriteVisualElement;
        import spark.components.Group;
        import spark.components.Button;
        import flash.events.IEventDispatcher;
        import view.utils.Skin_BtnText;
        import mx.binding.BindingManager;
        import kuraraysaijo.model.plugin.report.monitorcontainer.WBGTAlert;
        import mx.states.State;
        import mx.core.IFactory;
        import mx.core.IFlexModuleFactory;
        import spark.components.Label;
        import mx.core.DeferredInstanceFromClass;
        import mx.core.IStateClient2;
        import mx.binding.IBindingClient;
        import spark.components.VGroup;
        import spark.components.TextArea;
        import kuraraysaijo.model.plugin.report.clock.AnalogClock;
        import mx.core.IPropertyChangeNotifier;
        import kuraraysaijo.model.plugin.report.KuraraySaijoMonitorContainer;
        import mx.states.SetProperty;
        import kuraraysaijo.model.plugin.report.monitorcontainer.AnemometerAlert;
        import kuraraysaijo.model.plugin.report.clock.DigitalClock;
        import kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp;
        import mx.core.mx_internal;
        import mx.core.IDeferredInstance;
        import mx.core.ClassFactory;
        import mx.core.DeferredInstanceFromFunction;
        import flash.events.EventDispatcher;
        import __AS3__.vec.Vector;
        import flash.events.Event;
        import kuraraysaijo.model.plugin.report.monitorcontainer.OtherIcon;

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.PropertyWatcher("ctrlr",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=0 size=32
        [
        bindings[0],
        bindings[1],
        bindings[2],
        bindings[3],
        bindings[4],
        bindings[5],
        bindings[6],
        bindings[7],
        bindings[8],
        bindings[9],
        bindings[10],
        bindings[11],
        bindings[12],
        bindings[13],
        bindings[14],
        bindings[15],
        bindings[16],
        bindings[17],
        bindings[18],
        bindings[19],
        bindings[20],
        bindings[21],
        bindings[22],
        bindings[23],
        bindings[24],
        bindings[25],
        bindings[26],
        bindings[27],
        bindings[28],
        bindings[29],
        bindings[30],
        bindings[31]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=7 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[7] = new mx.binding.PropertyWatcher("patrol11",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=7 size=1
        [
        bindings[6]
        ]
,
                                                                 null
);

        // writeWatcher id=8 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[8] = new mx.binding.PropertyWatcher("patrol12",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=8 size=1
        [
        bindings[7]
        ]
,
                                                                 null
);

        // writeWatcher id=6 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[6] = new mx.binding.PropertyWatcher("dust2Designing",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=6 size=1
        [
        bindings[5]
        ]
,
                                                                 null
);

        // writeWatcher id=16 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[16] = new mx.binding.PropertyWatcher("exerciseElectric",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=16 size=1
        [
        bindings[15]
        ]
,
                                                                 null
);

        // writeWatcher id=19 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[19] = new mx.binding.PropertyWatcher("trainerLabel",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=19 size=1
        [
        bindings[18]
        ]
,
                                                                 null
);

        // writeWatcher id=28 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[28] = new mx.binding.PropertyWatcher("tripLabel1",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=28 size=1
        [
        bindings[27]
        ]
,
                                                                 null
);

        // writeWatcher id=13 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[13] = new mx.binding.PropertyWatcher("dust1Pipe",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=13 size=1
        [
        bindings[12]
        ]
,
                                                                 null
);

        // writeWatcher id=12 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[12] = new mx.binding.PropertyWatcher("exercisePipe",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=12 size=1
        [
        bindings[11]
        ]
,
                                                                 null
);

        // writeWatcher id=4 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[4] = new mx.binding.PropertyWatcher("exerciseDesigning",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=4 size=1
        [
        bindings[3]
        ]
,
                                                                 null
);

        // writeWatcher id=31 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[31] = new mx.binding.PropertyWatcher("nextscheduleLabel",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=31 size=1
        [
        bindings[30]
        ]
,
                                                                 null
);

        // writeWatcher id=5 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[5] = new mx.binding.PropertyWatcher("dust1Designing",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=5 size=1
        [
        bindings[4]
        ]
,
                                                                 null
);

        // writeWatcher id=10 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[10] = new mx.binding.PropertyWatcher("patrol22",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=10 size=1
        [
        bindings[9]
        ]
,
                                                                 null
);

        // writeWatcher id=14 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[14] = new mx.binding.PropertyWatcher("dust2Pipe",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=14 size=1
        [
        bindings[13]
        ]
,
                                                                 null
);

        // writeWatcher id=9 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[9] = new mx.binding.PropertyWatcher("patrol21",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=9 size=1
        [
        bindings[8]
        ]
,
                                                                 null
);

        // writeWatcher id=18 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[18] = new mx.binding.PropertyWatcher("dust2Electric",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=18 size=1
        [
        bindings[17]
        ]
,
                                                                 null
);

        // writeWatcher id=21 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[21] = new mx.binding.PropertyWatcher("thermometerOutDoor",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=21 size=1
        [
        bindings[20]
        ]
,
                                                                 null
);

        // writeWatcher id=29 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[29] = new mx.binding.PropertyWatcher("scheduleHead",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=29 size=1
        [
        bindings[28]
        ]
,
                                                                 null
);

        // writeWatcher id=25 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[25] = new mx.binding.PropertyWatcher("workingLabel1",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=25 size=1
        [
        bindings[24]
        ]
,
                                                                 null
);

        // writeWatcher id=17 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[17] = new mx.binding.PropertyWatcher("dust1Electric",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=17 size=1
        [
        bindings[16]
        ]
,
                                                                 null
);

        // writeWatcher id=20 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[20] = new mx.binding.PropertyWatcher("workingNum",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=20 size=1
        [
        bindings[19]
        ]
,
                                                                 null
);

        // writeWatcher id=32 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[32] = new mx.binding.PropertyWatcher("messageLabel",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=32 size=1
        [
        bindings[31]
        ]
,
                                                                 null
);

        // writeWatcher id=30 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[30] = new mx.binding.PropertyWatcher("scheduleLabel",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=30 size=1
        [
        bindings[29]
        ]
,
                                                                 null
);

        // writeWatcher id=11 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[11] = new mx.binding.PropertyWatcher("morningPipe",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=11 size=1
        [
        bindings[10]
        ]
,
                                                                 null
);

        // writeWatcher id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[2] = new mx.binding.PropertyWatcher("noAccidentDept",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=2 size=1
        [
        bindings[1]
        ]
,
                                                                 null
);

        // writeWatcher id=22 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[22] = new mx.binding.PropertyWatcher("hygrometerOutDoor",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=22 size=1
        [
        bindings[21]
        ]
,
                                                                 null
);

        // writeWatcher id=27 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[27] = new mx.binding.PropertyWatcher("absenceLabel2",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=27 size=1
        [
        bindings[26]
        ]
,
                                                                 null
);

        // writeWatcher id=3 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[3] = new mx.binding.PropertyWatcher("morningDesigning",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=3 size=1
        [
        bindings[2]
        ]
,
                                                                 null
);

        // writeWatcher id=26 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[26] = new mx.binding.PropertyWatcher("absenceLabel1",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=26 size=1
        [
        bindings[25]
        ]
,
                                                                 null
);

        // writeWatcher id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[1] = new mx.binding.PropertyWatcher("noAccidentAll",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=1 size=1
        [
        bindings[0]
        ]
,
                                                                 null
);

        // writeWatcher id=24 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[24] = new mx.binding.PropertyWatcher("anemometer",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=24 size=1
        [
        bindings[23]
        ]
,
                                                                 null
);

        // writeWatcher id=15 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[15] = new mx.binding.PropertyWatcher("morningElectric",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=15 size=1
        [
        bindings[14]
        ]
,
                                                                 null
);

        // writeWatcher id=23 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[23] = new mx.binding.PropertyWatcher("WBGTOutDoor",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=23 size=1
        [
        bindings[22]
        ]
,
                                                                 null
);


        // writeWatcherBottom id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].updateParent(target);

 





        // writeWatcherBottom id=7 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[7]);

 





        // writeWatcherBottom id=8 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[8]);

 





        // writeWatcherBottom id=6 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[6]);

 





        // writeWatcherBottom id=16 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[16]);

 





        // writeWatcherBottom id=19 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[19]);

 





        // writeWatcherBottom id=28 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[28]);

 





        // writeWatcherBottom id=13 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[13]);

 





        // writeWatcherBottom id=12 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[12]);

 





        // writeWatcherBottom id=4 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[4]);

 





        // writeWatcherBottom id=31 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[31]);

 





        // writeWatcherBottom id=5 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[5]);

 





        // writeWatcherBottom id=10 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[10]);

 





        // writeWatcherBottom id=14 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[14]);

 





        // writeWatcherBottom id=9 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[9]);

 





        // writeWatcherBottom id=18 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[18]);

 





        // writeWatcherBottom id=21 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[21]);

 





        // writeWatcherBottom id=29 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[29]);

 





        // writeWatcherBottom id=25 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[25]);

 





        // writeWatcherBottom id=17 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[17]);

 





        // writeWatcherBottom id=20 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[20]);

 





        // writeWatcherBottom id=32 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[32]);

 





        // writeWatcherBottom id=30 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[30]);

 





        // writeWatcherBottom id=11 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[11]);

 





        // writeWatcherBottom id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[2]);

 





        // writeWatcherBottom id=22 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[22]);

 





        // writeWatcherBottom id=27 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[27]);

 





        // writeWatcherBottom id=3 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[3]);

 





        // writeWatcherBottom id=26 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[26]);

 





        // writeWatcherBottom id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[1]);

 





        // writeWatcherBottom id=24 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[24]);

 





        // writeWatcherBottom id=15 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[15]);

 





        // writeWatcherBottom id=23 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[23]);

 





    }
}

}
