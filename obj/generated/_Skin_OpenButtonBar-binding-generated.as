


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.components.DataGroup;
import spark.components.ButtonBar;
import mx.core.ClassFactory;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property dataGroup (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dataGroup' moved to '_385593099dataGroup'
	 */

    [Bindable(event="propertyChange")]
    public function get dataGroup():spark.components.DataGroup
    {
        return this._385593099dataGroup;
    }

    public function set dataGroup(value:spark.components.DataGroup):void
    {
    	var oldValue:Object = this._385593099dataGroup;
        if (oldValue !== value)
        {
            this._385593099dataGroup = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dataGroup", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property middleButton (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'middleButton' moved to '_654857945middleButton'
	 */

    [Bindable(event="propertyChange")]
    public function get middleButton():mx.core.ClassFactory
    {
        return this._654857945middleButton;
    }

    public function set middleButton(value:mx.core.ClassFactory):void
    {
    	var oldValue:Object = this._654857945middleButton;
        if (oldValue !== value)
        {
            this._654857945middleButton = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "middleButton", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property hostComponent (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'hostComponent' moved to '_213507019hostComponent'
	 */

    [Bindable(event="propertyChange")]
    public function get hostComponent():spark.components.ButtonBar
    {
        return this._213507019hostComponent;
    }

    public function set hostComponent(value:spark.components.ButtonBar):void
    {
    	var oldValue:Object = this._213507019hostComponent;
        if (oldValue !== value)
        {
            this._213507019hostComponent = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hostComponent", oldValue, value));
        }
    }



}
