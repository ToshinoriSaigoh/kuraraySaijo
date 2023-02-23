


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import view.documentroot.reportscreen.palletcontainer.ColorPallet;
import spark.core.SpriteVisualElement;
import view.documentroot.reportscreen.palletcontainer.TimelinePallet;
import controller.documentroot.reportscreen.PalletContainer;
import view.documentroot.reportscreen.palletcontainer.StampPallet;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property body (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'body' moved to '_3029410body'
	 */

    [Bindable(event="propertyChange")]
    public function get body():spark.core.SpriteVisualElement
    {
        return this._3029410body;
    }

    public function set body(value:spark.core.SpriteVisualElement):void
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
	 * generated bindable wrapper for property colorPallet (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'colorPallet' moved to '_878587107colorPallet'
	 */

    [Bindable(event="propertyChange")]
    public function get colorPallet():view.documentroot.reportscreen.palletcontainer.ColorPallet
    {
        return this._878587107colorPallet;
    }

    public function set colorPallet(value:view.documentroot.reportscreen.palletcontainer.ColorPallet):void
    {
    	var oldValue:Object = this._878587107colorPallet;
        if (oldValue !== value)
        {
            this._878587107colorPallet = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "colorPallet", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property ctrlr (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlr' moved to '_94997351ctrlr'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlr():controller.documentroot.reportscreen.PalletContainer
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:controller.documentroot.reportscreen.PalletContainer):void
    {
    	var oldValue:Object = this._94997351ctrlr;
        if (oldValue !== value)
        {
            this._94997351ctrlr = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ctrlr", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property stampPallet (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'stampPallet' moved to '_1348929213stampPallet'
	 */

    [Bindable(event="propertyChange")]
    public function get stampPallet():view.documentroot.reportscreen.palletcontainer.StampPallet
    {
        return this._1348929213stampPallet;
    }

    public function set stampPallet(value:view.documentroot.reportscreen.palletcontainer.StampPallet):void
    {
    	var oldValue:Object = this._1348929213stampPallet;
        if (oldValue !== value)
        {
            this._1348929213stampPallet = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "stampPallet", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property timelinePallet (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'timelinePallet' moved to '_533476161timelinePallet'
	 */

    [Bindable(event="propertyChange")]
    public function get timelinePallet():view.documentroot.reportscreen.palletcontainer.TimelinePallet
    {
        return this._533476161timelinePallet;
    }

    public function set timelinePallet(value:view.documentroot.reportscreen.palletcontainer.TimelinePallet):void
    {
    	var oldValue:Object = this._533476161timelinePallet;
        if (oldValue !== value)
        {
            this._533476161timelinePallet = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "timelinePallet", oldValue, value));
        }
    }



}
