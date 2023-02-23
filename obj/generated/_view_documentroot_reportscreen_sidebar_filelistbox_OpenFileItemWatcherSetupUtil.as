







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
public class _view_documentroot_reportscreen_sidebar_filelistbox_OpenFileItemWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _view_documentroot_reportscreen_sidebar_filelistbox_OpenFileItemWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import view.documentroot.reportscreen.sidebar.filelistbox.OpenFileItem;
        (view.documentroot.reportscreen.sidebar.filelistbox.OpenFileItem).watcherSetupUtil = new _view_documentroot_reportscreen_sidebar_filelistbox_OpenFileItemWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import spark.core.SpriteVisualElement;
        import spark.components.Group;
        import spark.components.supportClasses.ItemRenderer;
        import mx.states.SetStyle;
        import spark.components.Button;
        import flash.events.IEventDispatcher;
        import spark.components.HGroup;
        import mx.binding.BindingManager;
        import mx.states.State;
        import mx.core.IFactory;
        import view.documentroot.reportscreen.sidebar.filelistbox.Skin_ToggleBtnRect;
        import mx.core.IFlexModuleFactory;
        import spark.components.Label;
        import mx.core.DeferredInstanceFromClass;
        import controller.documentroot.reportscreen.sidebar.filelistbox.OpenFileItem;
        import mx.core.IStateClient2;
        import mx.binding.IBindingClient;
        import view.utils.button.Skin_CloseBtn;
        import view.utils.button.Skin_SaveReportBtn;
        import view.utils.DataTypeMark;
        import spark.components.VGroup;
        import spark.components.ToggleButton;
        import mx.core.IPropertyChangeNotifier;
        import mx.states.SetProperty;
        import mx.core.mx_internal;
        import mx.core.IDeferredInstance;
        import mx.core.ClassFactory;
        import mx.core.DeferredInstanceFromFunction;
        import view.documentroot.reportscreen.sidebar.filelistbox.Skin_ShareReportBtn;
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

        // writeWatcher id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[2] = new mx.binding.PropertyWatcher("saveDate",
                                                                             null
,
                                                                         // writeWatcherListeners id=2 size=1
        [
        bindings[1]
        ]
,
                                                                 null
);

        // writeWatcher id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[1] = new mx.binding.PropertyWatcher("id",
                                                                             null
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

 





        // writeWatcherBottom id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[2]);

 





        // writeWatcherBottom id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[1]);

 





    }
}

}
