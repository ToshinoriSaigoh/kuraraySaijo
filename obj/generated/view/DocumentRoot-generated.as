

/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    view
 *  Class:      DocumentRoot
 *  Source:     F:\git\KuraraySaijo\src\view\DocumentRoot.mxml
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2023.02.23 11:36:05 JST
 */

package view
{

import controller.App;
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
import mx.events.FlexEvent;
import mx.filters.*;
import mx.styles.*;
import spark.components.Application;
import spark.layouts.BasicLayout;



//  begin class def
public class DocumentRoot
    extends spark.components.Application
{

    //  instance variables
    [Bindable]
	/**
 * @private
 **/
    public var ctrlr : controller.App;


    //  type-import dummies



    //  constructor (Flex display object)
    /**
     * @private
     **/
    public function DocumentRoot()
    {
        super();

        mx_internal::_document = this;




        // layer initializers

       
        // properties
        this.percentWidth = 100.0;
        this.percentHeight = 100.0;
        this.layout = _DocumentRoot_BasicLayout1_c();
        _DocumentRoot_App1_i();


        // events
        this.addEventListener("applicationComplete", ___DocumentRoot_Application1_applicationComplete);












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
    //  <Script>, line 13 - 20

		import model.*;
		private function _init(): void
		{
			//stage.align = "TOP_LEFT";
			//stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		}
	

    //  end scripts


    //  supporting function definitions for properties, events, styles, effects
private function _DocumentRoot_App1_i() : controller.App
{
	var temp : controller.App = new controller.App();
	temp.initialized(this, "ctrlr")
	ctrlr = temp;
	mx.binding.BindingManager.executeBindings(this, "ctrlr", ctrlr);
	return temp;
}

private function _DocumentRoot_BasicLayout1_c() : spark.layouts.BasicLayout
{
	var temp : spark.layouts.BasicLayout = new spark.layouts.BasicLayout();
	return temp;
}

/**
 * @private
 **/
public function ___DocumentRoot_Application1_applicationComplete(event:mx.events.FlexEvent):void
{
	_init()
}





    //  embed carrier vars
    //  end embed carrier vars


//  end class def
}

//  end package def
}
