


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.components.Group;
import spark.components.DataGroup;
import spark.components.Label;
import model.plugin.report.emergency.EmergencyHeader;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property ctrlr (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlr' moved to '_94997351ctrlr'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlr():model.plugin.report.emergency.EmergencyHeader
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:model.plugin.report.emergency.EmergencyHeader):void
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
	 * generated bindable wrapper for property datetime (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'datetime' moved to '_1793702779datetime'
	 */

    [Bindable(event="propertyChange")]
    public function get datetime():spark.components.Label
    {
        return this._1793702779datetime;
    }

    public function set datetime(value:spark.components.Label):void
    {
    	var oldValue:Object = this._1793702779datetime;
        if (oldValue !== value)
        {
            this._1793702779datetime = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "datetime", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property emergencyHeadMenu (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'emergencyHeadMenu' moved to '_782004240emergencyHeadMenu'
	 */

    [Bindable(event="propertyChange")]
    public function get emergencyHeadMenu():spark.components.Group
    {
        return this._782004240emergencyHeadMenu;
    }

    public function set emergencyHeadMenu(value:spark.components.Group):void
    {
    	var oldValue:Object = this._782004240emergencyHeadMenu;
        if (oldValue !== value)
        {
            this._782004240emergencyHeadMenu = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "emergencyHeadMenu", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property menu (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'menu' moved to '_3347807menu'
	 */

    [Bindable(event="propertyChange")]
    public function get menu():spark.components.Group
    {
        return this._3347807menu;
    }

    public function set menu(value:spark.components.Group):void
    {
    	var oldValue:Object = this._3347807menu;
        if (oldValue !== value)
        {
            this._3347807menu = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "menu", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property menuList (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'menuList' moved to '_604015971menuList'
	 */

    [Bindable(event="propertyChange")]
    public function get menuList():spark.components.DataGroup
    {
        return this._604015971menuList;
    }

    public function set menuList(value:spark.components.DataGroup):void
    {
    	var oldValue:Object = this._604015971menuList;
        if (oldValue !== value)
        {
            this._604015971menuList = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "menuList", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property title (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'title' moved to '_110371416title'
	 */

    [Bindable(event="propertyChange")]
    public function get title():spark.components.Label
    {
        return this._110371416title;
    }

    public function set title(value:spark.components.Label):void
    {
    	var oldValue:Object = this._110371416title;
        if (oldValue !== value)
        {
            this._110371416title = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "title", oldValue, value));
        }
    }



}
