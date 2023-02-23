


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.core.SpriteVisualElement;
import spark.components.Group;
import kuraraysaijo.model.plugin.report.clock.AnalogClockCtrl;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property bg (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'bg' moved to '_3141bg'
	 */

    [Bindable(event="propertyChange")]
    public function get bg():spark.components.Group
    {
        return this._3141bg;
    }

    public function set bg(value:spark.components.Group):void
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
    public function get ctrlr():kuraraysaijo.model.plugin.report.clock.AnalogClockCtrl
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:kuraraysaijo.model.plugin.report.clock.AnalogClockCtrl):void
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
	 * generated bindable wrapper for property hHand (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'hHand' moved to '_98287863hHand'
	 */

    [Bindable(event="propertyChange")]
    public function get hHand():spark.components.Group
    {
        return this._98287863hHand;
    }

    public function set hHand(value:spark.components.Group):void
    {
    	var oldValue:Object = this._98287863hHand;
        if (oldValue !== value)
        {
            this._98287863hHand = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hHand", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property hHandContainer (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'hHandContainer' moved to '_2027171510hHandContainer'
	 */

    [Bindable(event="propertyChange")]
    public function get hHandContainer():spark.components.Group
    {
        return this._2027171510hHandContainer;
    }

    public function set hHandContainer(value:spark.components.Group):void
    {
    	var oldValue:Object = this._2027171510hHandContainer;
        if (oldValue !== value)
        {
            this._2027171510hHandContainer = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hHandContainer", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property mHand (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'mHand' moved to '_102905468mHand'
	 */

    [Bindable(event="propertyChange")]
    public function get mHand():spark.components.Group
    {
        return this._102905468mHand;
    }

    public function set mHand(value:spark.components.Group):void
    {
    	var oldValue:Object = this._102905468mHand;
        if (oldValue !== value)
        {
            this._102905468mHand = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "mHand", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property mHandContainer (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'mHandContainer' moved to '_259997339mHandContainer'
	 */

    [Bindable(event="propertyChange")]
    public function get mHandContainer():spark.components.Group
    {
        return this._259997339mHandContainer;
    }

    public function set mHandContainer(value:spark.components.Group):void
    {
    	var oldValue:Object = this._259997339mHandContainer;
        if (oldValue !== value)
        {
            this._259997339mHandContainer = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "mHandContainer", oldValue, value));
        }
    }



}
