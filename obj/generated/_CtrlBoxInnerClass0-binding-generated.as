


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import view.documentroot.reportscreen.sidebar.pager.CtrlBox;
import spark.components.Button;
import spark.components.ToggleButton;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property hideLayerBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'hideLayerBtn' moved to '_738409811hideLayerBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get hideLayerBtn():spark.components.Button
    {
        return this._738409811hideLayerBtn;
    }

    public function set hideLayerBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._738409811hideLayerBtn;
        if (oldValue !== value)
        {
            this._738409811hideLayerBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hideLayerBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property layerItem (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'layerItem' moved to '_1664764924layerItem'
	 */

    [Bindable(event="propertyChange")]
    public function get layerItem():spark.components.ToggleButton
    {
        return this._1664764924layerItem;
    }

    public function set layerItem(value:spark.components.ToggleButton):void
    {
    	var oldValue:Object = this._1664764924layerItem;
        if (oldValue !== value)
        {
            this._1664764924layerItem = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "layerItem", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property outerDocument (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'outerDocument' moved to '_88844982outerDocument'
	 */

    [Bindable(event="propertyChange")]
    public function get outerDocument():view.documentroot.reportscreen.sidebar.pager.CtrlBox
    {
        return this._88844982outerDocument;
    }

    public function set outerDocument(value:view.documentroot.reportscreen.sidebar.pager.CtrlBox):void
    {
    	var oldValue:Object = this._88844982outerDocument;
        if (oldValue !== value)
        {
            this._88844982outerDocument = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "outerDocument", oldValue, value));
        }
    }



}
