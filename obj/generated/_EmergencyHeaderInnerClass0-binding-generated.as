


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.components.Button;
import model.plugin.report.emergency.view.EmergencyHeader;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property emergencyPageBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'emergencyPageBtn' moved to '_88932988emergencyPageBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get emergencyPageBtn():spark.components.Button
    {
        return this._88932988emergencyPageBtn;
    }

    public function set emergencyPageBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._88932988emergencyPageBtn;
        if (oldValue !== value)
        {
            this._88932988emergencyPageBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "emergencyPageBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property outerDocument (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'outerDocument' moved to '_88844982outerDocument'
	 */

    [Bindable(event="propertyChange")]
    public function get outerDocument():model.plugin.report.emergency.view.EmergencyHeader
    {
        return this._88844982outerDocument;
    }

    public function set outerDocument(value:model.plugin.report.emergency.view.EmergencyHeader):void
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
