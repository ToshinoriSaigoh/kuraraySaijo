


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import mx.graphics.SolidColorStroke;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property _ListItem_SolidColorStroke1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_ListItem_SolidColorStroke1' moved to '_1572834798_ListItem_SolidColorStroke1'
	 */

    [Bindable(event="propertyChange")]
    public function get _ListItem_SolidColorStroke1():mx.graphics.SolidColorStroke
    {
        return this._1572834798_ListItem_SolidColorStroke1;
    }

    public function set _ListItem_SolidColorStroke1(value:mx.graphics.SolidColorStroke):void
    {
    	var oldValue:Object = this._1572834798_ListItem_SolidColorStroke1;
        if (oldValue !== value)
        {
            this._1572834798_ListItem_SolidColorStroke1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_ListItem_SolidColorStroke1", oldValue, value));
        }
    }



}
