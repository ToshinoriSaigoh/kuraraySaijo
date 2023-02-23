


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.primitives.Rect;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property border (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'border' moved to '_1383304148border'
	 */

    [Bindable(event="propertyChange")]
    public function get border():spark.primitives.Rect
    {
        return this._1383304148border;
    }

    public function set border(value:spark.primitives.Rect):void
    {
    	var oldValue:Object = this._1383304148border;
        if (oldValue !== value)
        {
            this._1383304148border = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "border", oldValue, value));
        }
    }



}
