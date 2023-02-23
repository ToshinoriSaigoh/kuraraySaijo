


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import mx.containers.ViewStack;
import spark.core.SpriteVisualElement;
import spark.components.Group;
import spark.components.Button;
import spark.components.Label;
import kuraraysaijo.view.documentroot.reportscreen.sidebar.settingsbox.SettingsKuraraySaijoContainer;
import kuraraysaijo.controller.documentroot.reportscreen.sidebar.SettingsBox;

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
    public function get ctrlr():kuraraysaijo.controller.documentroot.reportscreen.sidebar.SettingsBox
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:kuraraysaijo.controller.documentroot.reportscreen.sidebar.SettingsBox):void
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
	 * generated bindable wrapper for property header (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'header' moved to '_1221270899header'
	 */

    [Bindable(event="propertyChange")]
    public function get header():spark.components.Group
    {
        return this._1221270899header;
    }

    public function set header(value:spark.components.Group):void
    {
    	var oldValue:Object = this._1221270899header;
        if (oldValue !== value)
        {
            this._1221270899header = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "header", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property headerLabel (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'headerLabel' moved to '_1166031975headerLabel'
	 */

    [Bindable(event="propertyChange")]
    public function get headerLabel():spark.components.Label
    {
        return this._1166031975headerLabel;
    }

    public function set headerLabel(value:spark.components.Label):void
    {
    	var oldValue:Object = this._1166031975headerLabel;
        if (oldValue !== value)
        {
            this._1166031975headerLabel = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "headerLabel", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property settingsKuraraySaijoContainer (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'settingsKuraraySaijoContainer' moved to '_1485287535settingsKuraraySaijoContainer'
	 */

    [Bindable(event="propertyChange")]
    public function get settingsKuraraySaijoContainer():kuraraysaijo.view.documentroot.reportscreen.sidebar.settingsbox.SettingsKuraraySaijoContainer
    {
        return this._1485287535settingsKuraraySaijoContainer;
    }

    public function set settingsKuraraySaijoContainer(value:kuraraysaijo.view.documentroot.reportscreen.sidebar.settingsbox.SettingsKuraraySaijoContainer):void
    {
    	var oldValue:Object = this._1485287535settingsKuraraySaijoContainer;
        if (oldValue !== value)
        {
            this._1485287535settingsKuraraySaijoContainer = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "settingsKuraraySaijoContainer", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property settingsViewStack (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'settingsViewStack' moved to '_719442432settingsViewStack'
	 */

    [Bindable(event="propertyChange")]
    public function get settingsViewStack():mx.containers.ViewStack
    {
        return this._719442432settingsViewStack;
    }

    public function set settingsViewStack(value:mx.containers.ViewStack):void
    {
    	var oldValue:Object = this._719442432settingsViewStack;
        if (oldValue !== value)
        {
            this._719442432settingsViewStack = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "settingsViewStack", oldValue, value));
        }
    }



}
