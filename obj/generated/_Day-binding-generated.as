


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import flash.events.*;
import kuraraysaijo.model.plugin.report.calendar.*;

class BindableProperty
    implements flash.events.IEventDispatcher
{
	/*
	 * generated bindable wrapper for property year (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'year' moved to '_3704893year'
	 */

    [Bindable(event="propertyChange")]
    public function get year():String
    {
        return this._3704893year;
    }

    public function set year(value:String):void
    {
    	var oldValue:Object = this._3704893year;
        if (oldValue !== value)
        {
            this._3704893year = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "year", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property month (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'month' moved to '_104080000month'
	 */

    [Bindable(event="propertyChange")]
    public function get month():String
    {
        return this._104080000month;
    }

    public function set month(value:String):void
    {
    	var oldValue:Object = this._104080000month;
        if (oldValue !== value)
        {
            this._104080000month = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "month", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property day (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'day' moved to '_99228day'
	 */

    [Bindable(event="propertyChange")]
    public function get day():String
    {
        return this._99228day;
    }

    public function set day(value:String):void
    {
    	var oldValue:Object = this._99228day;
        if (oldValue !== value)
        {
            this._99228day = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "day", oldValue, value));
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

}
