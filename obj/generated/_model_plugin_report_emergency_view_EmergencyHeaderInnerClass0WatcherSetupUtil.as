







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
public class _model_plugin_report_emergency_view_EmergencyHeaderInnerClass0WatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _model_plugin_report_emergency_view_EmergencyHeaderInnerClass0WatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import model.plugin.report.emergency.view.EmergencyHeaderInnerClass0;
        (model.plugin.report.emergency.view.EmergencyHeaderInnerClass0).watcherSetupUtil = new _model_plugin_report_emergency_view_EmergencyHeaderInnerClass0WatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import mx.binding.IBindingClient;
        import model.plugin.report.emergency.view.Skin_MenuBtn;
        import spark.components.supportClasses.ItemRenderer;
        import spark.components.Button;
        import flash.events.IEventDispatcher;
        import mx.core.IPropertyChangeNotifier;
        import model.plugin.report.emergency.view.EmergencyHeader;
        import mx.binding.BindingManager;
        import mx.core.IFactory;
        import mx.core.IFlexModuleFactory;
        import mx.core.mx_internal;
        import mx.core.DeferredInstanceFromClass;
        import mx.core.IDeferredInstance;
        import mx.core.ClassFactory;
        import mx.core.DeferredInstanceFromFunction;
        import flash.events.EventDispatcher;
        import __AS3__.vec.Vector;
        import flash.events.Event;

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.PropertyWatcher("data",
                                                                             {
                dataChange: true
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
        watchers[1] = new mx.binding.PropertyWatcher("name",
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
        watchers[2] = new mx.binding.PropertyWatcher("title",
                                                                             null
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
