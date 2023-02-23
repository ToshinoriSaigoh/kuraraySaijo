


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.core.SpriteVisualElement;
import spark.components.DataGroup;
import spark.components.Group;
import spark.components.Button;
import spark.components.Scroller;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property addPageBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'addPageBtn' moved to '_1104657772addPageBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get addPageBtn():spark.components.Button
    {
        return this._1104657772addPageBtn;
    }

    public function set addPageBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1104657772addPageBtn;
        if (oldValue !== value)
        {
            this._1104657772addPageBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "addPageBtn", oldValue, value));
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
	 * generated bindable wrapper for property pageList (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'pageList' moved to '_859219917pageList'
	 */

    [Bindable(event="propertyChange")]
    public function get pageList():spark.components.DataGroup
    {
        return this._859219917pageList;
    }

    public function set pageList(value:spark.components.DataGroup):void
    {
    	var oldValue:Object = this._859219917pageList;
        if (oldValue !== value)
        {
            this._859219917pageList = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "pageList", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property pageListBox (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'pageListBox' moved to '_984469826pageListBox'
	 */

    [Bindable(event="propertyChange")]
    public function get pageListBox():spark.components.Scroller
    {
        return this._984469826pageListBox;
    }

    public function set pageListBox(value:spark.components.Scroller):void
    {
    	var oldValue:Object = this._984469826pageListBox;
        if (oldValue !== value)
        {
            this._984469826pageListBox = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "pageListBox", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property topBox (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'topBox' moved to '_868071370topBox'
	 */

    [Bindable(event="propertyChange")]
    public function get topBox():spark.components.Group
    {
        return this._868071370topBox;
    }

    public function set topBox(value:spark.components.Group):void
    {
    	var oldValue:Object = this._868071370topBox;
        if (oldValue !== value)
        {
            this._868071370topBox = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "topBox", oldValue, value));
        }
    }



}
