

/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    view.utils.button
 *  Class:      Skin_SaveReportBtn
 *  Source:     F:\git\KuraraySaijo\src\view\utils\button\Skin_SaveReportBtn.mxml
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2023.02.23 11:36:22 JST
 */

package view.utils.button
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
import view.utils.Skin_BtnCircle;



//  begin class def
public class Skin_SaveReportBtn
    extends view.utils.Skin_BtnCircle
{

    //  instance variables

    //  type-import dummies



    //  constructor (Flex display object)
    /**
     * @private
     **/
    public function Skin_SaveReportBtn()
    {
        super();

        mx_internal::_document = this;




        // layer initializers

       
        // properties
        this.top = 0;
        this.bottom = 0;
        this.width = 44;
        this.height = 44;


        // events
        this.addEventListener("creationComplete", ___Skin_SaveReportBtn_Skin_BtnCircle1_creationComplete);












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
    //  <Script>, line 12 - 19

		private function _init(): void
		{
			[Embed(source = "icon_file_save.svg", mimeType="application/octet-stream")]
			var Svg: Class;
			setSvg(Svg, "icon");
		}
	

    //  end scripts


    //  supporting function definitions for properties, events, styles, effects
/**
 * @private
 **/
public function ___Skin_SaveReportBtn_Skin_BtnCircle1_creationComplete(event:mx.events.FlexEvent):void
{
	_init()
}





    //  embed carrier vars
    //  end embed carrier vars


//  end class def
}

//  end package def
}
