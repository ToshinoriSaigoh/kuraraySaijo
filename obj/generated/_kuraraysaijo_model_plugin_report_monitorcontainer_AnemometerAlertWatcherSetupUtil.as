







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
public class _kuraraysaijo_model_plugin_report_monitorcontainer_AnemometerAlertWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _kuraraysaijo_model_plugin_report_monitorcontainer_AnemometerAlertWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import kuraraysaijo.model.plugin.report.monitorcontainer.AnemometerAlert;
        (kuraraysaijo.model.plugin.report.monitorcontainer.AnemometerAlert).watcherSetupUtil = new _kuraraysaijo_model_plugin_report_monitorcontainer_AnemometerAlertWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import mx.core.IStateClient2;
        import spark.primitives.Rect;
        import spark.components.Group;
        import mx.binding.IBindingClient;
        import flash.events.IEventDispatcher;
        import mx.core.IPropertyChangeNotifier;
        import mx.binding.BindingManager;
        import mx.states.State;
        import mx.core.IFactory;
        import mx.core.IFlexModuleFactory;
        import spark.components.Label;
        import mx.core.mx_internal;
        import mx.core.DeferredInstanceFromClass;
        import mx.core.IDeferredInstance;
        import mx.core.ClassFactory;
        import mx.core.DeferredInstanceFromFunction;
        import flash.events.EventDispatcher;
        import __AS3__.vec.Vector;
        import flash.events.Event;
        import mx.graphics.SolidColor;

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.PropertyWatcher("parentDocument",
                                                                             {
                initialize: true
            }
,
                                                                         // writeWatcherListeners id=0 size=1
        [
        bindings[0]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[1] = new mx.binding.PropertyWatcher("ctrlr",
                                                                             null
,
                                                                         // writeWatcherListeners id=1 size=1
        [
        bindings[0]
        ]
,
                                                                 null
);

        // writeWatcher id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[2] = new mx.binding.PropertyWatcher("anemometerInfo",
                                                                             null
,
                                                                         // writeWatcherListeners id=2 size=1
        [
        bindings[0]
        ]
,
                                                                 null
);

        // writeWatcher id=3 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[3] = new mx.binding.PropertyWatcher("label",
                                                                             null
,
                                                                         // writeWatcherListeners id=3 size=1
        [
        bindings[0]
        ]
,
                                                                 null
);


        // writeWatcherBottom id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].updateParent(target);

 





        // writeWatcherBottom id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[1]);

 





        // writeWatcherBottom id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[1].addChild(watchers[2]);

 





        // writeWatcherBottom id=3 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[2].addChild(watchers[3]);

 





    }
}

}
