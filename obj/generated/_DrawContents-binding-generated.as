


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import mx.containers.ViewStack;
import spark.core.SpriteVisualElement;
import kuraraysaijo.controller.documentroot.reportscreen.DrawContents;

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
    public function get ctrlr():kuraraysaijo.controller.documentroot.reportscreen.DrawContents
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:kuraraysaijo.controller.documentroot.reportscreen.DrawContents):void
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
	 * generated bindable wrapper for property drawContentsViewStack (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'drawContentsViewStack' moved to '_195568635drawContentsViewStack'
	 */

    [Bindable(event="propertyChange")]
    public function get drawContentsViewStack():mx.containers.ViewStack
    {
        return this._195568635drawContentsViewStack;
    }

    public function set drawContentsViewStack(value:mx.containers.ViewStack):void
    {
    	var oldValue:Object = this._195568635drawContentsViewStack;
        if (oldValue !== value)
        {
            this._195568635drawContentsViewStack = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "drawContentsViewStack", oldValue, value));
        }
    }



}
