


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import kuraraysaijo.model.plugin.config.*;

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
	 * generated bindable wrapper for property fontSize (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'fontSize' moved to '_365601008fontSize'
	 */

    [Bindable(event="propertyChange")]
    public function get fontSize():String
    {
        return this._365601008fontSize;
    }

    public function set fontSize(value:String):void
    {
    	var oldValue:Object = this._365601008fontSize;
        if (oldValue !== value)
        {
            this._365601008fontSize = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "fontSize", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property color (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'color' moved to '_94842723color'
	 */

    [Bindable(event="propertyChange")]
    public function get color():String
    {
        return this._94842723color;
    }

    public function set color(value:String):void
    {
    	var oldValue:Object = this._94842723color;
        if (oldValue !== value)
        {
            this._94842723color = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "color", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property backgroundColor (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'backgroundColor' moved to '_1287124693backgroundColor'
	 */

    [Bindable(event="propertyChange")]
    public function get backgroundColor():uint
    {
        return this._1287124693backgroundColor;
    }

    public function set backgroundColor(value:uint):void
    {
    	var oldValue:Object = this._1287124693backgroundColor;
        if (oldValue !== value)
        {
            this._1287124693backgroundColor = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "backgroundColor", oldValue, value));
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
