


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.core.SpriteVisualElement;
import spark.components.Group;
import controller.documentroot.reportscreen.sidebar.filelistbox.FileItem;
import view.utils.DataTypeMark;
import spark.components.Button;
import spark.components.Label;
import spark.components.ToggleButton;

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
	 * generated bindable wrapper for property ctrlr (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlr' moved to '_94997351ctrlr'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlr():controller.documentroot.reportscreen.sidebar.filelistbox.FileItem
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:controller.documentroot.reportscreen.sidebar.filelistbox.FileItem):void
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
	 * generated bindable wrapper for property deleteFileBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'deleteFileBtn' moved to '_1059800299deleteFileBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get deleteFileBtn():spark.components.Button
    {
        return this._1059800299deleteFileBtn;
    }

    public function set deleteFileBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1059800299deleteFileBtn;
        if (oldValue !== value)
        {
            this._1059800299deleteFileBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "deleteFileBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property fileItem (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'fileItem' moved to '_735852881fileItem'
	 */

    [Bindable(event="propertyChange")]
    public function get fileItem():spark.components.Group
    {
        return this._735852881fileItem;
    }

    public function set fileItem(value:spark.components.Group):void
    {
    	var oldValue:Object = this._735852881fileItem;
        if (oldValue !== value)
        {
            this._735852881fileItem = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "fileItem", oldValue, value));
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
	 * generated bindable wrapper for property openFileBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'openFileBtn' moved to '_1051854442openFileBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get openFileBtn():spark.components.Button
    {
        return this._1051854442openFileBtn;
    }

    public function set openFileBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1051854442openFileBtn;
        if (oldValue !== value)
        {
            this._1051854442openFileBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "openFileBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property playFileBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'playFileBtn' moved to '_1431824020playFileBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get playFileBtn():spark.components.Button
    {
        return this._1431824020playFileBtn;
    }

    public function set playFileBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1431824020playFileBtn;
        if (oldValue !== value)
        {
            this._1431824020playFileBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "playFileBtn", oldValue, value));
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
