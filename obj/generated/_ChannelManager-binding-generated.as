


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import model.plugin.network.channel.*;
import model.app.network.*;

class BindableProperty
    implements flash.events.IEventDispatcher
{
	/*
	 * generated bindable wrapper for property defaultLoginChannel (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'defaultLoginChannel' moved to '_298942011defaultLoginChannel'
	 */

    [Bindable(event="propertyChange")]
    static public function get defaultLoginChannel():String
    {
        return ChannelManager._298942011defaultLoginChannel;
    }

    static public function set defaultLoginChannel(value:String):void
    {
    	var oldValue:Object = ChannelManager._298942011defaultLoginChannel;
        if (oldValue !== value)
        {
            ChannelManager._298942011defaultLoginChannel = value;
            var eventDispatcher:flash.events.IEventDispatcher = ChannelManager.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(ChannelManager, "defaultLoginChannel", oldValue, value));
            }
        }
    }

	/*
	 * generated bindable wrapper for property memberLoginTimeout (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'memberLoginTimeout' moved to '_230472334memberLoginTimeout'
	 */

    [Bindable(event="propertyChange")]
    static public function get memberLoginTimeout():uint
    {
        return ChannelManager._230472334memberLoginTimeout;
    }

    static public function set memberLoginTimeout(value:uint):void
    {
    	var oldValue:Object = ChannelManager._230472334memberLoginTimeout;
        if (oldValue !== value)
        {
            ChannelManager._230472334memberLoginTimeout = value;
            var eventDispatcher:flash.events.IEventDispatcher = ChannelManager.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(ChannelManager, "memberLoginTimeout", oldValue, value));
            }
        }
    }

	/*
	 * generated bindable wrapper for property separateBytes (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'separateBytes' moved to '_316224760separateBytes'
	 */

    [Bindable(event="propertyChange")]
    static public function get separateBytes():uint
    {
        return ChannelManager._316224760separateBytes;
    }

    static public function set separateBytes(value:uint):void
    {
    	var oldValue:Object = ChannelManager._316224760separateBytes;
        if (oldValue !== value)
        {
            ChannelManager._316224760separateBytes = value;
            var eventDispatcher:flash.events.IEventDispatcher = ChannelManager.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(ChannelManager, "separateBytes", oldValue, value));
            }
        }
    }

	/*
	 * generated bindable wrapper for property sendDataDelayTime (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'sendDataDelayTime' moved to '_1177283650sendDataDelayTime'
	 */

    [Bindable(event="propertyChange")]
    static public function get sendDataDelayTime():uint
    {
        return ChannelManager._1177283650sendDataDelayTime;
    }

    static public function set sendDataDelayTime(value:uint):void
    {
    	var oldValue:Object = ChannelManager._1177283650sendDataDelayTime;
        if (oldValue !== value)
        {
            ChannelManager._1177283650sendDataDelayTime = value;
            var eventDispatcher:flash.events.IEventDispatcher = ChannelManager.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(ChannelManager, "sendDataDelayTime", oldValue, value));
            }
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

    private static var _staticBindingEventDispatcher:flash.events.EventDispatcher =
        new flash.events.EventDispatcher();

    public static function get staticEventDispatcher():IEventDispatcher
    {
        return _staticBindingEventDispatcher;
    }
}
