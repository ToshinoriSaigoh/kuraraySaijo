


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.components.ToggleButton;
import view.documentroot.reportscreen.palletcontainer.StampPallet;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property folderItem (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'folderItem' moved to '_828365663folderItem'
	 */

    [Bindable(event="propertyChange")]
    public function get folderItem():spark.components.ToggleButton
    {
        return this._828365663folderItem;
    }

    public function set folderItem(value:spark.components.ToggleButton):void
    {
    	var oldValue:Object = this._828365663folderItem;
        if (oldValue !== value)
        {
            this._828365663folderItem = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "folderItem", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property outerDocument (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'outerDocument' moved to '_88844982outerDocument'
	 */

    [Bindable(event="propertyChange")]
    public function get outerDocument():view.documentroot.reportscreen.palletcontainer.StampPallet
    {
        return this._88844982outerDocument;
    }

    public function set outerDocument(value:view.documentroot.reportscreen.palletcontainer.StampPallet):void
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
