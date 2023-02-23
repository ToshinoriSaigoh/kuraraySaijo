


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.components.HSlider;
import spark.components.Group;
import spark.components.Button;
import mx.core.ClassFactory;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property dataTip (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dataTip' moved to '_1443184785dataTip'
	 */

    [Bindable(event="propertyChange")]
    public function get dataTip():mx.core.ClassFactory
    {
        return this._1443184785dataTip;
    }

    public function set dataTip(value:mx.core.ClassFactory):void
    {
    	var oldValue:Object = this._1443184785dataTip;
        if (oldValue !== value)
        {
            this._1443184785dataTip = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dataTip", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property slideBar (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'slideBar' moved to '_1272636254slideBar'
	 */

    [Bindable(event="propertyChange")]
    public function get slideBar():spark.components.Group
    {
        return this._1272636254slideBar;
    }

    public function set slideBar(value:spark.components.Group):void
    {
    	var oldValue:Object = this._1272636254slideBar;
        if (oldValue !== value)
        {
            this._1272636254slideBar = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "slideBar", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property thumb (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'thumb' moved to '_110342614thumb'
	 */

    [Bindable(event="propertyChange")]
    public function get thumb():spark.components.Button
    {
        return this._110342614thumb;
    }

    public function set thumb(value:spark.components.Button):void
    {
    	var oldValue:Object = this._110342614thumb;
        if (oldValue !== value)
        {
            this._110342614thumb = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "thumb", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property track (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'track' moved to '_110621003track'
	 */

    [Bindable(event="propertyChange")]
    public function get track():spark.components.Button
    {
        return this._110621003track;
    }

    public function set track(value:spark.components.Button):void
    {
    	var oldValue:Object = this._110621003track;
        if (oldValue !== value)
        {
            this._110621003track = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "track", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property hostComponent (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'hostComponent' moved to '_213507019hostComponent'
	 */

    [Bindable(event="propertyChange")]
    public function get hostComponent():spark.components.HSlider
    {
        return this._213507019hostComponent;
    }

    public function set hostComponent(value:spark.components.HSlider):void
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
