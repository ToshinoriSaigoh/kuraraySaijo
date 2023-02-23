


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
	 * generated bindable wrapper for property _Skin_ToggleBtnRect_SolidColor1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_Skin_ToggleBtnRect_SolidColor1' moved to '_540146653_Skin_ToggleBtnRect_SolidColor1'
	 */

    [Bindable(event="propertyChange")]
    public function get _Skin_ToggleBtnRect_SolidColor1():mx.graphics.SolidColor
    {
        return this._540146653_Skin_ToggleBtnRect_SolidColor1;
    }

    public function set _Skin_ToggleBtnRect_SolidColor1(value:mx.graphics.SolidColor):void
    {
    	var oldValue:Object = this._540146653_Skin_ToggleBtnRect_SolidColor1;
        if (oldValue !== value)
        {
            this._540146653_Skin_ToggleBtnRect_SolidColor1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Skin_ToggleBtnRect_SolidColor1", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property bg (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'bg' moved to '_3141bg'
	 */

    [Bindable(event="propertyChange")]
    public function get bg():spark.primitives.Rect
    {
        return this._3141bg;
    }

    public function set bg(value:spark.primitives.Rect):void
    {
    	var oldValue:Object = this._3141bg;
        if (oldValue !== value)
        {
            this._3141bg = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "bg", oldValue, value));
        }
    }



}
