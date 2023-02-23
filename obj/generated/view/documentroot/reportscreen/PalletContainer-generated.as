

/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    view.documentroot.reportscreen
 *  Class:      PalletContainer
 *  Source:     F:\git\KuraraySaijo\src\view\documentroot\reportscreen\PalletContainer.mxml
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2023.02.23 11:36:05 JST
 */

package view.documentroot.reportscreen
{

import controller.documentroot.reportscreen.PalletContainer;
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
import spark.components.Group;
import spark.core.SpriteVisualElement;
import view.documentroot.reportscreen.palletcontainer.ColorPallet;
import view.documentroot.reportscreen.palletcontainer.StampPallet;
import view.documentroot.reportscreen.palletcontainer.TimelinePallet;



//  begin class def
public class PalletContainer
    extends spark.components.Group
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
    public var colorPallet : view.documentroot.reportscreen.palletcontainer.ColorPallet;

    [Bindable]
	/**
 * @private
 **/
    public var ctrlr : controller.documentroot.reportscreen.PalletContainer;

    [Bindable]
	/**
 * @private
 **/
    public var stampPallet : view.documentroot.reportscreen.palletcontainer.StampPallet;

    [Bindable]
	/**
 * @private
 **/
    public var timelinePallet : view.documentroot.reportscreen.palletcontainer.TimelinePallet;


    //  type-import dummies



    //  constructor (Flex display object)
    /**
     * @private
     **/
    public function PalletContainer()
    {
        super();

        mx_internal::_document = this;




        // layer initializers

       
        // properties
        this.mxmlContent = [_PalletContainer_SpriteVisualElement1_i(), _PalletContainer_ColorPallet1_i(), _PalletContainer_StampPallet1_i(), _PalletContainer_TimelinePallet1_i()];
        _PalletContainer_PalletContainer1_i();


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
private function _PalletContainer_PalletContainer1_i() : controller.documentroot.reportscreen.PalletContainer
{
	var temp : controller.documentroot.reportscreen.PalletContainer = new controller.documentroot.reportscreen.PalletContainer();
	temp.initialized(this, "ctrlr")
	ctrlr = temp;
	mx.binding.BindingManager.executeBindings(this, "ctrlr", ctrlr);
	return temp;
}

private function _PalletContainer_SpriteVisualElement1_i() : spark.core.SpriteVisualElement
{
	var temp : spark.core.SpriteVisualElement = new spark.core.SpriteVisualElement();
	temp.initialized(this, "body")
	body = temp;
	mx.binding.BindingManager.executeBindings(this, "body", body);
	return temp;
}

private function _PalletContainer_ColorPallet1_i() : view.documentroot.reportscreen.palletcontainer.ColorPallet
{
	var temp : view.documentroot.reportscreen.palletcontainer.ColorPallet = new view.documentroot.reportscreen.palletcontainer.ColorPallet();
	temp.name = "colorPallet";
	temp.visible = false;
	temp.id = "colorPallet";
	if (!temp.document) temp.document = this;
	colorPallet = temp;
	mx.binding.BindingManager.executeBindings(this, "colorPallet", colorPallet);
	return temp;
}

private function _PalletContainer_StampPallet1_i() : view.documentroot.reportscreen.palletcontainer.StampPallet
{
	var temp : view.documentroot.reportscreen.palletcontainer.StampPallet = new view.documentroot.reportscreen.palletcontainer.StampPallet();
	temp.name = "stampPallet";
	temp.visible = false;
	temp.id = "stampPallet";
	if (!temp.document) temp.document = this;
	stampPallet = temp;
	mx.binding.BindingManager.executeBindings(this, "stampPallet", stampPallet);
	return temp;
}

private function _PalletContainer_TimelinePallet1_i() : view.documentroot.reportscreen.palletcontainer.TimelinePallet
{
	var temp : view.documentroot.reportscreen.palletcontainer.TimelinePallet = new view.documentroot.reportscreen.palletcontainer.TimelinePallet();
	temp.name = "timelinePallet";
	temp.visible = false;
	temp.id = "timelinePallet";
	if (!temp.document) temp.document = this;
	timelinePallet = temp;
	mx.binding.BindingManager.executeBindings(this, "timelinePallet", timelinePallet);
	return temp;
}





    //  embed carrier vars
    //  end embed carrier vars


//  end class def
}

//  end package def
}
