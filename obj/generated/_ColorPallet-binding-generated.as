


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import controller.documentroot.reportscreen.palletcontainer.ColorPallet;
import spark.core.SpriteVisualElement;
import spark.components.Group;
import spark.components.DataGroup;

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
	 * generated bindable wrapper for property colorList (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'colorList' moved to '_1980689057colorList'
	 */

    [Bindable(event="propertyChange")]
    public function get colorList():spark.components.DataGroup
    {
        return this._1980689057colorList;
    }

    public function set colorList(value:spark.components.DataGroup):void
    {
    	var oldValue:Object = this._1980689057colorList;
        if (oldValue !== value)
        {
            this._1980689057colorList = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "colorList", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property colors (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'colors' moved to '_1354842768colors'
	 */

    [Bindable(event="propertyChange")]
    public function get colors():spark.components.Group
    {
        return this._1354842768colors;
    }

    public function set colors(value:spark.components.Group):void
    {
    	var oldValue:Object = this._1354842768colors;
        if (oldValue !== value)
        {
            this._1354842768colors = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "colors", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property ctrlr (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlr' moved to '_94997351ctrlr'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlr():controller.documentroot.reportscreen.palletcontainer.ColorPallet
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:controller.documentroot.reportscreen.palletcontainer.ColorPallet):void
    {
    	var oldValue:Object = this._94997351ctrlr;
        if (oldValue !== value)
        {
            this._94997351ctrlr = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ctrlr", oldValue, value));
        }
    }



}
