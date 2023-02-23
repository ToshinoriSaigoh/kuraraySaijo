


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import mx.collections.ArrayCollection;

class BindableProperty
    implements flash.events.IEventDispatcher
{
	/*
	 * generated bindable wrapper for property stampFolderCollection (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'stampFolderCollection' moved to '_113481615stampFolderCollection'
	 */

    [Bindable(event="propertyChange")]
    public function get stampFolderCollection():ArrayCollection
    {
        return this._113481615stampFolderCollection;
    }

    public function set stampFolderCollection(value:ArrayCollection):void
    {
    	var oldValue:Object = this._113481615stampFolderCollection;
        if (oldValue !== value)
        {
            this._113481615stampFolderCollection = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "stampFolderCollection", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property stampCollection (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'stampCollection' moved to '_1888569663stampCollection'
	 */

    [Bindable(event="propertyChange")]
    public function get stampCollection():ArrayCollection
    {
        return this._1888569663stampCollection;
    }

    public function set stampCollection(value:ArrayCollection):void
    {
    	var oldValue:Object = this._1888569663stampCollection;
        if (oldValue !== value)
        {
            this._1888569663stampCollection = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "stampCollection", oldValue, value));
        }
    }


    //    IEventDispatcher implementation
    //
    private var _bindingEventDispatcher:flash.events.EventDispatcher =
        new flash.events.EventDispatcher(flash.events.IEventDispatcher(this));

	/**
	 * @inheritDoc
	 */
    public function addEventListener(type:String, listener:Function,
                                     useCapture:Boolean = false,
                                     priority:int = 0,
                                     weakRef:Boolean = false):void
    {
        _bindingEventDispatcher.addEventListener(type, listener, useCapture,
                                                 priority, weakRef);
    }

	/**
	 * @inheritDoc
	 */
    public function dispatchEvent(event:flash.events.Event):Boolean
    {
        return _bindingEventDispatcher.dispatchEvent(event);
    }

	/**
	 * @inheritDoc
	 */
    public function hasEventListener(type:String):Boolean
    {
        return _bindingEventDispatcher.hasEventListener(type);
    }

	/**
	 * @inheritDoc
	 */
    public function removeEventListener(type:String,
                                        listener:Function,
                                        useCapture:Boolean = false):void
    {
        _bindingEventDispatcher.removeEventListener(type, listener, useCapture);
    }

	/**
	 * @inheritDoc
	 */
    public function willTrigger(type:String):Boolean
    {
        return _bindingEventDispatcher.willTrigger(type);
    }

}
