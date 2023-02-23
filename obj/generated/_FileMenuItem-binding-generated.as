


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import controller.documentroot.reportscreen.sidebar.filelistbox.*;

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
	 * generated bindable wrapper for property text (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'text' moved to '_3556653text'
	 */

    [Bindable(event="propertyChange")]
    public function get text():String
    {
        return this._3556653text;
    }

    public function set text(value:String):void
    {
    	var oldValue:Object = this._3556653text;
        if (oldValue !== value)
        {
            this._3556653text = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "text", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property color (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'color' moved to '_94842723color'
	 */

    [Bindable(event="propertyChange")]
    public function get color():Number
    {
        return this._94842723color;
    }

    public function set color(value:Number):void
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
	 * generated bindable wrapper for property width (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'width' moved to '_113126854width'
	 */

    [Bindable(event="propertyChange")]
    public function get width():Number
    {
        return this._113126854width;
    }

    public function set width(value:Number):void
    {
    	var oldValue:Object = this._113126854width;
        if (oldValue !== value)
        {
            this._113126854width = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "width", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property height (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'height' moved to '_1221029593height'
	 */

    [Bindable(event="propertyChange")]
    public function get height():Number
    {
        return this._1221029593height;
    }

    public function set height(value:Number):void
    {
    	var oldValue:Object = this._1221029593height;
        if (oldValue !== value)
        {
            this._1221029593height = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "height", oldValue, value));
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
