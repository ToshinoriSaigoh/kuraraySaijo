


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import model.plugin.report.*;
import model.plugin.draw.*;
import common.*;
import flash.filesystem.*;
import mx.collections.ArrayCollection;

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
    public function get id():uint
    {
        return this._3355id;
    }

    public function set id(value:uint):void
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
	 * generated bindable wrapper for property label (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'label' moved to '_102727412label'
	 */

    [Bindable(event="propertyChange")]
    public function get label():String
    {
        return this._102727412label;
    }

    public function set label(value:String):void
    {
    	var oldValue:Object = this._102727412label;
        if (oldValue !== value)
        {
            this._102727412label = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "label", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property scale (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'scale' moved to '_109250890scale'
	 */

    [Bindable(event="propertyChange")]
    public function get scale():Number
    {
        return this._109250890scale;
    }

    public function set scale(value:Number):void
    {
    	var oldValue:Object = this._109250890scale;
        if (oldValue !== value)
        {
            this._109250890scale = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "scale", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property report (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'report' moved to '_934521548report'
	 */

    [Bindable(event="propertyChange")]
    public function get report():Report
    {
        return this._934521548report;
    }

    public function set report(value:Report):void
    {
    	var oldValue:Object = this._934521548report;
        if (oldValue !== value)
        {
            this._934521548report = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "report", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property layerCollection (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'layerCollection' moved to '_1619153201layerCollection'
	 */

    [Bindable(event="propertyChange")]
    public function get layerCollection():ArrayCollection
    {
        return this._1619153201layerCollection;
    }

    public function set layerCollection(value:ArrayCollection):void
    {
    	var oldValue:Object = this._1619153201layerCollection;
        if (oldValue !== value)
        {
            this._1619153201layerCollection = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "layerCollection", oldValue, value));
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
