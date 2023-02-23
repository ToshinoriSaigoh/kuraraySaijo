







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
public class _model_plugin_report_emergency_view_Skin_MenuBtnWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _model_plugin_report_emergency_view_Skin_MenuBtnWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import model.plugin.report.emergency.view.Skin_MenuBtn;
        (model.plugin.report.emergency.view.Skin_MenuBtn).watcherSetupUtil = new _model_plugin_report_emergency_view_Skin_MenuBtnWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import view.utils.Skin_Btn;
        import spark.components.Button;
        import flash.events.IEventDispatcher;
        import mx.graphics.IFill;
        import mx.binding.BindingManager;
        import mx.states.State;
        import mx.core.IFactory;
        import mx.core.IFlexModuleFactory;
        import spark.components.Label;
        import spark.primitives.Line;
        import mx.core.DeferredInstanceFromClass;
        import mx.graphics.SolidColor;
        import mx.core.IStateClient2;
        import spark.primitives.Rect;
        import mx.binding.IBindingClient;
        import mx.core.IPropertyChangeNotifier;
        import mx.states.SetProperty;
        import mx.graphics.SolidColorStroke;
        import mx.core.mx_internal;
        import mx.core.IDeferredInstance;
        import mx.core.ClassFactory;
        import mx.core.DeferredInstanceFromFunction;
        import flash.events.EventDispatcher;
        import __AS3__.vec.Vector;
        import flash.events.Event;
        import mx.events.FlexEvent;

        // writeWatcher id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[1] = new mx.binding.PropertyWatcher("hostComponent",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=1 size=1
        [
        bindings[1]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[2] = new mx.binding.PropertyWatcher("label",
                                                                             {
                contentChange: true
            }
,
                                                                         // writeWatcherListeners id=2 size=1
        [
        bindings[1]
        ]
,
                                                                 null
);

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.PropertyWatcher("bgRect",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=0 size=1
        [
        bindings[0]
        ]
,
                                                                 propertyGetter
);


        // writeWatcherBottom id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[1].updateParent(target);

 





        // writeWatcherBottom id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[1].addChild(watchers[2]);

 





        // writeWatcherBottom id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].updateParent(target);

 





    }
}

}
