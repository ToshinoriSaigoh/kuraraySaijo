


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.core.SpriteVisualElement;
import spark.components.Group;
import spark.components.DataGroup;
import controller.documentroot.reportscreen.palletcontainer.StampPallet;
import spark.components.Scroller;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property bg (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'bg' moved to '_3141bg'
	 */

    [Bindable(event="propertyChange")]
    public function get bg():spark.components.Group
    {
        return this._3141bg;
    }

    public function set bg(value:spark.components.Group):void
    {
    	var oldValue:Object = this._3141bg;
        if (oldValue !== value)
        {
            this._3141bg = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "bg", oldValue, value));
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
    public function get ctrlr():controller.documentroot.reportscreen.palletcontainer.StampPallet
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:controller.documentroot.reportscreen.palletcontainer.StampPallet):void
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
	 * generated bindable wrapper for property folderList (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'folderList' moved to '_828286420folderList'
	 */

    [Bindable(event="propertyChange")]
    public function get folderList():spark.components.DataGroup
    {
        return this._828286420folderList;
    }

    public function set folderList(value:spark.components.DataGroup):void
    {
    	var oldValue:Object = this._828286420folderList;
        if (oldValue !== value)
        {
            this._828286420folderList = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "folderList", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property stampFolders (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'stampFolders' moved to '_1248334978stampFolders'
	 */

    [Bindable(event="propertyChange")]
    public function get stampFolders():spark.components.Scroller
    {
        return this._1248334978stampFolders;
    }

    public function set stampFolders(value:spark.components.Scroller):void
    {
    	var oldValue:Object = this._1248334978stampFolders;
        if (oldValue !== value)
        {
            this._1248334978stampFolders = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "stampFolders", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property stampList (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'stampList' moved to '_2018594561stampList'
	 */

    [Bindable(event="propertyChange")]
    public function get stampList():spark.components.DataGroup
    {
        return this._2018594561stampList;
    }

    public function set stampList(value:spark.components.DataGroup):void
    {
    	var oldValue:Object = this._2018594561stampList;
        if (oldValue !== value)
        {
            this._2018594561stampList = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "stampList", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property stampListContainer (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'stampListContainer' moved to '_1341419136stampListContainer'
	 */

    [Bindable(event="propertyChange")]
    public function get stampListContainer():spark.components.Scroller
    {
        return this._1341419136stampListContainer;
    }

    public function set stampListContainer(value:spark.components.Scroller):void
    {
    	var oldValue:Object = this._1341419136stampListContainer;
        if (oldValue !== value)
        {
            this._1341419136stampListContainer = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "stampListContainer", oldValue, value));
        }
    }



}
