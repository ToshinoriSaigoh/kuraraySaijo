


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.primitives.Rect;
import controller.documentroot.reportscreen.sidebar.pager.LayerItemBtn;
import spark.components.Label;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property _Skin_LayerItemBtn_Rect3 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_Skin_LayerItemBtn_Rect3' moved to '_1371985451_Skin_LayerItemBtn_Rect3'
	 */

    [Bindable(event="propertyChange")]
    public function get _Skin_LayerItemBtn_Rect3():spark.primitives.Rect
    {
        return this._1371985451_Skin_LayerItemBtn_Rect3;
    }

    public function set _Skin_LayerItemBtn_Rect3(value:spark.primitives.Rect):void
    {
    	var oldValue:Object = this._1371985451_Skin_LayerItemBtn_Rect3;
        if (oldValue !== value)
        {
            this._1371985451_Skin_LayerItemBtn_Rect3 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Skin_LayerItemBtn_Rect3", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property ctrlr (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlr' moved to '_94997351ctrlr'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlr():controller.documentroot.reportscreen.sidebar.pager.LayerItemBtn
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:controller.documentroot.reportscreen.sidebar.pager.LayerItemBtn):void
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
