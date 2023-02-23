

/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    kuraraysaijo.view.documentroot
 *  Class:      InitScreen
 *  Source:     F:\git\KuraraySaijo\src\kuraraysaijo\view\documentroot\InitScreen.mxml
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2023.02.23 11:36:05 JST
 */

package kuraraysaijo.view.documentroot
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
import kuraraysaijo.controller.documentroot.InitScreen;
import mx.binding.*;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromClass;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IDeferredInstance;
import mx.core.IFactory;
import mx.core.IFlexModuleFactory;
import mx.core.IPropertyChangeNotifier;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.filters.*;
import mx.styles.*;
import spark.components.Group;
import spark.components.NavigatorContent;
import spark.core.SpriteVisualElement;



//  begin class def
public class InitScreen
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
    public var ctrlr : kuraraysaijo.controller.documentroot.InitScreen;

    [Bindable]
	/**
 * @private
 **/
    public var logo : spark.components.Group;

    [Bindable]
	/**
 * @private
 **/
    public var panel : spark.components.Group;


    //  type-import dummies



    //  constructor (Flex display object)
    /**
     * @private
     **/
    public function InitScreen()
    {
        super();

        mx_internal::_document = this;




        // layer initializers

       
        // properties
        this.mxmlContentFactory = new mx.core.DeferredInstanceFromFunction(_InitScreen_Array1_c);
        _InitScreen_InitScreen1_i();


        // events
        this.addEventListener("creationComplete", ___InitScreen_NavigatorContent1_creationComplete);












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
    //  <Script>, line 12 - 20

		include "../../../view/utils/includes/SvgFuncs.as";
		private function _init(): void
		{
			[Embed(source = "logo.svg", mimeType="application/octet-stream")]
			var Svg: Class;
			setSvg(Svg, "logo");
		}
	

    //  end scripts


    //  supporting function definitions for properties, events, styles, effects
private function _InitScreen_InitScreen1_i() : kuraraysaijo.controller.documentroot.InitScreen
{
	var temp : kuraraysaijo.controller.documentroot.InitScreen = new kuraraysaijo.controller.documentroot.InitScreen();
	temp.initialized(this, "ctrlr")
	ctrlr = temp;
	mx.binding.BindingManager.executeBindings(this, "ctrlr", ctrlr);
	return temp;
}

private function _InitScreen_Array1_c() : Array
{
	var temp : Array = [_InitScreen_SpriteVisualElement1_i(), _InitScreen_Group1_i(), _InitScreen_Group2_i()];
	return temp;
}

private function _InitScreen_SpriteVisualElement1_i() : spark.core.SpriteVisualElement
{
	var temp : spark.core.SpriteVisualElement = new spark.core.SpriteVisualElement();
	temp.initialized(this, "body")
	body = temp;
	mx.binding.BindingManager.executeBindings(this, "body", body);
	return temp;
}

private function _InitScreen_Group1_i() : spark.components.Group
{
	var temp : spark.components.Group = new spark.components.Group();
	temp.percentWidth = 100.0;
	temp.percentHeight = 100.0;
	temp.id = "panel";
	if (!temp.document) temp.document = this;
	panel = temp;
	mx.binding.BindingManager.executeBindings(this, "panel", panel);
	return temp;
}

private function _InitScreen_Group2_i() : spark.components.Group
{
	var temp : spark.components.Group = new spark.components.Group();
	temp.width = 400;
	temp.height = 300;
	temp.horizontalCenter = 0;
	temp.verticalCenter = 0;
	temp.id = "logo";
	if (!temp.document) temp.document = this;
	logo = temp;
	mx.binding.BindingManager.executeBindings(this, "logo", logo);
	return temp;
}

/**
 * @private
 **/
public function ___InitScreen_NavigatorContent1_creationComplete(event:mx.events.FlexEvent):void
{
	_init()
}





    //  embed carrier vars
    //  end embed carrier vars


//  end class def
}

//  end package def
}
