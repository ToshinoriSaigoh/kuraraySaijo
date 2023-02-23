


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.core.SpriteVisualElement;
import view.documentroot.reportscreen.PalletContainer;
import kuraraysaijo.controller.documentroot.ReportScreen;
import kuraraysaijo.view.documentroot.reportscreen.SideBar;
import kuraraysaijo.view.documentroot.reportscreen.DrawContents;
import model.plugin.report.emergency.view.EmergencyHeader;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property EmergencyHeader (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'EmergencyHeader' moved to '_1773855906EmergencyHeader'
	 */

    [Bindable(event="propertyChange")]
    public function get EmergencyHeader():model.plugin.report.emergency.view.EmergencyHeader
    {
        return this._1773855906EmergencyHeader;
    }

    public function set EmergencyHeader(value:model.plugin.report.emergency.view.EmergencyHeader):void
    {
    	var oldValue:Object = this._1773855906EmergencyHeader;
        if (oldValue !== value)
        {
            this._1773855906EmergencyHeader = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "EmergencyHeader", oldValue, value));
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
	 * generated bindable wrapper for property ctrlr (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlr' moved to '_94997351ctrlr'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlr():kuraraysaijo.controller.documentroot.ReportScreen
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:kuraraysaijo.controller.documentroot.ReportScreen):void
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
	 * generated bindable wrapper for property drawContents (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'drawContents' moved to '_1393989506drawContents'
	 */

    [Bindable(event="propertyChange")]
    public function get drawContents():kuraraysaijo.view.documentroot.reportscreen.DrawContents
    {
        return this._1393989506drawContents;
    }

    public function set drawContents(value:kuraraysaijo.view.documentroot.reportscreen.DrawContents):void
    {
    	var oldValue:Object = this._1393989506drawContents;
        if (oldValue !== value)
        {
            this._1393989506drawContents = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "drawContents", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property palletContainer (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'palletContainer' moved to '_1850369855palletContainer'
	 */

    [Bindable(event="propertyChange")]
    public function get palletContainer():view.documentroot.reportscreen.PalletContainer
    {
        return this._1850369855palletContainer;
    }

    public function set palletContainer(value:view.documentroot.reportscreen.PalletContainer):void
    {
    	var oldValue:Object = this._1850369855palletContainer;
        if (oldValue !== value)
        {
            this._1850369855palletContainer = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "palletContainer", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property sideBar (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'sideBar' moved to '_2085196604sideBar'
	 */

    [Bindable(event="propertyChange")]
    public function get sideBar():kuraraysaijo.view.documentroot.reportscreen.SideBar
    {
        return this._2085196604sideBar;
    }

    public function set sideBar(value:kuraraysaijo.view.documentroot.reportscreen.SideBar):void
    {
    	var oldValue:Object = this._2085196604sideBar;
        if (oldValue !== value)
        {
            this._2085196604sideBar = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "sideBar", oldValue, value));
        }
    }



}
