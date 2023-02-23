







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
public class _view_documentroot_reportscreen_sidebar_filelistbox_Skin_OpenButtonBarBtnWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _view_documentroot_reportscreen_sidebar_filelistbox_Skin_OpenButtonBarBtnWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import view.documentroot.reportscreen.sidebar.filelistbox.Skin_OpenButtonBarBtn;
        (view.documentroot.reportscreen.sidebar.filelistbox.Skin_OpenButtonBarBtn).watcherSetupUtil = new _view_documentroot_reportscreen_sidebar_filelistbox_Skin_OpenButtonBarBtnWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import flash.events.IEventDispatcher;
        import mx.graphics.IFill;
        import mx.binding.BindingManager;
        import mx.states.State;
        import mx.core.IFactory;
        import mx.core.IFlexModuleFactory;
        import spark.components.Label;
        import mx.core.DeferredInstanceFromClass;
        import mx.graphics.SolidColor;
        import mx.core.IStateClient2;
        import spark.primitives.Rect;
        import mx.binding.IBindingClient;
        import mx.core.IPropertyChangeNotifier;
        import mx.states.SetProperty;
        import spark.components.ButtonBarButton;
        import mx.graphics.SolidColorStroke;
        import mx.core.mx_internal;
        import mx.core.IDeferredInstance;
        import spark.skins.SparkSkin;
        import mx.core.ClassFactory;
        import mx.core.DeferredInstanceFromFunction;
        import flash.events.EventDispatcher;
        import __AS3__.vec.Vector;
        import flash.events.Event;
        import mx.events.FlexEvent;

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


        // writeWatcherBottom id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].updateParent(target);

 





    }
}

}
