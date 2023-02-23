


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.primitives.Rect;
import spark.components.Group;
import spark.components.Label;
import mx.graphics.SolidColor;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property _Skin_BtnRect_SolidColor1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_Skin_BtnRect_SolidColor1' moved to '_1980438057_Skin_BtnRect_SolidColor1'
	 */

    [Bindable(event="propertyChange")]
    public function get _Skin_BtnRect_SolidColor1():mx.graphics.SolidColor
    {
        return this._1980438057_Skin_BtnRect_SolidColor1;
    }

    public function set _Skin_BtnRect_SolidColor1(value:mx.graphics.SolidColor):void
    {
    	var oldValue:Object = this._1980438057_Skin_BtnRect_SolidColor1;
        if (oldValue !== value)
        {
            this._1980438057_Skin_BtnRect_SolidColor1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Skin_BtnRect_SolidColor1", oldValue, value));
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
	 * generated bindable wrapper for property icon (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'icon' moved to '_3226745icon'
	 */

    [Bindable(event="propertyChange")]
    public function get icon():spark.components.Group
    {
        return this._3226745icon;
    }

    public function set icon(value:spark.components.Group):void
    {
    	var oldValue:Object = this._3226745icon;
        if (oldValue !== value)
        {
            this._3226745icon = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "icon", oldValue, value));
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
