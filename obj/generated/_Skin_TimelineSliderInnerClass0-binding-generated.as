


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.components.Label;
import view.documentroot.reportscreen.palletcontainer.timelinepallet.Skin_TimelineSlider;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property labelField (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'labelField' moved to '_1672910234labelField'
	 */

    [Bindable(event="propertyChange")]
    public function get labelField():spark.components.Label
    {
        return this._1672910234labelField;
    }

    public function set labelField(value:spark.components.Label):void
    {
    	var oldValue:Object = this._1672910234labelField;
        if (oldValue !== value)
        {
            this._1672910234labelField = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "labelField", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property outerDocument (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'outerDocument' moved to '_88844982outerDocument'
	 */

    [Bindable(event="propertyChange")]
    public function get outerDocument():view.documentroot.reportscreen.palletcontainer.timelinepallet.Skin_TimelineSlider
    {
        return this._88844982outerDocument;
    }

    public function set outerDocument(value:view.documentroot.reportscreen.palletcontainer.timelinepallet.Skin_TimelineSlider):void
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
