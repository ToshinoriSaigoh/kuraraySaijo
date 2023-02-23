

/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    model.plugin.report.emergency.view
 *  Class:      EmergencyHeader
 *  Source:     F:\git\KuraraySaijo\src\model\plugin\report\emergency\view\EmergencyHeader.mxml
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2023.02.23 11:36:05 JST
 */

package model.plugin.report.emergency.view
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
import model.plugin.report.emergency.EmergencyHeader;
import model.plugin.report.emergency.view.EmergencyHeaderInnerClass0;
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
import mx.styles.*;
import spark.components.DataGroup;
import spark.components.Group;
import spark.components.Label;
import spark.layouts.TileLayout;



//  begin class def
public class EmergencyHeader
    extends spark.components.Group
    implements mx.binding.IBindingClient
{

    //  instance variables
    [Bindable]
	/**
 * @private
 **/
    public var ctrlr : model.plugin.report.emergency.EmergencyHeader;

    [Bindable]
	/**
 * @private
 **/
    public var datetime : spark.components.Label;

    [Bindable]
	/**
 * @private
 **/
    public var emergencyHeadMenu : spark.components.Group;

    [Bindable]
	/**
 * @private
 **/
    public var menu : spark.components.Group;

    [Bindable]
	/**
 * @private
 **/
    public var menuList : spark.components.DataGroup;

    [Bindable]
	/**
 * @private
 **/
    public var title : spark.components.Label;


    //  type-import dummies



    //  constructor (Flex display object)
    /**
     * @private
     **/
    public function EmergencyHeader()
    {
        super();

        mx_internal::_document = this;


        var bindings:Array = _EmergencyHeader_bindingsSetup();
        var watchers:Array = [];

        var target:Object = this;

        if (_watcherSetupUtil == null)
        {
            var watcherSetupUtilClass:Object = getDefinitionByName("_model_plugin_report_emergency_view_EmergencyHeaderWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }

        _watcherSetupUtil.setup(this,
                    function(propertyName:String):* { return target[propertyName]; },
                    function(propertyName:String):* { return EmergencyHeader[propertyName]; },
                    bindings,
                    watchers);

        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);


        // layer initializers

       
        // properties
        this.percentWidth = 100.0;
        this.percentHeight = 100.0;
        this.left = 180;
        this.mouseEnabled = false;
        this.mouseChildren = true;
        this.mxmlContent = [_EmergencyHeader_Group2_i()];
        _EmergencyHeader_EmergencyHeader1_i();


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
private function _EmergencyHeader_EmergencyHeader1_i() : model.plugin.report.emergency.EmergencyHeader
{
	var temp : model.plugin.report.emergency.EmergencyHeader = new model.plugin.report.emergency.EmergencyHeader();
	temp.initialized(this, "ctrlr")
	ctrlr = temp;
	mx.binding.BindingManager.executeBindings(this, "ctrlr", ctrlr);
	return temp;
}

private function _EmergencyHeader_Group2_i() : spark.components.Group
{
	var temp : spark.components.Group = new spark.components.Group();
	temp.left = 0;
	temp.right = 0;
	temp.percentWidth = 100.0;
	temp.height = 130;
	temp.mouseEnabled = false;
	temp.mxmlContent = [_EmergencyHeader_Label1_i(), _EmergencyHeader_Label2_i(), _EmergencyHeader_Group3_i()];
	temp.id = "emergencyHeadMenu";
	if (!temp.document) temp.document = this;
	emergencyHeadMenu = temp;
	mx.binding.BindingManager.executeBindings(this, "emergencyHeadMenu", emergencyHeadMenu);
	return temp;
}

private function _EmergencyHeader_Label1_i() : spark.components.Label
{
	var temp : spark.components.Label = new spark.components.Label();
	temp.width = 310;
	temp.height = 30;
	temp.top = 60;
	temp.left = 0;
	temp.mouseEnabled = false;
	temp.setStyle("verticalAlign", "bottom");
	temp.id = "datetime";
	if (!temp.document) temp.document = this;
	datetime = temp;
	mx.binding.BindingManager.executeBindings(this, "datetime", datetime);
	return temp;
}

private function _EmergencyHeader_Label2_i() : spark.components.Label
{
	var temp : spark.components.Label = new spark.components.Label();
	temp.width = 310;
	temp.height = 100;
	temp.top = 0;
	temp.left = 0;
	temp.mouseEnabled = false;
	temp.setStyle("verticalAlign", "top");
	temp.id = "title";
	if (!temp.document) temp.document = this;
	title = temp;
	mx.binding.BindingManager.executeBindings(this, "title", title);
	return temp;
}

private function _EmergencyHeader_Group3_i() : spark.components.Group
{
	var temp : spark.components.Group = new spark.components.Group();
	temp.width = 1404;
	temp.height = 90;
	temp.top = 0;
	temp.right = 0;
	temp.mouseEnabled = false;
	temp.mxmlContent = [_EmergencyHeader_DataGroup1_i()];
	temp.id = "menu";
	if (!temp.document) temp.document = this;
	menu = temp;
	mx.binding.BindingManager.executeBindings(this, "menu", menu);
	return temp;
}

private function _EmergencyHeader_DataGroup1_i() : spark.components.DataGroup
{
	var temp : spark.components.DataGroup = new spark.components.DataGroup();
	temp.percentWidth = 100.0;
	temp.percentHeight = 100.0;
	temp.mouseEnabled = false;
	temp.layout = _EmergencyHeader_TileLayout1_c();
	temp.itemRenderer = _EmergencyHeader_ClassFactory1_c();
	temp.id = "menuList";
	if (!temp.document) temp.document = this;
	menuList = temp;
	mx.binding.BindingManager.executeBindings(this, "menuList", menuList);
	return temp;
}

private function _EmergencyHeader_TileLayout1_c() : spark.layouts.TileLayout
{
	var temp : spark.layouts.TileLayout = new spark.layouts.TileLayout();
	temp.requestedColumnCount = 5;
	temp.horizontalGap = 1;
	temp.verticalGap = 1;
	return temp;
}

private function _EmergencyHeader_ClassFactory1_c() : mx.core.ClassFactory
{
	var temp : mx.core.ClassFactory = new mx.core.ClassFactory();
	temp.generator = model.plugin.report.emergency.view.EmergencyHeaderInnerClass0;
	temp.properties = {outerDocument: this};
	return temp;
}


    //  binding mgmt
    private function _EmergencyHeader_bindingsSetup():Array
    {
        var result:Array = [];

        result[0] = new mx.binding.Binding(this,
            function():String
            {
                var result:* = (ctrlr.datetime);
                return (result == undefined ? null : String(result));
            },
            null,
            "datetime.text"
            );

        result[1] = new mx.binding.Binding(this,
            function():String
            {
                var result:* = (ctrlr.title);
                return (result == undefined ? null : String(result));
            },
            null,
            "title.text"
            );


        return result;
    }


    /**
     * @private
     **/
    public static function set watcherSetupUtil(watcherSetupUtil:IWatcherSetupUtil2):void
    {
        (EmergencyHeader)._watcherSetupUtil = watcherSetupUtil;
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