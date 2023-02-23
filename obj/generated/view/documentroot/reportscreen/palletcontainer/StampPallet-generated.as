

/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    view.documentroot.reportscreen.palletcontainer
 *  Class:      StampPallet
 *  Source:     F:\git\KuraraySaijo\src\view\documentroot\reportscreen\palletcontainer\StampPallet.mxml
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2023.02.23 11:36:05 JST
 */

package view.documentroot.reportscreen.palletcontainer
{

import controller.documentroot.reportscreen.palletcontainer.StampPallet;
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
import mx.graphics.SolidColor;
import mx.styles.*;
import spark.components.DataGroup;
import spark.components.Group;
import spark.components.HGroup;
import spark.components.Scroller;
import spark.core.SpriteVisualElement;
import spark.layouts.TileLayout;
import spark.layouts.VerticalLayout;
import spark.primitives.Rect;
import view.documentroot.reportscreen.palletcontainer.StampPalletInnerClass0;
import view.documentroot.reportscreen.palletcontainer.StampPalletInnerClass1;
import view.documentroot.reportscreen.palletcontainer.stamppallet.Skin_VScroller;



//  begin class def
public class StampPallet
    extends spark.components.Group
{

    //  instance variables
    [Bindable]
	/**
 * @private
 **/
    public var bg : spark.components.Group;

    [Bindable]
	/**
 * @private
 **/
    public var body : spark.core.SpriteVisualElement;

    [Bindable]
	/**
 * @private
 **/
    public var ctrlr : controller.documentroot.reportscreen.palletcontainer.StampPallet;

    [Bindable]
	/**
 * @private
 **/
    public var folderList : spark.components.DataGroup;

    [Bindable]
	/**
 * @private
 **/
    public var stampFolders : spark.components.Scroller;

    [Bindable]
	/**
 * @private
 **/
    public var stampList : spark.components.DataGroup;

    [Bindable]
	/**
 * @private
 **/
    public var stampListContainer : spark.components.Scroller;


    //  type-import dummies



    //  constructor (Flex display object)
    /**
     * @private
     **/
    public function StampPallet()
    {
        super();

        mx_internal::_document = this;




        // layer initializers

       
        // properties
        this.width = 800;
        this.height = 654;
        this.horizontalCenter = 0;
        this.verticalCenter = 0;
        this.mxmlContent = [_StampPallet_SpriteVisualElement1_i(), _StampPallet_Group2_i(), _StampPallet_HGroup1_c()];
        _StampPallet_StampPallet1_i();


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
private function _StampPallet_StampPallet1_i() : controller.documentroot.reportscreen.palletcontainer.StampPallet
{
	var temp : controller.documentroot.reportscreen.palletcontainer.StampPallet = new controller.documentroot.reportscreen.palletcontainer.StampPallet();
	temp.initialized(this, "ctrlr")
	ctrlr = temp;
	mx.binding.BindingManager.executeBindings(this, "ctrlr", ctrlr);
	return temp;
}

private function _StampPallet_SpriteVisualElement1_i() : spark.core.SpriteVisualElement
{
	var temp : spark.core.SpriteVisualElement = new spark.core.SpriteVisualElement();
	temp.initialized(this, "body")
	body = temp;
	mx.binding.BindingManager.executeBindings(this, "body", body);
	return temp;
}

private function _StampPallet_Group2_i() : spark.components.Group
{
	var temp : spark.components.Group = new spark.components.Group();
	temp.name = "bg";
	temp.percentWidth = 100.0;
	temp.percentHeight = 100.0;
	temp.mxmlContent = [_StampPallet_Rect1_c()];
	temp.id = "bg";
	if (!temp.document) temp.document = this;
	bg = temp;
	mx.binding.BindingManager.executeBindings(this, "bg", bg);
	return temp;
}

private function _StampPallet_Rect1_c() : spark.primitives.Rect
{
	var temp : spark.primitives.Rect = new spark.primitives.Rect();
	temp.percentWidth = 100.0;
	temp.percentHeight = 100.0;
	temp.alpha = 0.1;
	temp.left = 0;
	temp.right = 0;
	temp.top = 0;
	temp.bottom = 0;
	temp.fill = _StampPallet_SolidColor1_c();
	temp.initialized(this, null)
	return temp;
}

private function _StampPallet_SolidColor1_c() : mx.graphics.SolidColor
{
	var temp : mx.graphics.SolidColor = new mx.graphics.SolidColor();
	temp.color = 0;
	return temp;
}

private function _StampPallet_HGroup1_c() : spark.components.HGroup
{
	var temp : spark.components.HGroup = new spark.components.HGroup();
	temp.gap = 8;
	temp.top = 56;
	temp.right = 8;
	temp.bottom = 56;
	temp.left = 56;
	temp.mxmlContent = [_StampPallet_Scroller1_i(), _StampPallet_Scroller2_i()];
	if (!temp.document) temp.document = this;
	return temp;
}

private function _StampPallet_Scroller1_i() : spark.components.Scroller
{
	var temp : spark.components.Scroller = new spark.components.Scroller();
	temp.width = 272;
	temp.viewport = _StampPallet_DataGroup1_i();
	temp.setStyle("skinClass", view.documentroot.reportscreen.palletcontainer.stamppallet.Skin_VScroller);
	temp.id = "stampFolders";
	if (!temp.document) temp.document = this;
	stampFolders = temp;
	mx.binding.BindingManager.executeBindings(this, "stampFolders", stampFolders);
	return temp;
}

private function _StampPallet_DataGroup1_i() : spark.components.DataGroup
{
	var temp : spark.components.DataGroup = new spark.components.DataGroup();
	temp.name = "folderList";
	temp.width = 224;
	temp.height = 542;
	temp.layout = _StampPallet_VerticalLayout1_c();
	temp.itemRenderer = _StampPallet_ClassFactory1_c();
	temp.id = "folderList";
	if (!temp.document) temp.document = this;
	folderList = temp;
	mx.binding.BindingManager.executeBindings(this, "folderList", folderList);
	return temp;
}

private function _StampPallet_VerticalLayout1_c() : spark.layouts.VerticalLayout
{
	var temp : spark.layouts.VerticalLayout = new spark.layouts.VerticalLayout();
	temp.gap = 2;
	return temp;
}

private function _StampPallet_ClassFactory1_c() : mx.core.ClassFactory
{
	var temp : mx.core.ClassFactory = new mx.core.ClassFactory();
	temp.generator = view.documentroot.reportscreen.palletcontainer.StampPalletInnerClass0;
	temp.properties = {outerDocument: this};
	return temp;
}

private function _StampPallet_Scroller2_i() : spark.components.Scroller
{
	var temp : spark.components.Scroller = new spark.components.Scroller();
	temp.viewport = _StampPallet_DataGroup2_i();
	temp.setStyle("skinClass", view.documentroot.reportscreen.palletcontainer.stamppallet.Skin_VScroller);
	temp.id = "stampListContainer";
	if (!temp.document) temp.document = this;
	stampListContainer = temp;
	mx.binding.BindingManager.executeBindings(this, "stampListContainer", stampListContainer);
	return temp;
}

private function _StampPallet_DataGroup2_i() : spark.components.DataGroup
{
	var temp : spark.components.DataGroup = new spark.components.DataGroup();
	temp.width = 406;
	temp.height = 542;
	temp.layout = _StampPallet_TileLayout1_c();
	temp.itemRenderer = _StampPallet_ClassFactory2_c();
	temp.id = "stampList";
	if (!temp.document) temp.document = this;
	stampList = temp;
	mx.binding.BindingManager.executeBindings(this, "stampList", stampList);
	return temp;
}

private function _StampPallet_TileLayout1_c() : spark.layouts.TileLayout
{
	var temp : spark.layouts.TileLayout = new spark.layouts.TileLayout();
	temp.horizontalGap = 2;
	temp.verticalGap = 2;
	return temp;
}

private function _StampPallet_ClassFactory2_c() : mx.core.ClassFactory
{
	var temp : mx.core.ClassFactory = new mx.core.ClassFactory();
	temp.generator = view.documentroot.reportscreen.palletcontainer.StampPalletInnerClass1;
	temp.properties = {outerDocument: this};
	return temp;
}





    //  embed carrier vars
    //  end embed carrier vars


//  end class def
}

//  end package def
}
