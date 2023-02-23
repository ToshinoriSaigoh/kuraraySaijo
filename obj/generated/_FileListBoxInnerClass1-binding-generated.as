


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.components.Button;
import view.documentroot.reportscreen.sidebar.FileListBox;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property emergencyTypeBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'emergencyTypeBtn' moved to '_39391729emergencyTypeBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get emergencyTypeBtn():spark.components.Button
    {
        return this._39391729emergencyTypeBtn;
    }

    public function set emergencyTypeBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._39391729emergencyTypeBtn;
        if (oldValue !== value)
        {
            this._39391729emergencyTypeBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "emergencyTypeBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property outerDocument (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'outerDocument' moved to '_88844982outerDocument'
	 */

    [Bindable(event="propertyChange")]
    public function get outerDocument():view.documentroot.reportscreen.sidebar.FileListBox
    {
        return this._88844982outerDocument;
    }

    public function set outerDocument(value:view.documentroot.reportscreen.sidebar.FileListBox):void
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
