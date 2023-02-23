


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.primitives.Rect;
import spark.components.ButtonBarButton;
import mx.graphics.SolidColorStroke;
import spark.components.Label;
import mx.graphics.SolidColor;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property _Skin_OpenButtonBarBtn_Rect2 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_Skin_OpenButtonBarBtn_Rect2' moved to '_1251965367_Skin_OpenButtonBarBtn_Rect2'
	 */

    [Bindable(event="propertyChange")]
    public function get _Skin_OpenButtonBarBtn_Rect2():spark.primitives.Rect
    {
        return this._1251965367_Skin_OpenButtonBarBtn_Rect2;
    }

    public function set _Skin_OpenButtonBarBtn_Rect2(value:spark.primitives.Rect):void
    {
    	var oldValue:Object = this._1251965367_Skin_OpenButtonBarBtn_Rect2;
        if (oldValue !== value)
        {
            this._1251965367_Skin_OpenButtonBarBtn_Rect2 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Skin_OpenButtonBarBtn_Rect2", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property _Skin_OpenButtonBarBtn_SolidColorStroke1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_Skin_OpenButtonBarBtn_SolidColorStroke1' moved to '_212207562_Skin_OpenButtonBarBtn_SolidColorStroke1'
	 */

    [Bindable(event="propertyChange")]
    public function get _Skin_OpenButtonBarBtn_SolidColorStroke1():mx.graphics.SolidColorStroke
    {
        return this._212207562_Skin_OpenButtonBarBtn_SolidColorStroke1;
    }

    public function set _Skin_OpenButtonBarBtn_SolidColorStroke1(value:mx.graphics.SolidColorStroke):void
    {
    	var oldValue:Object = this._212207562_Skin_OpenButtonBarBtn_SolidColorStroke1;
        if (oldValue !== value)
        {
            this._212207562_Skin_OpenButtonBarBtn_SolidColorStroke1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Skin_OpenButtonBarBtn_SolidColorStroke1", oldValue, value));
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

	/*
	 * generated bindable wrapper for property hostComponent (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'hostComponent' moved to '_213507019hostComponent'
	 */

    [Bindable(event="propertyChange")]
    public function get hostComponent():spark.components.ButtonBarButton
    {
        return this._213507019hostComponent;
    }

    public function set hostComponent(value:spark.components.ButtonBarButton):void
    {
    	var oldValue:Object = this._213507019hostComponent;
        if (oldValue !== value)
        {
            this._213507019hostComponent = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hostComponent", oldValue, value));
        }
    }



}
