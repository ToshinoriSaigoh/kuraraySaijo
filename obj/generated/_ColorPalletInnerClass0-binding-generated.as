


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import view.documentroot.reportscreen.palletcontainer.ColorPallet;
import view.documentroot.reportscreen.palletcontainer.colorpallet.ColorButton;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property colorItem (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'colorItem' moved to '_1980609814colorItem'
	 */

    [Bindable(event="propertyChange")]
    public function get colorItem():view.documentroot.reportscreen.palletcontainer.colorpallet.ColorButton
    {
        return this._1980609814colorItem;
    }

    public function set colorItem(value:view.documentroot.reportscreen.palletcontainer.colorpallet.ColorButton):void
    {
    	var oldValue:Object = this._1980609814colorItem;
        if (oldValue !== value)
        {
            this._1980609814colorItem = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "colorItem", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property outerDocument (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'outerDocument' moved to '_88844982outerDocument'
	 */

    [Bindable(event="propertyChange")]
    public function get outerDocument():view.documentroot.reportscreen.palletcontainer.ColorPallet
    {
        return this._88844982outerDocument;
    }

    public function set outerDocument(value:view.documentroot.reportscreen.palletcontainer.ColorPallet):void
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
