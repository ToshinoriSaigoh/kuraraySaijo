


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import model.plugin.report.*;
import controller.*;

class BindableProperty
    implements flash.events.IEventDispatcher
{
	/*
	 * generated bindable wrapper for property playState (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'playState' moved to '_1888605763playState'
	 */

    [Bindable(event="propertyChange")]
    public function get playState():String
    {
        return this._1888605763playState;
    }

    public function set playState(value:String):void
    {
    	var oldValue:Object = this._1888605763playState;
        if (oldValue !== value)
        {
            this._1888605763playState = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "playState", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property id (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'id' moved to '_3355id'
	 */

    [Bindable(event="propertyChange")]
    public function get id():String
    {
        return this._3355id;
    }

    public function set id(value:String):void
    {
    	var oldValue:Object = this._3355id;
        if (oldValue !== value)
        {
            this._3355id = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "id", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property reportName (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'reportName' moved to '_1931184607reportName'
	 */

    [Bindable(event="propertyChange")]
    public function get reportName():String
    {
        return this._1931184607reportName;
    }

    public function set reportName(value:String):void
    {
    	var oldValue:Object = this._1931184607reportName;
        if (oldValue !== value)
        {
            this._1931184607reportName = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "reportName", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property reportType (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'reportType' moved to '_1931386510reportType'
	 */

    [Bindable(event="propertyChange")]
    public function get reportType():String
    {
        return this._1931386510reportType;
    }

    public function set reportType(value:String):void
    {
    	var oldValue:Object = this._1931386510reportType;
        if (oldValue !== value)
        {
            this._1931386510reportType = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "reportType", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property saveDate (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'saveDate' moved to '_2073092405saveDate'
	 */

    [Bindable(event="propertyChange")]
    public function get saveDate():String
    {
        return this._2073092405saveDate;
    }

    public function set saveDate(value:String):void
    {
    	var oldValue:Object = this._2073092405saveDate;
        if (oldValue !== value)
        {
            this._2073092405saveDate = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "saveDate", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property baseTime (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'baseTime' moved to '_1721500354baseTime'
	 */

    [Bindable(event="propertyChange")]
    public function get baseTime():Number
    {
        return this._1721500354baseTime;
    }

    public function set baseTime(value:Number):void
    {
    	var oldValue:Object = this._1721500354baseTime;
        if (oldValue !== value)
        {
            this._1721500354baseTime = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "baseTime", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property firstTime (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'firstTime' moved to '_133022109firstTime'
	 */

    [Bindable(event="propertyChange")]
    public function get firstTime():Number
    {
        return this._133022109firstTime;
    }

    public function set firstTime(value:Number):void
    {
    	var oldValue:Object = this._133022109firstTime;
        if (oldValue !== value)
        {
            this._133022109firstTime = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "firstTime", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property lastTime (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'lastTime' moved to '_1459413373lastTime'
	 */

    [Bindable(event="propertyChange")]
    public function get lastTime():Number
    {
        return this._1459413373lastTime;
    }

    public function set lastTime(value:Number):void
    {
    	var oldValue:Object = this._1459413373lastTime;
        if (oldValue !== value)
        {
            this._1459413373lastTime = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "lastTime", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property nowTime (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'nowTime' moved to '_2131498691nowTime'
	 */

    [Bindable(event="propertyChange")]
    public function get nowTime():Number
    {
        return this._2131498691nowTime;
    }

    public function set nowTime(value:Number):void
    {
    	var oldValue:Object = this._2131498691nowTime;
        if (oldValue !== value)
        {
            this._2131498691nowTime = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "nowTime", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property playStartTimeStamp (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'playStartTimeStamp' moved to '_1457189112playStartTimeStamp'
	 */

    [Bindable(event="propertyChange")]
    public function get playStartTimeStamp():Number
    {
        return this._1457189112playStartTimeStamp;
    }

    public function set playStartTimeStamp(value:Number):void
    {
    	var oldValue:Object = this._1457189112playStartTimeStamp;
        if (oldValue !== value)
        {
            this._1457189112playStartTimeStamp = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "playStartTimeStamp", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property dateText (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dateText' moved to '_1792745979dateText'
	 */

    [Bindable(event="propertyChange")]
    public function get dateText():String
    {
        return this._1792745979dateText;
    }

    public function set dateText(value:String):void
    {
    	var oldValue:Object = this._1792745979dateText;
        if (oldValue !== value)
        {
            this._1792745979dateText = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dateText", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property timeText (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'timeText' moved to '_2077368934timeText'
	 */

    [Bindable(event="propertyChange")]
    public function get timeText():String
    {
        return this._2077368934timeText;
    }

    public function set timeText(value:String):void
    {
    	var oldValue:Object = this._2077368934timeText;
        if (oldValue !== value)
        {
            this._2077368934timeText = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "timeText", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property totalText (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'totalText' moved to '_577285487totalText'
	 */

    [Bindable(event="propertyChange")]
    public function get totalText():String
    {
        return this._577285487totalText;
    }

    public function set totalText(value:String):void
    {
    	var oldValue:Object = this._577285487totalText;
        if (oldValue !== value)
        {
            this._577285487totalText = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "totalText", oldValue, value));
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
