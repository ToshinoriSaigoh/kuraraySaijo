


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import model.plugin.report.emergency.*;

class BindableProperty
    implements flash.events.IEventDispatcher
{
	/*
	 * generated bindable wrapper for property name (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'name' moved to '_3373707name'
	 */

    [Bindable(event="propertyChange")]
    public function get name():String
    {
        return this._3373707name;
    }

    public function set name(value:String):void
    {
    	var oldValue:Object = this._3373707name;
        if (oldValue !== value)
        {
            this._3373707name = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "name", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property title (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'title' moved to '_110371416title'
	 */

    [Bindable(event="propertyChange")]
    public function get title():String
    {
        return this._110371416title;
    }

    public function set title(value:String):void
    {
    	var oldValue:Object = this._110371416title;
        if (oldValue !== value)
        {
            this._110371416title = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "title", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property styleName (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'styleName' moved to '_1805110236styleName'
	 */

    [Bindable(event="propertyChange")]
    public function get styleName():String
    {
        return this._1805110236styleName;
    }

    public function set styleName(value:String):void
    {
    	var oldValue:Object = this._1805110236styleName;
        if (oldValue !== value)
        {
            this._1805110236styleName = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "styleName", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property bgColor (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'bgColor' moved to '_204859874bgColor'
	 */

    [Bindable(event="propertyChange")]
    public function get bgColor():Number
    {
        return this._204859874bgColor;
    }

    public function set bgColor(value:Number):void
    {
    	var oldValue:Object = this._204859874bgColor;
        if (oldValue !== value)
        {
            this._204859874bgColor = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "bgColor", oldValue, value));
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
