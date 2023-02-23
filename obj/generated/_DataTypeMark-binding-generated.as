


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import mx.graphics.SolidColor;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property _DataTypeMark_SolidColor1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_DataTypeMark_SolidColor1' moved to '_1634412234_DataTypeMark_SolidColor1'
	 */

    [Bindable(event="propertyChange")]
    public function get _DataTypeMark_SolidColor1():mx.graphics.SolidColor
    {
        return this._1634412234_DataTypeMark_SolidColor1;
    }

    public function set _DataTypeMark_SolidColor1(value:mx.graphics.SolidColor):void
    {
    	var oldValue:Object = this._1634412234_DataTypeMark_SolidColor1;
        if (oldValue !== value)
        {
            this._1634412234_DataTypeMark_SolidColor1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_DataTypeMark_SolidColor1", oldValue, value));
        }
    }



}
