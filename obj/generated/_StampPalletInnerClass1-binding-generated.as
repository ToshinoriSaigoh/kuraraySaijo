


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.components.Button;
import view.documentroot.reportscreen.palletcontainer.StampPallet;

class BindableProperty
{
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

	/*
	 * generated bindable wrapper for property stampItem (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'stampItem' moved to '_2018515318stampItem'
	 */

    [Bindable(event="propertyChange")]
    public function get stampItem():spark.components.Button
    {
        return this._2018515318stampItem;
    }

    public function set stampItem(value:spark.components.Button):void
    {
    	var oldValue:Object = this._2018515318stampItem;
        if (oldValue !== value)
        {
            this._2018515318stampItem = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "stampItem", oldValue, value));
        }
    }



}
