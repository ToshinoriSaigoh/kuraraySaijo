

/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    view.documentroot.reportscreen.sidebar.filelistbox
 *  Class:      Skin_VScrollBarInnerClass0
 *  Source:     F:\git\KuraraySaijo\src\view\documentroot\reportscreen\sidebar\filelistbox\Skin_VScrollBar.mxml$Skin_VScrollBarInnerClass0
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2023.02.23 11:36:24 JST
 */

package view.documentroot.reportscreen.sidebar.filelistbox
{

import flash.accessibility.*;
import flash.data.*;
import flash.debugger.*;
import flash.desktop.*;
import flash.display.*;
import flash.errors.*;
import flash.events.*;
import flash.external.*;
import flash.filesystem.*;
import flash.geom.*;
import flash.html.*;
import flash.html.script.*;
import flash.media.*;
import flash.net.*;
import flash.printing.*;
import flash.profiler.*;
import flash.system.*;
import flash.text.*;
import flash.ui.*;
import flash.utils.*;
import flash.xml.*;
import mx.binding.*;
import mx.binding.IBindingClient;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromClass;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IDeferredInstance;
import mx.core.IFactory;
import mx.core.IFlexModuleFactory;
import mx.core.IPropertyChangeNotifier;
import mx.core.mx_internal;
import mx.filters.*;
import mx.graphics.SolidColor;
import mx.styles.*;
import spark.components.DataRenderer;
import spark.components.Label;
import spark.filters.DropShadowFilter;
import spark.primitives.Rect;
import view.documentroot.reportscreen.sidebar.filelistbox.Skin_VScrollBar;


[ExcludeClass]

//  begin class def
public class Skin_VScrollBarInnerClass0
    extends spark.components.DataRenderer
    implements mx.binding.IBindingClient
{

    //  instance variables
    [Bindable]
	/**
 * @private
 **/
    public var labelField : spark.components.Label;

    [Bindable]
	/**
 * @private
 **/
    public var outerDocument : view.documentroot.reportscreen.sidebar.filelistbox.Skin_VScrollBar;


    //  type-import dummies



    //  constructor (Flex display object)
    /**
     * @private
     **/
    public function Skin_VScrollBarInnerClass0()
    {
        super();

        mx_internal::_document = this;


        var bindings:Array = _Skin_VScrollBarInnerClass0_bindingsSetup();
        var watchers:Array = [];

        var target:Object = this;

        if (_watcherSetupUtil == null)
        {
            var watcherSetupUtilClass:Object = getDefinitionByName("_view_documentroot_reportscreen_sidebar_filelistbox_Skin_VScrollBarInnerClass0WatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }

        _watcherSetupUtil.setup(this,
                    function(propertyName:String):* { return target[propertyName]; },
                    function(propertyName:String):* { return Skin_VScrollBarInnerClass0[propertyName]; },
                    bindings,
                    watchers);

        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);


        // layer initializers

       
        // properties
        this.minHeight = 24;
        this.minWidth = 40;
        this.x = 20;
        this.mxmlContent = [_Skin_VScrollBarInnerClass0_Rect1_c(), _Skin_VScrollBarInnerClass0_Label1_i()];


        // events










        for (var i:uint = 0; i < bindings.length; i++)
        {
            Binding(bindings[i]).execute();
        }


    }

    /**
     * @private
     **/ 
    private var __moduleFactoryInitialized:Boolean = false;

    /**
     * @private
     * Override the module factory so we can defer setting style declarations
     * until a module factory is set. Without the correct module factory set
     * the style declaration will end up in the wrong style manager.
     **/ 
    override public function set moduleFactory(factory:IFlexModuleFactory):void
    {
        super.moduleFactory = factory;
        
        if (__moduleFactoryInitialized)
            return;

        __moduleFactoryInitialized = true;


        // our style settings



                         
    }
 
    //  initialize()
    /**
     * @private
     **/
    override public function initialize():void
    {


        super.initialize();
    }


    //  scripts
    //  end scripts


    //  supporting function definitions for properties, events, styles, effects
private function _Skin_VScrollBarInnerClass0_Rect1_c() : spark.primitives.Rect
{
	var temp : spark.primitives.Rect = new spark.primitives.Rect();
	temp.top = 0;
	temp.left = 0;
	temp.right = 0;
	temp.bottom = 0;
	temp.fill = _Skin_VScrollBarInnerClass0_SolidColor1_c();
	temp.filters = [_Skin_VScrollBarInnerClass0_DropShadowFilter1_c()];
	temp.initialized(this, null)
	return temp;
}

private function _Skin_VScrollBarInnerClass0_SolidColor1_c() : mx.graphics.SolidColor
{
	var temp : mx.graphics.SolidColor = new mx.graphics.SolidColor();
	temp.color = 14540253;
	temp.alpha = 0.8;
	return temp;
}

private function _Skin_VScrollBarInnerClass0_DropShadowFilter1_c() : spark.filters.DropShadowFilter
{
	var temp : spark.filters.DropShadowFilter = new spark.filters.DropShadowFilter();
	temp.angle = 90;
	temp.color = 3355443;
	temp.distance = 3;
	return temp;
}

private function _Skin_VScrollBarInnerClass0_Label1_i() : spark.components.Label
{
	var temp : spark.components.Label = new spark.components.Label();
	temp.horizontalCenter = 0;
	temp.verticalCenter = 1;
	temp.left = 5;
	temp.right = 5;
	temp.top = 5;
	temp.bottom = 5;
	temp.setStyle("textAlign", "center");
	temp.setStyle("verticalAlign", "middle");
	temp.setStyle("color", 0);
	temp.id = "labelField";
	if (!temp.document) temp.document = this;
	labelField = temp;
	mx.binding.BindingManager.executeBindings(this, "labelField", labelField);
	return temp;
}


    //  binding mgmt
    private function _Skin_VScrollBarInnerClass0_bindingsSetup():Array
    {
        var result:Array = [];

        result[0] = new mx.binding.Binding(this,
            null,
            null,
            "labelField.text"
            , "data");


        return result;
    }


    /**
     * @private
     **/
    public static function set watcherSetupUtil(watcherSetupUtil:IWatcherSetupUtil2):void
    {
        (Skin_VScrollBarInnerClass0)._watcherSetupUtil = watcherSetupUtil;
    }

    private static var _watcherSetupUtil:IWatcherSetupUtil2;



    //  embed carrier vars
    //  end embed carrier vars

    //  binding management vars
    /**
     * @private
     **/
    mx_internal var _bindings : Array = [];
    /**
     * @private
     **/
    mx_internal var _watchers : Array = [];
    /**
     * @private
     **/
    mx_internal var _bindingsByDestination : Object = {};
    /**
     * @private
     **/
    mx_internal var _bindingsBeginWithWord : Object = {};

//  end class def
}

//  end package def
}
