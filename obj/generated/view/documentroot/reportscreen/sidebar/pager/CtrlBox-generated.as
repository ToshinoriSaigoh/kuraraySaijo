

/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    view.documentroot.reportscreen.sidebar.pager
 *  Class:      CtrlBox
 *  Source:     F:\git\KuraraySaijo\src\view\documentroot\reportscreen\sidebar\pager\CtrlBox.mxml
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2023.02.23 11:36:22 JST
 */

package view.documentroot.reportscreen.sidebar.pager
{

import controller.documentroot.reportscreen.sidebar.pager.CtrlBox;
import flash.accessibility.*;
import flash.data.*;
import flash.debugger.*;
import flash.desktop.*;
import flash.display.*;
import flash.errors.*;
import flash.events.*;
import flash.events.MouseEvent;
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
import mx.core.IStateClient2;
import mx.core.mx_internal;
import mx.filters.*;
import mx.graphics.SolidColor;
import mx.states.SetProperty;
import mx.states.State;
import mx.styles.*;
import spark.components.Button;
import spark.components.DataGroup;
import spark.components.Group;
import spark.components.Scroller;
import spark.components.VGroup;
import spark.core.SpriteVisualElement;
import spark.layouts.VerticalLayout;
import spark.primitives.Rect;
import view.documentroot.reportscreen.sidebar.pager.CtrlBoxInnerClass0;
import view.documentroot.reportscreen.sidebar.pager.Skin_AddLayerBtn;
import view.documentroot.reportscreen.sidebar.pager.Skin_CtrlBoxThumbBtn;
import view.documentroot.reportscreen.sidebar.pager.Skin_VScroller;


[States("default", "thumb", "layer")]

//  begin class def
public class CtrlBox
    extends spark.components.Group
    implements mx.binding.IBindingClient, mx.core.IStateClient2
{

    //  instance variables
    [Bindable]
/**
 * @private
 **/
    public var _CtrlBox_SetProperty1 : mx.states.SetProperty;

    [Bindable]
	/**
 * @private
 **/
    public var addLayer : spark.components.Button;

    [Bindable]
	/**
 * @private
 **/
    public var body : spark.core.SpriteVisualElement;

    [Bindable]
	/**
 * @private
 **/
    public var ctrlr : controller.documentroot.reportscreen.sidebar.pager.CtrlBox;

    [Bindable]
	/**
 * @private
 **/
    public var layerBox : spark.components.VGroup;

    [Bindable]
	/**
 * @private
 **/
    public var layerBoxFooter : spark.components.Group;

    [Bindable]
	/**
 * @private
 **/
    public var layerListBox : spark.components.Scroller;

    [Bindable]
	/**
 * @private
 **/
    public var layerListData : spark.components.DataGroup;

    [Bindable]
	/**
 * @private
 **/
    public var thumbBox : spark.components.Button;


    //  type-import dummies



    //  constructor (Flex display object)
    /**
     * @private
     **/
    public function CtrlBox()
    {
        super();

        mx_internal::_document = this;


        var bindings:Array = _CtrlBox_bindingsSetup();
        var watchers:Array = [];

        var target:Object = this;

        if (_watcherSetupUtil == null)
        {
            var watcherSetupUtilClass:Object = getDefinitionByName("_view_documentroot_reportscreen_sidebar_pager_CtrlBoxWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }

        _watcherSetupUtil.setup(this,
                    function(propertyName:String):* { return target[propertyName]; },
                    function(propertyName:String):* { return CtrlBox[propertyName]; },
                    bindings,
                    watchers);

        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);


        // layer initializers

       
        // properties
        this.width = 0;
        this.height = 0;
        this.currentState = "default";
        this.mxmlContent = [_CtrlBox_Button1_i(), _CtrlBox_Group2_c(), _CtrlBox_SpriteVisualElement1_i()];
        _CtrlBox_CtrlBox1_i();


        // events



		states = [
		  new State ({
		    name: "default",
		    overrides: [
		      new mx.states.SetProperty().initializeFromObject({
		        name: "width",
		        value: 0
		      })
		      ,
		      new mx.states.SetProperty().initializeFromObject({
		        name: "height",
		        value: 0
		      })
		    ]
		  })
		  ,
		  new State ({
		    name: "thumb",
		    overrides: [
		      new mx.states.SetProperty().initializeFromObject({
		        name: "width",
		        value: 240
		      })
		      ,
		      new mx.states.SetProperty().initializeFromObject({
		        name: "height",
		        value: 170
		      })
		      ,
		      new mx.states.SetProperty().initializeFromObject({
		        target: "thumbBox",
		        name: "visible",
		        value: true
		      })
		    ]
		  })
		  ,
		  new State ({
		    name: "layer",
		    overrides: [
		      new mx.states.SetProperty().initializeFromObject({
		        name: "width",
		        value: 240
		      })
		      ,
		      _CtrlBox_SetProperty1 = mx.states.SetProperty( new mx.states.SetProperty().initializeFromObject({
		        name: "height",
		        value: undefined
		      }))
		      ,
		      new mx.states.SetProperty().initializeFromObject({
		        target: "layerBox",
		        name: "visible",
		        value: true
		      })
		    ]
		  })
		];


		mx.binding.BindingManager.executeBindings(this, "_CtrlBox_SetProperty1", _CtrlBox_SetProperty1);





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
private function _CtrlBox_CtrlBox1_i() : controller.documentroot.reportscreen.sidebar.pager.CtrlBox
{
	var temp : controller.documentroot.reportscreen.sidebar.pager.CtrlBox = new controller.documentroot.reportscreen.sidebar.pager.CtrlBox();
	temp.initialized(this, "ctrlr")
	ctrlr = temp;
	mx.binding.BindingManager.executeBindings(this, "ctrlr", ctrlr);
	return temp;
}

private function _CtrlBox_Button1_i() : spark.components.Button
{
	var temp : spark.components.Button = new spark.components.Button();
	temp.visible = false;
	temp.setStyle("skinClass", view.documentroot.reportscreen.sidebar.pager.Skin_CtrlBoxThumbBtn);
	temp.id = "thumbBox";
	if (!temp.document) temp.document = this;
	thumbBox = temp;
	mx.binding.BindingManager.executeBindings(this, "thumbBox", thumbBox);
	return temp;
}

private function _CtrlBox_Group2_c() : spark.components.Group
{
	var temp : spark.components.Group = new spark.components.Group();
	temp.width = 240;
	temp.mouseEnabled = false;
	temp.mxmlContent = [_CtrlBox_VGroup1_i()];
	if (!temp.document) temp.document = this;
	return temp;
}

private function _CtrlBox_VGroup1_i() : spark.components.VGroup
{
	var temp : spark.components.VGroup = new spark.components.VGroup();
	temp.mouseEnabled = false;
	temp.visible = false;
	temp.width = 240;
	temp.gap = 0;
	temp.mxmlContent = [_CtrlBox_Group3_i(), _CtrlBox_Scroller1_i()];
	temp.id = "layerBox";
	if (!temp.document) temp.document = this;
	layerBox = temp;
	mx.binding.BindingManager.executeBindings(this, "layerBox", layerBox);
	return temp;
}

private function _CtrlBox_Group3_i() : spark.components.Group
{
	var temp : spark.components.Group = new spark.components.Group();
	temp.mouseEnabled = false;
	temp.percentWidth = 100.0;
	temp.height = 46;
	temp.mxmlContent = [_CtrlBox_Rect1_c(), _CtrlBox_Button2_i()];
	temp.id = "layerBoxFooter";
	if (!temp.document) temp.document = this;
	layerBoxFooter = temp;
	mx.binding.BindingManager.executeBindings(this, "layerBoxFooter", layerBoxFooter);
	return temp;
}

private function _CtrlBox_Rect1_c() : spark.primitives.Rect
{
	var temp : spark.primitives.Rect = new spark.primitives.Rect();
	temp.width = 248;
	temp.height = 44;
	temp.alpha = 0.9;
	temp.fill = _CtrlBox_SolidColor1_c();
	temp.initialized(this, null)
	return temp;
}

private function _CtrlBox_SolidColor1_c() : mx.graphics.SolidColor
{
	var temp : mx.graphics.SolidColor = new mx.graphics.SolidColor();
	temp.color = 52462;
	return temp;
}

private function _CtrlBox_Button2_i() : spark.components.Button
{
	var temp : spark.components.Button = new spark.components.Button();
	temp.verticalCenter = 0;
	temp.horizontalCenter = 0;
	temp.setStyle("skinClass", view.documentroot.reportscreen.sidebar.pager.Skin_AddLayerBtn);
	temp.addEventListener("click", __addLayer_click);
	temp.id = "addLayer";
	if (!temp.document) temp.document = this;
	addLayer = temp;
	mx.binding.BindingManager.executeBindings(this, "addLayer", addLayer);
	return temp;
}

/**
 * @private
 **/
public function __addLayer_click(event:flash.events.MouseEvent):void
{
	ctrlr.addLayerBtnClickHandler()
}

private function _CtrlBox_Scroller1_i() : spark.components.Scroller
{
	var temp : spark.components.Scroller = new spark.components.Scroller();
	temp.top = 0;
	temp.percentWidth = 100.0;
	temp.viewport = _CtrlBox_DataGroup1_i();
	temp.setStyle("skinClass", view.documentroot.reportscreen.sidebar.pager.Skin_VScroller);
	temp.id = "layerListBox";
	if (!temp.document) temp.document = this;
	layerListBox = temp;
	mx.binding.BindingManager.executeBindings(this, "layerListBox", layerListBox);
	return temp;
}

private function _CtrlBox_DataGroup1_i() : spark.components.DataGroup
{
	var temp : spark.components.DataGroup = new spark.components.DataGroup();
	temp.mouseEnabled = false;
	temp.layout = _CtrlBox_VerticalLayout1_c();
	temp.itemRenderer = _CtrlBox_ClassFactory1_c();
	temp.id = "layerListData";
	if (!temp.document) temp.document = this;
	layerListData = temp;
	mx.binding.BindingManager.executeBindings(this, "layerListData", layerListData);
	return temp;
}

private function _CtrlBox_VerticalLayout1_c() : spark.layouts.VerticalLayout
{
	var temp : spark.layouts.VerticalLayout = new spark.layouts.VerticalLayout();
	temp.gap = 0;
	return temp;
}

private function _CtrlBox_ClassFactory1_c() : mx.core.ClassFactory
{
	var temp : mx.core.ClassFactory = new mx.core.ClassFactory();
	temp.generator = view.documentroot.reportscreen.sidebar.pager.CtrlBoxInnerClass0;
	temp.properties = {outerDocument: this};
	return temp;
}

private function _CtrlBox_SpriteVisualElement1_i() : spark.core.SpriteVisualElement
{
	var temp : spark.core.SpriteVisualElement = new spark.core.SpriteVisualElement();
	temp.initialized(this, "body")
	body = temp;
	mx.binding.BindingManager.executeBindings(this, "body", body);
	return temp;
}


    //  binding mgmt
    private function _CtrlBox_bindingsSetup():Array
    {
        var result:Array = [];

        result[0] = new mx.binding.Binding(this,
            function():*
            {

                return (layerBox.height);
            },
            null,
            "_CtrlBox_SetProperty1.value"
            );


        return result;
    }


    /**
     * @private
     **/
    public static function set watcherSetupUtil(watcherSetupUtil:IWatcherSetupUtil2):void
    {
        (CtrlBox)._watcherSetupUtil = watcherSetupUtil;
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
