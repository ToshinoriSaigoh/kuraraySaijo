







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
public class _view_documentroot_reportscreen_palletcontainer_colorpallet_Skin_ColorWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _view_documentroot_reportscreen_palletcontainer_colorpallet_Skin_ColorWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import view.documentroot.reportscreen.palletcontainer.colorpallet.Skin_Color;
        (view.documentroot.reportscreen.palletcontainer.colorpallet.Skin_Color).watcherSetupUtil = new _view_documentroot_reportscreen_palletcontainer_colorpallet_Skin_ColorWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import mx.core.IStateClient2;
        import spark.primitives.Rect;
        import spark.core.SpriteVisualElement;
        import mx.binding.IBindingClient;
        import flash.events.IEventDispatcher;
        import mx.core.IPropertyChangeNotifier;
        import mx.binding.BindingManager;
        import mx.states.SetProperty;
        import mx.states.State;
        import mx.core.IFactory;
        import mx.core.IFlexModuleFactory;
        import mx.core.mx_internal;
        import mx.core.DeferredInstanceFromClass;
        import mx.core.IDeferredInstance;
        import spark.skins.SparkSkin;
        import mx.core.ClassFactory;
        import mx.core.DeferredInstanceFromFunction;
        import flash.events.EventDispatcher;
        import __AS3__.vec.Vector;
        import flash.events.Event;
        import controller.documentroot.reportscreen.palletcontainer.colorpallet.ColorButton;
        import mx.graphics.SolidColor;

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.PropertyWatcher("hostComponent",
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
        watchers[1] = new mx.binding.PropertyWatcher("color",
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


        // writeWatcherBottom id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].updateParent(target);

 





        // writeWatcherBottom id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[1]);

 





    }
}

}
