


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.core.SpriteVisualElement;
import spark.components.Label;
import spark.components.TextArea;
import kuraraysaijo.controller.documentroot.AlertScreen;

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
    public function get ctrlr():kuraraysaijo.controller.documentroot.AlertScreen
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:kuraraysaijo.controller.documentroot.AlertScreen):void
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
	 * generated bindable wrapper for property headLabel (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'headLabel' moved to '_236884748headLabel'
	 */

    [Bindable(event="propertyChange")]
    public function get headLabel():spark.components.Label
    {
        return this._236884748headLabel;
    }

    public function set headLabel(value:spark.components.Label):void
    {
    	var oldValue:Object = this._236884748headLabel;
        if (oldValue !== value)
        {
            this._236884748headLabel = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "headLabel", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property textarea (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'textarea' moved to '_1003243718textarea'
	 */

    [Bindable(event="propertyChange")]
    public function get textarea():spark.components.TextArea
    {
        return this._1003243718textarea;
    }

    public function set textarea(value:spark.components.TextArea):void
    {
    	var oldValue:Object = this._1003243718textarea;
        if (oldValue !== value)
        {
            this._1003243718textarea = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "textarea", oldValue, value));
        }
    }



}
