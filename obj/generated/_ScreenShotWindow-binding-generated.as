


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.components.Button;
import controller.ScreenShotWindow;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property closeBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'closeBtn' moved to '_1092797764closeBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get closeBtn():spark.components.Button
    {
        return this._1092797764closeBtn;
    }

    public function set closeBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1092797764closeBtn;
        if (oldValue !== value)
        {
            this._1092797764closeBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "closeBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property ctrlr (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlr' moved to '_94997351ctrlr'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlr():controller.ScreenShotWindow
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:controller.ScreenShotWindow):void
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
	 * generated bindable wrapper for property shotBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'shotBtn' moved to '_2067173634shotBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get shotBtn():spark.components.Button
    {
        return this._2067173634shotBtn;
    }

    public function set shotBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._2067173634shotBtn;
        if (oldValue !== value)
        {
            this._2067173634shotBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "shotBtn", oldValue, value));
        }
    }



}
