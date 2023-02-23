







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
public class _view_documentroot_reportscreen_sidebar_pager_Skin_PageBtnWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _view_documentroot_reportscreen_sidebar_pager_Skin_PageBtnWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import view.documentroot.reportscreen.sidebar.pager.Skin_PageBtn;
        (view.documentroot.reportscreen.sidebar.pager.Skin_PageBtn).watcherSetupUtil = new _view_documentroot_reportscreen_sidebar_pager_Skin_PageBtnWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import view.documentroot.reportscreen.sidebar.pager.CtrlBox;
        import spark.components.Group;
        import view.utils.Skin_ToggleBtn;
        import mx.states.SetStyle;
        import flash.events.IEventDispatcher;
        import spark.components.HGroup;
        import mx.binding.BindingManager;
        import mx.states.State;
        import mx.core.IFactory;
        import mx.core.IFlexModuleFactory;
        import spark.components.Label;
        import mx.core.DeferredInstanceFromClass;
        import controller.documentroot.reportscreen.sidebar.pager.PageBtn;
        import mx.graphics.SolidColor;
        import mx.core.IStateClient2;
        import spark.primitives.Rect;
        import mx.binding.IBindingClient;
        import mx.core.IPropertyChangeNotifier;
        import mx.states.SetProperty;
        import mx.core.mx_internal;
        import mx.core.IDeferredInstance;
        import mx.core.ClassFactory;
        import mx.core.DeferredInstanceFromFunction;
        import flash.events.EventDispatcher;
        import __AS3__.vec.Vector;
        import flash.events.Event;
        import mx.events.FlexEvent;

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.PropertyWatcher("_label",
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


        // writeWatcherBottom id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].updateParent(target);

 





    }
}

}
