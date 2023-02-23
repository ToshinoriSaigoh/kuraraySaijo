


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import model.plugin.network.channel.member.*;

class BindableProperty
    implements flash.events.IEventDispatcher
{
	/*
	 * generated bindable wrapper for property id (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'id' moved to '_3355id'
	 */

    [Bindable(event="propertyChange")]
    public function get id():String
    {
        return this._3355id;
    }

    public function set id(value:String):void
    {
    	var oldValue:Object = this._3355id;
        if (oldValue !== value)
        {
            this._3355id = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "id", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property ip (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ip' moved to '_3367ip'
	 */

    [Bindable(event="propertyChange")]
    public function get ip():String
    {
        return this._3367ip;
    }

    public function set ip(value:String):void
    {
    	var oldValue:Object = this._3367ip;
        if (oldValue !== value)
        {
            this._3367ip = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ip", oldValue, value));
        }
    }

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
	 * generated bindable wrapper for property status (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'status' moved to '_892481550status'
	 */

    [Bindable(event="propertyChange")]
    public function get status():String
    {
        return this._892481550status;
    }

    public function set status(value:String):void
    {
    	var oldValue:Object = this._892481550status;
        if (oldValue !== value)
        {
            this._892481550status = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "status", oldValue, value));
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
