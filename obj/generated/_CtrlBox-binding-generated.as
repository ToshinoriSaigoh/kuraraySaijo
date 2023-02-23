


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import mx.states.SetProperty;
import spark.core.SpriteVisualElement;
import spark.components.Group;
import spark.components.DataGroup;
import spark.components.Button;
import spark.components.VGroup;
import spark.components.Scroller;
import controller.documentroot.reportscreen.sidebar.pager.CtrlBox;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property _CtrlBox_SetProperty1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_CtrlBox_SetProperty1' moved to '_926846888_CtrlBox_SetProperty1'
	 */

    [Bindable(event="propertyChange")]
    public function get _CtrlBox_SetProperty1():mx.states.SetProperty
    {
        return this._926846888_CtrlBox_SetProperty1;
    }

    public function set _CtrlBox_SetProperty1(value:mx.states.SetProperty):void
    {
    	var oldValue:Object = this._926846888_CtrlBox_SetProperty1;
        if (oldValue !== value)
        {
            this._926846888_CtrlBox_SetProperty1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_CtrlBox_SetProperty1", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property addLayer (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'addLayer' moved to '_1253922512addLayer'
	 */

    [Bindable(event="propertyChange")]
    public function get addLayer():spark.components.Button
    {
        return this._1253922512addLayer;
    }

    public function set addLayer(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1253922512addLayer;
        if (oldValue !== value)
        {
            this._1253922512addLayer = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "addLayer", oldValue, value));
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
    public function get ctrlr():controller.documentroot.reportscreen.sidebar.pager.CtrlBox
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:controller.documentroot.reportscreen.sidebar.pager.CtrlBox):void
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
	 * generated bindable wrapper for property layerBox (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'layerBox' moved to '_1300634950layerBox'
	 */

    [Bindable(event="propertyChange")]
    public function get layerBox():spark.components.VGroup
    {
        return this._1300634950layerBox;
    }

    public function set layerBox(value:spark.components.VGroup):void
    {
    	var oldValue:Object = this._1300634950layerBox;
        if (oldValue !== value)
        {
            this._1300634950layerBox = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "layerBox", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property layerBoxFooter (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'layerBoxFooter' moved to '_1628639477layerBoxFooter'
	 */

    [Bindable(event="propertyChange")]
    public function get layerBoxFooter():spark.components.Group
    {
        return this._1628639477layerBoxFooter;
    }

    public function set layerBoxFooter(value:spark.components.Group):void
    {
    	var oldValue:Object = this._1628639477layerBoxFooter;
        if (oldValue !== value)
        {
            this._1628639477layerBoxFooter = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "layerBoxFooter", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property layerListBox (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'layerListBox' moved to '_1336311228layerListBox'
	 */

    [Bindable(event="propertyChange")]
    public function get layerListBox():spark.components.Scroller
    {
        return this._1336311228layerListBox;
    }

    public function set layerListBox(value:spark.components.Scroller):void
    {
    	var oldValue:Object = this._1336311228layerListBox;
        if (oldValue !== value)
        {
            this._1336311228layerListBox = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "layerListBox", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property layerListData (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'layerListData' moved to '_1523978791layerListData'
	 */

    [Bindable(event="propertyChange")]
    public function get layerListData():spark.components.DataGroup
    {
        return this._1523978791layerListData;
    }

    public function set layerListData(value:spark.components.DataGroup):void
    {
    	var oldValue:Object = this._1523978791layerListData;
        if (oldValue !== value)
        {
            this._1523978791layerListData = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "layerListData", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property thumbBox (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'thumbBox' moved to '_1566899221thumbBox'
	 */

    [Bindable(event="propertyChange")]
    public function get thumbBox():spark.components.Button
    {
        return this._1566899221thumbBox;
    }

    public function set thumbBox(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1566899221thumbBox;
        if (oldValue !== value)
        {
            this._1566899221thumbBox = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "thumbBox", oldValue, value));
        }
    }



}
