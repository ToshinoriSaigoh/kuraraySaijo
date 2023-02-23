


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import model.plugin.report.emergency.*;
import mx.collections.ArrayCollection;

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
	 * generated bindable wrapper for property type (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'type' moved to '_3575610type'
	 */

    [Bindable(event="propertyChange")]
    public function get type():String
    {
        return this._3575610type;
    }

    public function set type(value:String):void
    {
    	var oldValue:Object = this._3575610type;
        if (oldValue !== value)
        {
            this._3575610type = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "type", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property dir (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dir' moved to '_99469dir'
	 */

    [Bindable(event="propertyChange")]
    public function get dir():String
    {
        return this._99469dir;
    }

    public function set dir(value:String):void
    {
    	var oldValue:Object = this._99469dir;
        if (oldValue !== value)
        {
            this._99469dir = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dir", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property manualPageCollection (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'manualPageCollection' moved to '_491710451manualPageCollection'
	 */

    [Bindable(event="propertyChange")]
    public function get manualPageCollection():ArrayCollection
    {
        return this._491710451manualPageCollection;
    }

    public function set manualPageCollection(value:ArrayCollection):void
    {
    	var oldValue:Object = this._491710451manualPageCollection;
        if (oldValue !== value)
        {
            this._491710451manualPageCollection = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "manualPageCollection", oldValue, value));
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
