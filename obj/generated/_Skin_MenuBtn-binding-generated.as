


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.primitives.Rect;
import spark.components.Label;
import mx.graphics.SolidColor;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property _Skin_MenuBtn_Rect2 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_Skin_MenuBtn_Rect2' moved to '_894545975_Skin_MenuBtn_Rect2'
	 */

    [Bindable(event="propertyChange")]
    public function get _Skin_MenuBtn_Rect2():spark.primitives.Rect
    {
        return this._894545975_Skin_MenuBtn_Rect2;
    }

    public function set _Skin_MenuBtn_Rect2(value:spark.primitives.Rect):void
    {
    	var oldValue:Object = this._894545975_Skin_MenuBtn_Rect2;
        if (oldValue !== value)
        {
            this._894545975_Skin_MenuBtn_Rect2 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Skin_MenuBtn_Rect2", oldValue, value));
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

	/*
	 * generated bindable wrapper for property bgRect (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'bgRect' moved to '_1391644727bgRect'
	 */

    [Bindable(event="propertyChange")]
    public function get bgRect():mx.graphics.SolidColor
    {
        return this._1391644727bgRect;
    }

    public function set bgRect(value:mx.graphics.SolidColor):void
    {
    	var oldValue:Object = this._1391644727bgRect;
        if (oldValue !== value)
        {
            this._1391644727bgRect = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "bgRect", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property label (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'label' moved to '_102727412label'
	 */

    [Bindable(event="propertyChange")]
    public function get label():spark.components.Label
    {
        return this._102727412label;
    }

    public function set label(value:spark.components.Label):void
    {
    	var oldValue:Object = this._102727412label;
        if (oldValue !== value)
        {
            this._102727412label = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "label", oldValue, value));
        }
    }



}
