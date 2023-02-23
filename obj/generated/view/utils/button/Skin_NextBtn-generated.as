

/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    view.utils.button
 *  Class:      Skin_NextBtn
 *  Source:     F:\git\KuraraySaijo\src\view\utils\button\Skin_NextBtn.mxml
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2023.02.23 11:36:21 JST
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
import mx.events.FlexEvent;
import mx.filters.*;
import mx.graphics.SolidColor;
import mx.graphics.SolidColorStroke;
import mx.states.SetProperty;
import mx.states.State;
import mx.styles.*;
import spark.components.Group;
import spark.components.Label;
import spark.primitives.Ellipse;
import view.utils.Skin_BtnCircle;


[States("up", "over", "down", "disabled")]

//  begin class def
public class Skin_NextBtn
    extends view.utils.Skin_BtnCircle
    implements mx.binding.IBindingClient, mx.core.IStateClient2
{

    //  instance variables
    [Inspectable]
    [Bindable]
/**
 * @private
 **/
    public var _Skin_NextBtn_SolidColor1 : mx.graphics.SolidColor;

    [Bindable]
	/**
 * @private
 **/
    public var label : spark.components.Label;


    //  type-import dummies



    //  constructor (Flex display object)
    /**
     * @private
     **/
    public function Skin_NextBtn()
    {
        super();

        mx_internal::_document = this;


        var bindings:Array = _Skin_NextBtn_bindingsSetup();
        var watchers:Array = [];

        var target:Object = this;

        if (_watcherSetupUtil == null)
        {
            var watcherSetupUtilClass:Object = getDefinitionByName("_view_utils_button_Skin_NextBtnWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }

        _watcherSetupUtil.setup(this,
                    function(propertyName:String):* { return target[propertyName]; },
                    function(propertyName:String):* { return Skin_NextBtn[propertyName]; },
                    bindings,
                    watchers);

        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);


        // layer initializers

       
        // properties
        this.top = 0;
        this.bottom = 0;
        this.width = 44;
        this.height = 44;
        this.mxmlContent = [_Skin_NextBtn_Ellipse1_i(), _Skin_NextBtn_Group1_i(), _Skin_NextBtn_Ellipse2_i(), _Skin_NextBtn_Label1_i()];
        this.currentState = "up";


        // events
        this.addEventListener("creationComplete", ___Skin_NextBtn_Skin_BtnCircle1_creationComplete);



		states = [
		  new State ({
		    name: "up",
		    overrides: [
		    ]
		  })
		  ,
		  new State ({
		    name: "over",
		    overrides: [
		      new mx.states.SetProperty().initializeFromObject({
		        target: "_Skin_NextBtn_SolidColor1",
		        name: "color",
		        value: 0
		      })
		    ]
		  })
		  ,
		  new State ({
		    name: "down",
		    overrides: [
		      new mx.states.SetProperty().initializeFromObject({
		        target: "border",
		        name: "alpha",
		        value: 1.0
		      })
		    ]
		  })
		  ,
		  new State ({
		    name: "disabled",
		    overrides: [
		    ]
		  })
		];







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
    //  <Script>, line 12 - 19

		private function _init(): void
		{
			[Embed(source = "icon_btn_right_white.svg", mimeType="application/octet-stream")]
			var Svg: Class;
			setSvg(Svg, "icon");
		}
	

    //  end scripts


    //  supporting function definitions for properties, events, styles, effects
private function _Skin_NextBtn_Ellipse1_i() : spark.primitives.Ellipse
{
	var temp : spark.primitives.Ellipse = new spark.primitives.Ellipse();
	temp.left = 0;
	temp.right = 0;
	temp.top = 0;
	temp.bottom = 0;
	temp.alpha = 1.0;
	temp.fill = _Skin_NextBtn_SolidColor1_i();
	temp.initialized(this, "bg")
	bg = temp;
	mx.binding.BindingManager.executeBindings(this, "bg", bg);
	return temp;
}

private function _Skin_NextBtn_SolidColor1_i() : mx.graphics.SolidColor
{
	var temp : mx.graphics.SolidColor = new mx.graphics.SolidColor();
	temp.color = 2236962;
	_Skin_NextBtn_SolidColor1 = temp;
	mx.binding.BindingManager.executeBindings(this, "_Skin_NextBtn_SolidColor1", _Skin_NextBtn_SolidColor1);
	return temp;
}

private function _Skin_NextBtn_Group1_i() : spark.components.Group
{
	var temp : spark.components.Group = new spark.components.Group();
	temp.percentWidth = 100.0;
	temp.percentHeight = 100.0;
	temp.id = "icon";
	if (!temp.document) temp.document = this;
	icon = temp;
	mx.binding.BindingManager.executeBindings(this, "icon", icon);
	return temp;
}

private function _Skin_NextBtn_Ellipse2_i() : spark.primitives.Ellipse
{
	var temp : spark.primitives.Ellipse = new spark.primitives.Ellipse();
	temp.left = 0;
	temp.right = 0;
	temp.top = 0;
	temp.bottom = 0;
	temp.alpha = 0;
	temp.stroke = _Skin_NextBtn_SolidColorStroke1_c();
	temp.initialized(this, "border")
	border = temp;
	mx.binding.BindingManager.executeBindings(this, "border", border);
	return temp;
}

private function _Skin_NextBtn_SolidColorStroke1_c() : mx.graphics.SolidColorStroke
{
	var temp : mx.graphics.SolidColorStroke = new mx.graphics.SolidColorStroke();
	temp.color = 48110;
	temp.weight = 2;
	return temp;
}

private function _Skin_NextBtn_Label1_i() : spark.components.Label
{
	var temp : spark.components.Label = new spark.components.Label();
	temp.percentWidth = 100.0;
	temp.percentHeight = 100.0;
	temp.setStyle("textAlign", "center");
	temp.setStyle("verticalAlign", "bottom");
	temp.id = "label";
	if (!temp.document) temp.document = this;
	label = temp;
	mx.binding.BindingManager.executeBindings(this, "label", label);
	return temp;
}

/**
 * @private
 **/
public function ___Skin_NextBtn_Skin_BtnCircle1_creationComplete(event:mx.events.FlexEvent):void
{
	_init()
}


    //  binding mgmt
    private function _Skin_NextBtn_bindingsSetup():Array
    {
        var result:Array = [];

        result[0] = new mx.binding.Binding(this,
            function():String
            {
                var result:* = (hostComponent.label);
                return (result == undefined ? null : String(result));
            },
            null,
            "label.text"
            );


        return result;
    }


    /**
     * @private
     **/
    public static function set watcherSetupUtil(watcherSetupUtil:IWatcherSetupUtil2):void
    {
        (Skin_NextBtn)._watcherSetupUtil = watcherSetupUtil;
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
