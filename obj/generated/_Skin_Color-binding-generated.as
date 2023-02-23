


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.primitives.Rect;
import spark.core.SpriteVisualElement;
import view.documentroot.reportscreen.palletcontainer.colorpallet.ColorButton;
import controller.documentroot.reportscreen.palletcontainer.colorpallet.ColorButton;

class BindableProperty
{
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
	 * generated bindable wrapper for property ctrlr (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlr' moved to '_94997351ctrlr'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlr():controller.documentroot.reportscreen.palletcontainer.colorpallet.ColorButton
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:controller.documentroot.reportscreen.palletcontainer.colorpallet.ColorButton):void
    {
    	var oldValue:Object = this._94997351ctrlr;
        if (oldValue !== value)
        {
            this._94997351ctrlr = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ctrlr", oldValue, value));
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
	 * generated bindable wrapper for property hostComponent (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'hostComponent' moved to '_213507019hostComponent'
	 */

    [Bindable(event="propertyChange")]
    public function get hostComponent():view.documentroot.reportscreen.palletcontainer.colorpallet.ColorButton
    {
        return this._213507019hostComponent;
    }

    public function set hostComponent(value:view.documentroot.reportscreen.palletcontainer.colorpallet.ColorButton):void
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
