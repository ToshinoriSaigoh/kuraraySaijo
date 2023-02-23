


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import mx.containers.ViewStack;
import spark.core.SpriteVisualElement;
import kuraraysaijo.view.documentroot.AlertScreen;
import kuraraysaijo.view.documentroot.ReportScreen;
import kuraraysaijo.view.documentroot.InitScreen;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property AlertScreen (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'AlertScreen' moved to '_703621320AlertScreen'
	 */

    [Bindable(event="propertyChange")]
    public function get AlertScreen():kuraraysaijo.view.documentroot.AlertScreen
    {
        return this._703621320AlertScreen;
    }

    public function set AlertScreen(value:kuraraysaijo.view.documentroot.AlertScreen):void
    {
    	var oldValue:Object = this._703621320AlertScreen;
        if (oldValue !== value)
        {
            this._703621320AlertScreen = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "AlertScreen", oldValue, value));
        }
    }

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
	 * generated bindable wrapper for property initScreen (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'initScreen' moved to '_243271068initScreen'
	 */

    [Bindable(event="propertyChange")]
    public function get initScreen():kuraraysaijo.view.documentroot.InitScreen
    {
        return this._243271068initScreen;
    }

    public function set initScreen(value:kuraraysaijo.view.documentroot.InitScreen):void
    {
    	var oldValue:Object = this._243271068initScreen;
        if (oldValue !== value)
        {
            this._243271068initScreen = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "initScreen", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property reportScreen (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'reportScreen' moved to '_587680448reportScreen'
	 */

    [Bindable(event="propertyChange")]
    public function get reportScreen():kuraraysaijo.view.documentroot.ReportScreen
    {
        return this._587680448reportScreen;
    }

    public function set reportScreen(value:kuraraysaijo.view.documentroot.ReportScreen):void
    {
    	var oldValue:Object = this._587680448reportScreen;
        if (oldValue !== value)
        {
            this._587680448reportScreen = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "reportScreen", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property rootViewStack (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'rootViewStack' moved to '_438897631rootViewStack'
	 */

    [Bindable(event="propertyChange")]
    public function get rootViewStack():mx.containers.ViewStack
    {
        return this._438897631rootViewStack;
    }

    public function set rootViewStack(value:mx.containers.ViewStack):void
    {
    	var oldValue:Object = this._438897631rootViewStack;
        if (oldValue !== value)
        {
            this._438897631rootViewStack = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "rootViewStack", oldValue, value));
        }
    }



}
