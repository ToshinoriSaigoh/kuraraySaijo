

/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    kuraraysaijo.view.documentroot.reportscreen.sidebar
 *  Class:      SettingsBox
 *  Source:     F:\git\KuraraySaijo\src\kuraraysaijo\view\documentroot\reportscreen\sidebar\SettingsBox.mxml
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2023.02.23 11:36:05 JST
 */

package kuraraysaijo.view.documentroot.reportscreen.sidebar
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
import kuraraysaijo.controller.documentroot.reportscreen.sidebar.SettingsBox;
import kuraraysaijo.view.documentroot.reportscreen.sidebar.settingsbox.SettingsKuraraySaijoContainer;
import mx.binding.*;
import mx.containers.ViewStack;
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
import spark.components.Button;
import spark.components.Group;
import spark.components.Label;
import spark.components.NavigatorContent;
import spark.core.SpriteVisualElement;
import spark.layouts.BasicLayout;
import view.documentroot.reportscreen.sidebar.settingsbox.Skin_CloseBtn;



//  begin class def
public class SettingsBox
    extends spark.components.NavigatorContent
{

    //  instance variables
    [Bindable]
	/**
 * @private
 **/
    public var body : spark.core.SpriteVisualElement;

    [Bindable]
	/**
 * @private
 **/
    public var closeBtn : spark.components.Button;

    [Bindable]
	/**
 * @private
 **/
    public var ctrlr : kuraraysaijo.controller.documentroot.reportscreen.sidebar.SettingsBox;

    [Bindable]
	/**
 * @private
 **/
    public var header : spark.components.Group;

    [Bindable]
	/**
 * @private
 **/
    public var headerLabel : spark.components.Label;

    [Bindable]
	/**
 * @private
 **/
    public var settingsKuraraySaijoContainer : kuraraysaijo.view.documentroot.reportscreen.sidebar.settingsbox.SettingsKuraraySaijoContainer;

    [Bindable]
	/**
 * @private
 **/
    public var settingsViewStack : mx.containers.ViewStack;


    //  type-import dummies



    //  constructor (Flex display object)
    /**
     * @private
     **/
    public function SettingsBox()
    {
        super();

        mx_internal::_document = this;




        // layer initializers

       
        // properties
        this.percentHeight = 100.0;
        this.mxmlContentFactory = new mx.core.DeferredInstanceFromFunction(_SettingsBox_Array1_c);
        _SettingsBox_SettingsBox1_i();


        // events












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
private function _SettingsBox_SettingsBox1_i() : kuraraysaijo.controller.documentroot.reportscreen.sidebar.SettingsBox
{
	var temp : kuraraysaijo.controller.documentroot.reportscreen.sidebar.SettingsBox = new kuraraysaijo.controller.documentroot.reportscreen.sidebar.SettingsBox();
	temp.initialized(this, "ctrlr")
	ctrlr = temp;
	mx.binding.BindingManager.executeBindings(this, "ctrlr", ctrlr);
	return temp;
}

private function _SettingsBox_Array1_c() : Array
{
	var temp : Array = [_SettingsBox_SpriteVisualElement1_i(), _SettingsBox_Group1_c()];
	return temp;
}

private function _SettingsBox_SpriteVisualElement1_i() : spark.core.SpriteVisualElement
{
	var temp : spark.core.SpriteVisualElement = new spark.core.SpriteVisualElement();
	temp.initialized(this, "body")
	body = temp;
	mx.binding.BindingManager.executeBindings(this, "body", body);
	return temp;
}

private function _SettingsBox_Group1_c() : spark.components.Group
{
	var temp : spark.components.Group = new spark.components.Group();
	temp.percentWidth = 100.0;
	temp.percentHeight = 100.0;
	temp.layout = _SettingsBox_BasicLayout1_c();
	temp.mxmlContent = [_SettingsBox_Group2_i(), _SettingsBox_ViewStack1_i()];
	if (!temp.document) temp.document = this;
	return temp;
}

private function _SettingsBox_BasicLayout1_c() : spark.layouts.BasicLayout
{
	var temp : spark.layouts.BasicLayout = new spark.layouts.BasicLayout();
	return temp;
}

private function _SettingsBox_Group2_i() : spark.components.Group
{
	var temp : spark.components.Group = new spark.components.Group();
	temp.left = 0;
	temp.percentWidth = 100.0;
	temp.mxmlContent = [_SettingsBox_Label1_i(), _SettingsBox_Button1_i()];
	temp.id = "header";
	if (!temp.document) temp.document = this;
	header = temp;
	mx.binding.BindingManager.executeBindings(this, "header", header);
	return temp;
}

private function _SettingsBox_Label1_i() : spark.components.Label
{
	var temp : spark.components.Label = new spark.components.Label();
	temp.width = 600;
	temp.height = 88;
	temp.styleName = "textMedium";
	temp.setStyle("verticalAlign", "middle");
	temp.id = "headerLabel";
	if (!temp.document) temp.document = this;
	headerLabel = temp;
	mx.binding.BindingManager.executeBindings(this, "headerLabel", headerLabel);
	return temp;
}

private function _SettingsBox_Button1_i() : spark.components.Button
{
	var temp : spark.components.Button = new spark.components.Button();
	temp.name = "closeBtn";
	temp.top = 4;
	temp.right = 12;
	temp.width = 88;
	temp.height = 88;
	temp.setStyle("skinClass", view.documentroot.reportscreen.sidebar.settingsbox.Skin_CloseBtn);
	temp.id = "closeBtn";
	if (!temp.document) temp.document = this;
	closeBtn = temp;
	mx.binding.BindingManager.executeBindings(this, "closeBtn", closeBtn);
	return temp;
}

private function _SettingsBox_ViewStack1_i() : mx.containers.ViewStack
{
	var temp : mx.containers.ViewStack = new mx.containers.ViewStack();
	temp.top = 192;
	temp.left = 112;
	temp.percentHeight = 100.0;
	temp.id = "settingsViewStack";
	if (!temp.document) temp.document = this;
	temp.mx_internal::_documentDescriptor = 
		new mx.core.UIComponentDescriptor({
		  type: mx.containers.ViewStack
		  ,
		  id: "settingsViewStack"
		  ,
		  propertiesFactory: function():Object { return {
		    childDescriptors: [
		      new mx.core.UIComponentDescriptor({
		        type: kuraraysaijo.view.documentroot.reportscreen.sidebar.settingsbox.SettingsKuraraySaijoContainer
		        ,
		        id: "settingsKuraraySaijoContainer"
		        ,
		        propertiesFactory: function():Object { return {
		          name: "settingsKuraraySaijoContainer"
		        }}
		      })
		    ]
		  }}
		})
	;
	temp.mx_internal::_documentDescriptor.document = this;
	settingsViewStack = temp;
	mx.binding.BindingManager.executeBindings(this, "settingsViewStack", settingsViewStack);
	return temp;
}





    //  embed carrier vars
    //  end embed carrier vars


//  end class def
}

//  end package def
}
