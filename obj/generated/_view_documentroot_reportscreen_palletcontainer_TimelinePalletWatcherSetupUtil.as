







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
public class _view_documentroot_reportscreen_palletcontainer_TimelinePalletWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _view_documentroot_reportscreen_palletcontainer_TimelinePalletWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import view.documentroot.reportscreen.palletcontainer.TimelinePallet;
        (view.documentroot.reportscreen.palletcontainer.TimelinePallet).watcherSetupUtil = new _view_documentroot_reportscreen_palletcontainer_TimelinePalletWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import view.documentroot.reportscreen.palletcontainer.timelinepallet.Skin_CloseBtn;
        import spark.core.SpriteVisualElement;
        import spark.components.Group;
        import view.documentroot.reportscreen.palletcontainer.timelinepallet.Skin_PrevBtn;
        import spark.components.Button;
        import flash.events.IEventDispatcher;
        import spark.components.HGroup;
        import mx.binding.BindingManager;
        import view.documentroot.reportscreen.palletcontainer.timelinepallet.Skin_NextBtn;
        import spark.components.HSlider;
        import mx.core.IFactory;
        import mx.core.IFlexModuleFactory;
        import spark.components.Label;
        import mx.core.DeferredInstanceFromClass;
        import flash.display.Sprite;
        import view.documentroot.reportscreen.palletcontainer.timelinepallet.Skin_PauseBtn;
        import view.documentroot.reportscreen.palletcontainer.timelinepallet.Skin_TimelineSlider;
        import view.utils.dropdownlist.Skin_DropDownList;
        import mx.graphics.SolidColor;
        import mx.core.UIComponent;
        import spark.components.DropDownList;
        import spark.primitives.Rect;
        import controller.documentroot.reportscreen.palletcontainer.TimelinePallet;
        import mx.binding.IBindingClient;
        import common.SVGUtils;
        import mx.core.IPropertyChangeNotifier;
        import view.documentroot.reportscreen.palletcontainer.timelinepallet.Skin_PlayBtn;
        import mx.core.mx_internal;
        import mx.core.IDeferredInstance;
        import mx.core.ClassFactory;
        import mx.core.DeferredInstanceFromFunction;
        import flash.events.EventDispatcher;
        import __AS3__.vec.Vector;
        import model.plugin.draw.Draw;
        import flash.events.Event;

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.StaticPropertyWatcher("activeDrawPanel",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=0 size=4
        [
        bindings[0],
        bindings[1],
        bindings[2],
        bindings[3]
        ]
,
                                                                 null
);

        // writeWatcher id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[1] = new mx.binding.PropertyWatcher("report",
                                                                             null
,
                                                                         // writeWatcherListeners id=1 size=4
        [
        bindings[0],
        bindings[1],
        bindings[2],
        bindings[3]
        ]
,
                                                                 null
);

        // writeWatcher id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[2] = new mx.binding.PropertyWatcher("dateText",
                                                                             null
,
                                                                         // writeWatcherListeners id=2 size=1
        [
        bindings[0]
        ]
,
                                                                 null
);

        // writeWatcher id=4 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[4] = new mx.binding.PropertyWatcher("lastTime",
                                                                             null
,
                                                                         // writeWatcherListeners id=4 size=1
        [
        bindings[2]
        ]
,
                                                                 null
);

        // writeWatcher id=3 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[3] = new mx.binding.PropertyWatcher("timeText",
                                                                             null
,
                                                                         // writeWatcherListeners id=3 size=1
        [
        bindings[1]
        ]
,
                                                                 null
);

        // writeWatcher id=5 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[5] = new mx.binding.PropertyWatcher("nowTime",
                                                                             null
,
                                                                         // writeWatcherListeners id=5 size=1
        [
        bindings[3]
        ]
,
                                                                 null
);


        // writeWatcherBottom id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        import model.plugin.draw.Draw;
        watchers[0].updateParent(model.plugin.draw.Draw);

 





        // writeWatcherBottom id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[1]);

 





        // writeWatcherBottom id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[1].addChild(watchers[2]);

 





        // writeWatcherBottom id=4 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[1].addChild(watchers[4]);

 





        // writeWatcherBottom id=3 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[1].addChild(watchers[3]);

 





        // writeWatcherBottom id=5 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[1].addChild(watchers[5]);

 





    }
}

}
