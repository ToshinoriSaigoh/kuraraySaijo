







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
public class _view_documentroot_reportscreen_sidebar_pager_CtrlBoxWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _view_documentroot_reportscreen_sidebar_pager_CtrlBoxWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import view.documentroot.reportscreen.sidebar.pager.CtrlBox;
        (view.documentroot.reportscreen.sidebar.pager.CtrlBox).watcherSetupUtil = new _view_documentroot_reportscreen_sidebar_pager_CtrlBoxWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import spark.core.SpriteVisualElement;
        import spark.components.DataGroup;
        import spark.components.Group;
        import spark.components.Button;
        import flash.events.IEventDispatcher;
        import spark.layouts.VerticalLayout;
        import mx.binding.BindingManager;
        import view.documentroot.reportscreen.sidebar.pager.CtrlBoxInnerClass0;
        import flash.events.MouseEvent;
        import mx.states.State;
        import mx.core.IFactory;
        import mx.core.IFlexModuleFactory;
        import mx.core.DeferredInstanceFromClass;
        import view.documentroot.reportscreen.sidebar.pager.Skin_AddLayerBtn;
        import view.documentroot.reportscreen.sidebar.pager.Skin_VScroller;
        import mx.graphics.SolidColor;
        import mx.core.IStateClient2;
        import spark.primitives.Rect;
        import mx.binding.IBindingClient;
        import spark.components.VGroup;
        import spark.components.Scroller;
        import controller.documentroot.reportscreen.sidebar.pager.CtrlBox;
        import mx.core.IPropertyChangeNotifier;
        import mx.states.SetProperty;
        import mx.core.mx_internal;
        import mx.core.IDeferredInstance;
        import mx.core.ClassFactory;
        import mx.core.DeferredInstanceFromFunction;
        import flash.events.EventDispatcher;
        import __AS3__.vec.Vector;
        import flash.events.Event;
        import view.documentroot.reportscreen.sidebar.pager.Skin_CtrlBoxThumbBtn;

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.PropertyWatcher("layerBox",
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

        // writeWatcher id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[1] = new mx.binding.PropertyWatcher("height",
                                                                             {
                heightChanged: true
            }
,
                                                                         // writeWatcherListeners id=1 size=1
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

 





    }
}

}
