


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import flash.events.*;
import model.plugin.draw.*;
import common.*;
import flash.display.*;
import model.app.*;

class BindableProperty
    implements flash.events.IEventDispatcher
{
	/*
	 * generated bindable wrapper for property activeReport (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'activeReport' moved to '_1382736858activeReport'
	 */

    [Bindable(event="propertyChange")]
    static public function get activeReport():Object
    {
        return Draw._1382736858activeReport;
    }

    static public function set activeReport(value:Object):void
    {
    	var oldValue:Object = Draw._1382736858activeReport;
        if (oldValue !== value)
        {
            Draw._1382736858activeReport = value;
            var eventDispatcher:flash.events.IEventDispatcher = Draw.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(Draw, "activeReport", oldValue, value));
            }
        }
    }

	/*
	 * generated bindable wrapper for property activeDrawPanel (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'activeDrawPanel' moved to '_568180410activeDrawPanel'
	 */

    [Bindable(event="propertyChange")]
    static public function get activeDrawPanel():Object
    {
        return Draw._568180410activeDrawPanel;
    }

    static public function set activeDrawPanel(value:Object):void
    {
    	var oldValue:Object = Draw._568180410activeDrawPanel;
        if (oldValue !== value)
        {
            Draw._568180410activeDrawPanel = value;
            var eventDispatcher:flash.events.IEventDispatcher = Draw.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(Draw, "activeDrawPanel", oldValue, value));
            }
        }
    }

	/*
	 * generated bindable wrapper for property lineColor (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'lineColor' moved to '_1822070833lineColor'
	 */

    [Bindable(event="propertyChange")]
    static public function get lineColor():Number
    {
        return Draw._1822070833lineColor;
    }

    static public function set lineColor(value:Number):void
    {
    	var oldValue:Object = Draw._1822070833lineColor;
        if (oldValue !== value)
        {
            Draw._1822070833lineColor = value;
            var eventDispatcher:flash.events.IEventDispatcher = Draw.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(Draw, "lineColor", oldValue, value));
            }
        }
    }

	/*
	 * generated bindable wrapper for property fillColor (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'fillColor' moved to '_1141881952fillColor'
	 */

    [Bindable(event="propertyChange")]
    static public function get fillColor():Number
    {
        return Draw._1141881952fillColor;
    }

    static public function set fillColor(value:Number):void
    {
    	var oldValue:Object = Draw._1141881952fillColor;
        if (oldValue !== value)
        {
            Draw._1141881952fillColor = value;
            var eventDispatcher:flash.events.IEventDispatcher = Draw.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(Draw, "fillColor", oldValue, value));
            }
        }
    }

	/*
	 * generated bindable wrapper for property thick (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'thick' moved to '_110330781thick'
	 */

    [Bindable(event="propertyChange")]
    static public function get thick():uint
    {
        return Draw._110330781thick;
    }

    static public function set thick(value:uint):void
    {
    	var oldValue:Object = Draw._110330781thick;
        if (oldValue !== value)
        {
            Draw._110330781thick = value;
            var eventDispatcher:flash.events.IEventDispatcher = Draw.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(Draw, "thick", oldValue, value));
            }
        }
    }

	/*
	 * generated bindable wrapper for property alpha (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'alpha' moved to '_92909918alpha'
	 */

    [Bindable(event="propertyChange")]
    static public function get alpha():Number
    {
        return Draw._92909918alpha;
    }

    static public function set alpha(value:Number):void
    {
    	var oldValue:Object = Draw._92909918alpha;
        if (oldValue !== value)
        {
            Draw._92909918alpha = value;
            var eventDispatcher:flash.events.IEventDispatcher = Draw.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(Draw, "alpha", oldValue, value));
            }
        }
    }

	/*
	 * generated bindable wrapper for property stampSize (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'stampSize' moved to '_2018803300stampSize'
	 */

    [Bindable(event="propertyChange")]
    static public function get stampSize():int
    {
        return Draw._2018803300stampSize;
    }

    static public function set stampSize(value:int):void
    {
    	var oldValue:Object = Draw._2018803300stampSize;
        if (oldValue !== value)
        {
            Draw._2018803300stampSize = value;
            var eventDispatcher:flash.events.IEventDispatcher = Draw.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(Draw, "stampSize", oldValue, value));
            }
        }
    }

	/*
	 * generated bindable wrapper for property imageSize (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'imageSize' moved to '_878192644imageSize'
	 */

    [Bindable(event="propertyChange")]
    static public function get imageSize():int
    {
        return Draw._878192644imageSize;
    }

    static public function set imageSize(value:int):void
    {
    	var oldValue:Object = Draw._878192644imageSize;
        if (oldValue !== value)
        {
            Draw._878192644imageSize = value;
            var eventDispatcher:flash.events.IEventDispatcher = Draw.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(Draw, "imageSize", oldValue, value));
            }
        }
    }

	/*
	 * generated bindable wrapper for property textSize (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'textSize' moved to '_1003668786textSize'
	 */

    [Bindable(event="propertyChange")]
    static public function get textSize():int
    {
        return Draw._1003668786textSize;
    }

    static public function set textSize(value:int):void
    {
    	var oldValue:Object = Draw._1003668786textSize;
        if (oldValue !== value)
        {
            Draw._1003668786textSize = value;
            var eventDispatcher:flash.events.IEventDispatcher = Draw.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(Draw, "textSize", oldValue, value));
            }
        }
    }


    //    IEventDispatcher implementation
    //
    private var _bindingEventDispatcher:flash.events.EventDispatcher =
        new flash.events.EventDispatcher(flash.events.IEventDispatcher(this));

	/**
	 * @inheritDoc
	 */
    public function addEventListener(type:String, listener:Function,
                                     useCapture:Boolean = false,
                                     priority:int = 0,
                                     weakRef:Boolean = false):void
    {
        _bindingEventDispatcher.addEventListener(type, listener, useCapture,
                                                 priority, weakRef);
    }

	/**
	 * @inheritDoc
	 */
    public function dispatchEvent(event:flash.events.Event):Boolean
    {
        return _bindingEventDispatcher.dispatchEvent(event);
    }

	/**
	 * @inheritDoc
	 */
    public function hasEventListener(type:String):Boolean
    {
        return _bindingEventDispatcher.hasEventListener(type);
    }

	/**
	 * @inheritDoc
	 */
    public function removeEventListener(type:String,
                                        listener:Function,
                                        useCapture:Boolean = false):void
    {
        _bindingEventDispatcher.removeEventListener(type, listener, useCapture);
    }

	/**
	 * @inheritDoc
	 */
    public function willTrigger(type:String):Boolean
    {
        return _bindingEventDispatcher.willTrigger(type);
    }

    private static var _staticBindingEventDispatcher:flash.events.EventDispatcher =
        new flash.events.EventDispatcher();

    public static function get staticEventDispatcher():IEventDispatcher
    {
        return _staticBindingEventDispatcher;
    }
}
