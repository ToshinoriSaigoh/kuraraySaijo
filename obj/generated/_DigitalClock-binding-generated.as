


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.core.SpriteVisualElement;
import spark.components.Label;
import kuraraysaijo.model.plugin.report.clock.DigitalClockCtrl;

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
    public function get ctrlr():kuraraysaijo.model.plugin.report.clock.DigitalClockCtrl
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:kuraraysaijo.model.plugin.report.clock.DigitalClockCtrl):void
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
	 * generated bindable wrapper for property date (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'date' moved to '_3076014date'
	 */

    [Bindable(event="propertyChange")]
    public function get date():spark.components.Label
    {
        return this._3076014date;
    }

    public function set date(value:spark.components.Label):void
    {
    	var oldValue:Object = this._3076014date;
        if (oldValue !== value)
        {
            this._3076014date = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "date", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property time (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'time' moved to '_3560141time'
	 */

    [Bindable(event="propertyChange")]
    public function get time():spark.components.Label
    {
        return this._3560141time;
    }

    public function set time(value:spark.components.Label):void
    {
    	var oldValue:Object = this._3560141time;
        if (oldValue !== value)
        {
            this._3560141time = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "time", oldValue, value));
        }
    }



}
