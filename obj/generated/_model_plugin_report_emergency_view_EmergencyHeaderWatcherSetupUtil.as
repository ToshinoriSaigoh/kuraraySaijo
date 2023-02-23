







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
public class _model_plugin_report_emergency_view_EmergencyHeaderWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _model_plugin_report_emergency_view_EmergencyHeaderWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import model.plugin.report.emergency.view.EmergencyHeader;
        (model.plugin.report.emergency.view.EmergencyHeader).watcherSetupUtil = new _model_plugin_report_emergency_view_EmergencyHeaderWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import model.plugin.report.emergency.view.EmergencyHeaderInnerClass0;
        import spark.layouts.TileLayout;
        import spark.components.DataGroup;
        import spark.components.Group;
        import mx.binding.IBindingClient;
        import flash.events.IEventDispatcher;
        import mx.core.IPropertyChangeNotifier;
        import mx.binding.BindingManager;
        import mx.core.IFactory;
        import mx.core.IFlexModuleFactory;
        import spark.components.Label;
        import mx.core.mx_internal;
        import mx.core.DeferredInstanceFromClass;
        import mx.core.IDeferredInstance;
        import mx.core.ClassFactory;
        import mx.core.DeferredInstanceFromFunction;
        import model.plugin.report.emergency.EmergencyHeader;
        import flash.events.EventDispatcher;
        import __AS3__.vec.Vector;
        import flash.events.Event;

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.PropertyWatcher("ctrlr",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=0 size=2
        [
        bindings[0],
        bindings[1]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[1] = new mx.binding.PropertyWatcher("datetime",
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

        // writeWatcher id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[2] = new mx.binding.PropertyWatcher("title",
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


        // writeWatcherBottom id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].updateParent(target);

 





        // writeWatcherBottom id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[1]);

 





        // writeWatcherBottom id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[2]);

 





    }
}

}
