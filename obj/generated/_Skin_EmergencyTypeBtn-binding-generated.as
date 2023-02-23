


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.primitives.Rect;
import spark.core.SpriteVisualElement;
import spark.components.Group;
import view.utils.DataTypeMark;
import spark.components.Label;
import mx.graphics.SolidColor;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property _Skin_EmergencyTypeBtn_SolidColor1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_Skin_EmergencyTypeBtn_SolidColor1' moved to '_1500465486_Skin_EmergencyTypeBtn_SolidColor1'
	 */

    [Bindable(event="propertyChange")]
    public function get _Skin_EmergencyTypeBtn_SolidColor1():mx.graphics.SolidColor
    {
        return this._1500465486_Skin_EmergencyTypeBtn_SolidColor1;
    }

    public function set _Skin_EmergencyTypeBtn_SolidColor1(value:mx.graphics.SolidColor):void
    {
    	var oldValue:Object = this._1500465486_Skin_EmergencyTypeBtn_SolidColor1;
        if (oldValue !== value)
        {
            this._1500465486_Skin_EmergencyTypeBtn_SolidColor1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Skin_EmergencyTypeBtn_SolidColor1", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property body (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'body' moved to '_3029410body'
	 */

    [Bindable(event="propertyChange")]
    public function get body():spark.core.SpriteVisualElement
    {
        return this._3029410body;
    }

    public function set body(value:spark.core.SpriteVisualElement):void
    {
    	var oldValue:Object = this._3029410body;
        if (oldValue !== value)
        {
            this._3029410body = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "body", oldValue, value));
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

	/*
	 * generated bindable wrapper for property dataTypeMark (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dataTypeMark' moved to '_650700529dataTypeMark'
	 */

    [Bindable(event="propertyChange")]
    public function get dataTypeMark():view.utils.DataTypeMark
    {
        return this._650700529dataTypeMark;
    }

    public function set dataTypeMark(value:view.utils.DataTypeMark):void
    {
    	var oldValue:Object = this._650700529dataTypeMark;
        if (oldValue !== value)
        {
            this._650700529dataTypeMark = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dataTypeMark", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property fill (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'fill' moved to '_3143043fill'
	 */

    [Bindable(event="propertyChange")]
    public function get fill():spark.primitives.Rect
    {
        return this._3143043fill;
    }

    public function set fill(value:spark.primitives.Rect):void
    {
    	var oldValue:Object = this._3143043fill;
        if (oldValue !== value)
        {
            this._3143043fill = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "fill", oldValue, value));
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
