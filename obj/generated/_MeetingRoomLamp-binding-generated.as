


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import mx.states.SetProperty;
import spark.components.Group;
import spark.primitives.Graphic;
import spark.components.Label;
import mx.graphics.SolidColor;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property _MeetingRoomLamp_SetProperty1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_MeetingRoomLamp_SetProperty1' moved to '_246656310_MeetingRoomLamp_SetProperty1'
	 */

    [Bindable(event="propertyChange")]
    public function get _MeetingRoomLamp_SetProperty1():mx.states.SetProperty
    {
        return this._246656310_MeetingRoomLamp_SetProperty1;
    }

    public function set _MeetingRoomLamp_SetProperty1(value:mx.states.SetProperty):void
    {
    	var oldValue:Object = this._246656310_MeetingRoomLamp_SetProperty1;
        if (oldValue !== value)
        {
            this._246656310_MeetingRoomLamp_SetProperty1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_MeetingRoomLamp_SetProperty1", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property _MeetingRoomLamp_SetProperty2 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_MeetingRoomLamp_SetProperty2' moved to '_246656309_MeetingRoomLamp_SetProperty2'
	 */

    [Bindable(event="propertyChange")]
    public function get _MeetingRoomLamp_SetProperty2():mx.states.SetProperty
    {
        return this._246656309_MeetingRoomLamp_SetProperty2;
    }

    public function set _MeetingRoomLamp_SetProperty2(value:mx.states.SetProperty):void
    {
    	var oldValue:Object = this._246656309_MeetingRoomLamp_SetProperty2;
        if (oldValue !== value)
        {
            this._246656309_MeetingRoomLamp_SetProperty2 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_MeetingRoomLamp_SetProperty2", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property _MeetingRoomLamp_SolidColor1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_MeetingRoomLamp_SolidColor1' moved to '_855417431_MeetingRoomLamp_SolidColor1'
	 */

    [Bindable(event="propertyChange")]
    public function get _MeetingRoomLamp_SolidColor1():mx.graphics.SolidColor
    {
        return this._855417431_MeetingRoomLamp_SolidColor1;
    }

    public function set _MeetingRoomLamp_SolidColor1(value:mx.graphics.SolidColor):void
    {
    	var oldValue:Object = this._855417431_MeetingRoomLamp_SolidColor1;
        if (oldValue !== value)
        {
            this._855417431_MeetingRoomLamp_SolidColor1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_MeetingRoomLamp_SolidColor1", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property bg (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'bg' moved to '_3141bg'
	 */

    [Bindable(event="propertyChange")]
    public function get bg():spark.primitives.Graphic
    {
        return this._3141bg;
    }

    public function set bg(value:spark.primitives.Graphic):void
    {
    	var oldValue:Object = this._3141bg;
        if (oldValue !== value)
        {
            this._3141bg = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "bg", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property body (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'body' moved to '_3029410body'
	 */

    [Bindable(event="propertyChange")]
    public function get body():spark.components.Group
    {
        return this._3029410body;
    }

    public function set body(value:spark.components.Group):void
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



}
