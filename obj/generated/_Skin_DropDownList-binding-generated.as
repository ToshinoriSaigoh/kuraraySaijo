


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.primitives.Rect;
import spark.components.DropDownList;
import spark.components.DataGroup;
import spark.components.Group;
import spark.components.Button;
import spark.components.Label;
import spark.components.PopUpAnchor;
import mx.graphics.SolidColor;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property background (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'background' moved to '_1332194002background'
	 */

    [Bindable(event="propertyChange")]
    public function get background():spark.primitives.Rect
    {
        return this._1332194002background;
    }

    public function set background(value:spark.primitives.Rect):void
    {
    	var oldValue:Object = this._1332194002background;
        if (oldValue !== value)
        {
            this._1332194002background = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "background", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property bgFill (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'bgFill' moved to '_1391998104bgFill'
	 */

    [Bindable(event="propertyChange")]
    public function get bgFill():mx.graphics.SolidColor
    {
        return this._1391998104bgFill;
    }

    public function set bgFill(value:mx.graphics.SolidColor):void
    {
    	var oldValue:Object = this._1391998104bgFill;
        if (oldValue !== value)
        {
            this._1391998104bgFill = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "bgFill", oldValue, value));
        }
    }

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
	 * generated bindable wrapper for property dropDown (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dropDown' moved to '_433014735dropDown'
	 */

    [Bindable(event="propertyChange")]
    public function get dropDown():spark.components.Group
    {
        return this._433014735dropDown;
    }

    public function set dropDown(value:spark.components.Group):void
    {
    	var oldValue:Object = this._433014735dropDown;
        if (oldValue !== value)
        {
            this._433014735dropDown = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dropDown", oldValue, value));
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

	/*
	 * generated bindable wrapper for property openButton (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'openButton' moved to '_137111012openButton'
	 */

    [Bindable(event="propertyChange")]
    public function get openButton():spark.components.Button
    {
        return this._137111012openButton;
    }

    public function set openButton(value:spark.components.Button):void
    {
    	var oldValue:Object = this._137111012openButton;
        if (oldValue !== value)
        {
            this._137111012openButton = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "openButton", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property popUp (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'popUp' moved to '_106851532popUp'
	 */

    [Bindable(event="propertyChange")]
    public function get popUp():spark.components.PopUpAnchor
    {
        return this._106851532popUp;
    }

    public function set popUp(value:spark.components.PopUpAnchor):void
    {
    	var oldValue:Object = this._106851532popUp;
        if (oldValue !== value)
        {
            this._106851532popUp = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "popUp", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property hostComponent (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'hostComponent' moved to '_213507019hostComponent'
	 */

    [Bindable(event="propertyChange")]
    public function get hostComponent():spark.components.DropDownList
    {
        return this._213507019hostComponent;
    }

    public function set hostComponent(value:spark.components.DropDownList):void
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
