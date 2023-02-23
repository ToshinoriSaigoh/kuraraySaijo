


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.core.SpriteVisualElement;
import spark.components.Group;
import kuraraysaijo.controller.documentroot.InitScreen;

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
    public function get ctrlr():kuraraysaijo.controller.documentroot.InitScreen
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:kuraraysaijo.controller.documentroot.InitScreen):void
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
	 * generated bindable wrapper for property logo (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'logo' moved to '_3327403logo'
	 */

    [Bindable(event="propertyChange")]
    public function get logo():spark.components.Group
    {
        return this._3327403logo;
    }

    public function set logo(value:spark.components.Group):void
    {
    	var oldValue:Object = this._3327403logo;
        if (oldValue !== value)
        {
            this._3327403logo = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "logo", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property panel (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'panel' moved to '_106433028panel'
	 */

    [Bindable(event="propertyChange")]
    public function get panel():spark.components.Group
    {
        return this._106433028panel;
    }

    public function set panel(value:spark.components.Group):void
    {
    	var oldValue:Object = this._106433028panel;
        if (oldValue !== value)
        {
            this._106433028panel = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "panel", oldValue, value));
        }
    }



}
