


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
import spark.components.Label;

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
	 * generated bindable wrapper for property fileItem (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'fileItem' moved to '_735852881fileItem'
	 */

    [Bindable(event="propertyChange")]
    public function get fileItem():spark.components.Group
    {
        return this._735852881fileItem;
    }

    public function set fileItem(value:spark.components.Group):void
    {
    	var oldValue:Object = this._735852881fileItem;
        if (oldValue !== value)
        {
            this._735852881fileItem = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "fileItem", oldValue, value));
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
