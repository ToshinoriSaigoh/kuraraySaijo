


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import model.plugin.report.emergency.*;
import common.*;
import mx.collections.ArrayCollection;

class BindableProperty
    implements flash.events.IEventDispatcher
{
	/*
	 * generated bindable wrapper for property emergencyTypeCollection (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'emergencyTypeCollection' moved to '_1490147689emergencyTypeCollection'
	 */

    [Bindable(event="propertyChange")]
    static public function get emergencyTypeCollection():ArrayCollection
    {
        return Emergency._1490147689emergencyTypeCollection;
    }

    static public function set emergencyTypeCollection(value:ArrayCollection):void
    {
    	var oldValue:Object = Emergency._1490147689emergencyTypeCollection;
        if (oldValue !== value)
        {
            Emergency._1490147689emergencyTypeCollection = value;
            var eventDispatcher:flash.events.IEventDispatcher = Emergency.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(Emergency, "emergencyTypeCollection", oldValue, value));
            }
        }
    }

	/*
	 * generated bindable wrapper for property activeEmergencyType (static public)
	 * - generated setter
	 * - generated getter
	 * - original static public var 'activeEmergencyType' moved to '_1336253691activeEmergencyType'
	 */

    [Bindable(event="propertyChange")]
    static public function get activeEmergencyType():String
    {
        return Emergency._1336253691activeEmergencyType;
    }

    static public function set activeEmergencyType(value:String):void
    {
    	var oldValue:Object = Emergency._1336253691activeEmergencyType;
        if (oldValue !== value)
        {
            Emergency._1336253691activeEmergencyType = value;
            var eventDispatcher:flash.events.IEventDispatcher = Emergency.staticEventDispatcher;
            if (eventDispatcher != null && eventDispatcher.hasEventListener("propertyChange"))
            {
                eventDispatcher.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(Emergency, "activeEmergencyType", oldValue, value));
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
