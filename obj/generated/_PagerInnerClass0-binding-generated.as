


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import view.documentroot.reportscreen.sidebar.Pager;
import spark.components.ToggleButton;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property outerDocument (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'outerDocument' moved to '_88844982outerDocument'
	 */

    [Bindable(event="propertyChange")]
    public function get outerDocument():view.documentroot.reportscreen.sidebar.Pager
    {
        return this._88844982outerDocument;
    }

    public function set outerDocument(value:view.documentroot.reportscreen.sidebar.Pager):void
    {
    	var oldValue:Object = this._88844982outerDocument;
        if (oldValue !== value)
        {
            this._88844982outerDocument = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "outerDocument", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property pageItem (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'pageItem' moved to '_859140674pageItem'
	 */

    [Bindable(event="propertyChange")]
    public function get pageItem():spark.components.ToggleButton
    {
        return this._859140674pageItem;
    }

    public function set pageItem(value:spark.components.ToggleButton):void
    {
    	var oldValue:Object = this._859140674pageItem;
        if (oldValue !== value)
        {
            this._859140674pageItem = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "pageItem", oldValue, value));
        }
    }



}
