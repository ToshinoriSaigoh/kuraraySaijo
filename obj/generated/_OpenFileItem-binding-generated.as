


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.core.SpriteVisualElement;
import spark.components.Group;
import spark.components.Button;
import view.utils.DataTypeMark;
import spark.components.Label;
import spark.components.ToggleButton;
import controller.documentroot.reportscreen.sidebar.filelistbox.OpenFileItem;

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
	 * generated bindable wrapper for property closeReportBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'closeReportBtn' moved to '_198529680closeReportBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get closeReportBtn():spark.components.Button
    {
        return this._198529680closeReportBtn;
    }

    public function set closeReportBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._198529680closeReportBtn;
        if (oldValue !== value)
        {
            this._198529680closeReportBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "closeReportBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property ctrlr (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlr' moved to '_94997351ctrlr'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlr():controller.documentroot.reportscreen.sidebar.filelistbox.OpenFileItem
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:controller.documentroot.reportscreen.sidebar.filelistbox.OpenFileItem):void
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
	 * generated bindable wrapper for property dataTypeMark (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dataTypeMark' moved to '_650700529dataTypeMark'
	 */

    [Bindable(event="propertyChange")]
    public function get dataTypeMark():view.utils.DataTypeMark
    {
        return this._650700529dataTypeMark;
    }

    public function set dataTypeMark(value:view.utils.DataTypeMark):void
    {
    	var oldValue:Object = this._650700529dataTypeMark;
        if (oldValue !== value)
        {
            this._650700529dataTypeMark = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dataTypeMark", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property date (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'date' moved to '_3076014date'
	 */

    [Bindable(event="propertyChange")]
    public function get date():spark.components.Label
    {
        return this._3076014date;
    }

    public function set date(value:spark.components.Label):void
    {
    	var oldValue:Object = this._3076014date;
        if (oldValue !== value)
        {
            this._3076014date = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "date", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property fileName (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'fileName' moved to '_735721945fileName'
	 */

    [Bindable(event="propertyChange")]
    public function get fileName():spark.components.Label
    {
        return this._735721945fileName;
    }

    public function set fileName(value:spark.components.Label):void
    {
    	var oldValue:Object = this._735721945fileName;
        if (oldValue !== value)
        {
            this._735721945fileName = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "fileName", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property openFileItem (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'openFileItem' moved to '_1752459033openFileItem'
	 */

    [Bindable(event="propertyChange")]
    public function get openFileItem():spark.components.Group
    {
        return this._1752459033openFileItem;
    }

    public function set openFileItem(value:spark.components.Group):void
    {
    	var oldValue:Object = this._1752459033openFileItem;
        if (oldValue !== value)
        {
            this._1752459033openFileItem = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "openFileItem", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property saveReportBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'saveReportBtn' moved to '_1945235339saveReportBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get saveReportBtn():spark.components.Button
    {
        return this._1945235339saveReportBtn;
    }

    public function set saveReportBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1945235339saveReportBtn;
        if (oldValue !== value)
        {
            this._1945235339saveReportBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "saveReportBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property shareReportBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'shareReportBtn' moved to '_1465872233shareReportBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get shareReportBtn():spark.components.Button
    {
        return this._1465872233shareReportBtn;
    }

    public function set shareReportBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1465872233shareReportBtn;
        if (oldValue !== value)
        {
            this._1465872233shareReportBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "shareReportBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property toggleBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'toggleBtn' moved to '_942316136toggleBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get toggleBtn():spark.components.ToggleButton
    {
        return this._942316136toggleBtn;
    }

    public function set toggleBtn(value:spark.components.ToggleButton):void
    {
    	var oldValue:Object = this._942316136toggleBtn;
        if (oldValue !== value)
        {
            this._942316136toggleBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "toggleBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property type (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'type' moved to '_3575610type'
	 */

    [Bindable(event="propertyChange")]
    public function get type():spark.components.Label
    {
        return this._3575610type;
    }

    public function set type(value:spark.components.Label):void
    {
    	var oldValue:Object = this._3575610type;
        if (oldValue !== value)
        {
            this._3575610type = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "type", oldValue, value));
        }
    }



}
