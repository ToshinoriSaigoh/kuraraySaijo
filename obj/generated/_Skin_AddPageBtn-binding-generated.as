


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.primitives.Rect;
import mx.graphics.SolidColor;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property _Skin_AddPageBtn_SolidColor1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_Skin_AddPageBtn_SolidColor1' moved to '_620899703_Skin_AddPageBtn_SolidColor1'
	 */

    [Bindable(event="propertyChange")]
    public function get _Skin_AddPageBtn_SolidColor1():mx.graphics.SolidColor
    {
        return this._620899703_Skin_AddPageBtn_SolidColor1;
    }

    public function set _Skin_AddPageBtn_SolidColor1(value:mx.graphics.SolidColor):void
    {
    	var oldValue:Object = this._620899703_Skin_AddPageBtn_SolidColor1;
        if (oldValue !== value)
        {
            this._620899703_Skin_AddPageBtn_SolidColor1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Skin_AddPageBtn_SolidColor1", oldValue, value));
        }
    }

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
