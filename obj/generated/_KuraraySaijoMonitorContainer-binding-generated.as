


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import kuraraysaijo.model.plugin.config.WarningInfo;
import kuraraysaijo.model.plugin.report.*;

class BindableProperty
    implements flash.events.IEventDispatcher
{
	/*
	 * generated bindable wrapper for property noAccidentAll (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'noAccidentAll' moved to '_1730832529noAccidentAll'
	 */

    [Bindable(event="propertyChange")]
    public function get noAccidentAll():String
    {
        return this._1730832529noAccidentAll;
    }

    public function set noAccidentAll(value:String):void
    {
    	var oldValue:Object = this._1730832529noAccidentAll;
        if (oldValue !== value)
        {
            this._1730832529noAccidentAll = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "noAccidentAll", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property noAccidentDept (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'noAccidentDept' moved to '_2116283733noAccidentDept'
	 */

    [Bindable(event="propertyChange")]
    public function get noAccidentDept():String
    {
        return this._2116283733noAccidentDept;
    }

    public function set noAccidentDept(value:String):void
    {
    	var oldValue:Object = this._2116283733noAccidentDept;
        if (oldValue !== value)
        {
            this._2116283733noAccidentDept = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "noAccidentDept", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property morningDesigning (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'morningDesigning' moved to '_1484388864morningDesigning'
	 */

    [Bindable(event="propertyChange")]
    public function get morningDesigning():String
    {
        return this._1484388864morningDesigning;
    }

    public function set morningDesigning(value:String):void
    {
    	var oldValue:Object = this._1484388864morningDesigning;
        if (oldValue !== value)
        {
            this._1484388864morningDesigning = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "morningDesigning", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property exerciseDesigning (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'exerciseDesigning' moved to '_443827820exerciseDesigning'
	 */

    [Bindable(event="propertyChange")]
    public function get exerciseDesigning():String
    {
        return this._443827820exerciseDesigning;
    }

    public function set exerciseDesigning(value:String):void
    {
    	var oldValue:Object = this._443827820exerciseDesigning;
        if (oldValue !== value)
        {
            this._443827820exerciseDesigning = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "exerciseDesigning", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property dust1Designing (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dust1Designing' moved to '_981573531dust1Designing'
	 */

    [Bindable(event="propertyChange")]
    public function get dust1Designing():String
    {
        return this._981573531dust1Designing;
    }

    public function set dust1Designing(value:String):void
    {
    	var oldValue:Object = this._981573531dust1Designing;
        if (oldValue !== value)
        {
            this._981573531dust1Designing = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dust1Designing", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property dust2Designing (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dust2Designing' moved to '_1178087036dust2Designing'
	 */

    [Bindable(event="propertyChange")]
    public function get dust2Designing():String
    {
        return this._1178087036dust2Designing;
    }

    public function set dust2Designing(value:String):void
    {
    	var oldValue:Object = this._1178087036dust2Designing;
        if (oldValue !== value)
        {
            this._1178087036dust2Designing = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dust2Designing", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property morningPipe (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'morningPipe' moved to '_1852287890morningPipe'
	 */

    [Bindable(event="propertyChange")]
    public function get morningPipe():String
    {
        return this._1852287890morningPipe;
    }

    public function set morningPipe(value:String):void
    {
    	var oldValue:Object = this._1852287890morningPipe;
        if (oldValue !== value)
        {
            this._1852287890morningPipe = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "morningPipe", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property exercisePipe (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'exercisePipe' moved to '_466465882exercisePipe'
	 */

    [Bindable(event="propertyChange")]
    public function get exercisePipe():String
    {
        return this._466465882exercisePipe;
    }

    public function set exercisePipe(value:String):void
    {
    	var oldValue:Object = this._466465882exercisePipe;
        if (oldValue !== value)
        {
            this._466465882exercisePipe = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "exercisePipe", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property dust1Pipe (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dust1Pipe' moved to '_254010867dust1Pipe'
	 */

    [Bindable(event="propertyChange")]
    public function get dust1Pipe():String
    {
        return this._254010867dust1Pipe;
    }

    public function set dust1Pipe(value:String):void
    {
    	var oldValue:Object = this._254010867dust1Pipe;
        if (oldValue !== value)
        {
            this._254010867dust1Pipe = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dust1Pipe", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property dust2Pipe (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dust2Pipe' moved to '_253087346dust2Pipe'
	 */

    [Bindable(event="propertyChange")]
    public function get dust2Pipe():String
    {
        return this._253087346dust2Pipe;
    }

    public function set dust2Pipe(value:String):void
    {
    	var oldValue:Object = this._253087346dust2Pipe;
        if (oldValue !== value)
        {
            this._253087346dust2Pipe = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dust2Pipe", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property morningElectric (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'morningElectric' moved to '_1778273537morningElectric'
	 */

    [Bindable(event="propertyChange")]
    public function get morningElectric():String
    {
        return this._1778273537morningElectric;
    }

    public function set morningElectric(value:String):void
    {
    	var oldValue:Object = this._1778273537morningElectric;
        if (oldValue !== value)
        {
            this._1778273537morningElectric = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "morningElectric", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property exerciseElectric (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'exerciseElectric' moved to '_1164786923exerciseElectric'
	 */

    [Bindable(event="propertyChange")]
    public function get exerciseElectric():String
    {
        return this._1164786923exerciseElectric;
    }

    public function set exerciseElectric(value:String):void
    {
    	var oldValue:Object = this._1164786923exerciseElectric;
        if (oldValue !== value)
        {
            this._1164786923exerciseElectric = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "exerciseElectric", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property dust1Electric (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dust1Electric' moved to '_1487862276dust1Electric'
	 */

    [Bindable(event="propertyChange")]
    public function get dust1Electric():String
    {
        return this._1487862276dust1Electric;
    }

    public function set dust1Electric(value:String):void
    {
    	var oldValue:Object = this._1487862276dust1Electric;
        if (oldValue !== value)
        {
            this._1487862276dust1Electric = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dust1Electric", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property dust2Electric (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dust2Electric' moved to '_999650557dust2Electric'
	 */

    [Bindable(event="propertyChange")]
    public function get dust2Electric():String
    {
        return this._999650557dust2Electric;
    }

    public function set dust2Electric(value:String):void
    {
    	var oldValue:Object = this._999650557dust2Electric;
        if (oldValue !== value)
        {
            this._999650557dust2Electric = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dust2Electric", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property patrol11 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'patrol11' moved to '_1244448108patrol11'
	 */

    [Bindable(event="propertyChange")]
    public function get patrol11():String
    {
        return this._1244448108patrol11;
    }

    public function set patrol11(value:String):void
    {
    	var oldValue:Object = this._1244448108patrol11;
        if (oldValue !== value)
        {
            this._1244448108patrol11 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "patrol11", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property patrol12 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'patrol12' moved to '_1244448109patrol12'
	 */

    [Bindable(event="propertyChange")]
    public function get patrol12():String
    {
        return this._1244448109patrol12;
    }

    public function set patrol12(value:String):void
    {
    	var oldValue:Object = this._1244448109patrol12;
        if (oldValue !== value)
        {
            this._1244448109patrol12 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "patrol12", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property patrol21 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'patrol21' moved to '_1244448139patrol21'
	 */

    [Bindable(event="propertyChange")]
    public function get patrol21():String
    {
        return this._1244448139patrol21;
    }

    public function set patrol21(value:String):void
    {
    	var oldValue:Object = this._1244448139patrol21;
        if (oldValue !== value)
        {
            this._1244448139patrol21 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "patrol21", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property patrol22 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'patrol22' moved to '_1244448140patrol22'
	 */

    [Bindable(event="propertyChange")]
    public function get patrol22():String
    {
        return this._1244448140patrol22;
    }

    public function set patrol22(value:String):void
    {
    	var oldValue:Object = this._1244448140patrol22;
        if (oldValue !== value)
        {
            this._1244448140patrol22 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "patrol22", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property trainerLabel (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'trainerLabel' moved to '_1924635455trainerLabel'
	 */

    [Bindable(event="propertyChange")]
    public function get trainerLabel():String
    {
        return this._1924635455trainerLabel;
    }

    public function set trainerLabel(value:String):void
    {
    	var oldValue:Object = this._1924635455trainerLabel;
        if (oldValue !== value)
        {
            this._1924635455trainerLabel = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "trainerLabel", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property workingLabel1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'workingLabel1' moved to '_534606258workingLabel1'
	 */

    [Bindable(event="propertyChange")]
    public function get workingLabel1():String
    {
        return this._534606258workingLabel1;
    }

    public function set workingLabel1(value:String):void
    {
    	var oldValue:Object = this._534606258workingLabel1;
        if (oldValue !== value)
        {
            this._534606258workingLabel1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workingLabel1", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property absenceLabel1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'absenceLabel1' moved to '_589075366absenceLabel1'
	 */

    [Bindable(event="propertyChange")]
    public function get absenceLabel1():String
    {
        return this._589075366absenceLabel1;
    }

    public function set absenceLabel1(value:String):void
    {
    	var oldValue:Object = this._589075366absenceLabel1;
        if (oldValue !== value)
        {
            this._589075366absenceLabel1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "absenceLabel1", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property absenceLabel2 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'absenceLabel2' moved to '_589075365absenceLabel2'
	 */

    [Bindable(event="propertyChange")]
    public function get absenceLabel2():String
    {
        return this._589075365absenceLabel2;
    }

    public function set absenceLabel2(value:String):void
    {
    	var oldValue:Object = this._589075365absenceLabel2;
        if (oldValue !== value)
        {
            this._589075365absenceLabel2 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "absenceLabel2", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property tripLabel1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'tripLabel1' moved to '_16035774tripLabel1'
	 */

    [Bindable(event="propertyChange")]
    public function get tripLabel1():String
    {
        return this._16035774tripLabel1;
    }

    public function set tripLabel1(value:String):void
    {
    	var oldValue:Object = this._16035774tripLabel1;
        if (oldValue !== value)
        {
            this._16035774tripLabel1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tripLabel1", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property scheduleHead (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'scheduleHead' moved to '_1161802007scheduleHead'
	 */

    [Bindable(event="propertyChange")]
    public function get scheduleHead():String
    {
        return this._1161802007scheduleHead;
    }

    public function set scheduleHead(value:String):void
    {
    	var oldValue:Object = this._1161802007scheduleHead;
        if (oldValue !== value)
        {
            this._1161802007scheduleHead = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "scheduleHead", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property scheduleLabel (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'scheduleLabel' moved to '_1659699869scheduleLabel'
	 */

    [Bindable(event="propertyChange")]
    public function get scheduleLabel():String
    {
        return this._1659699869scheduleLabel;
    }

    public function set scheduleLabel(value:String):void
    {
    	var oldValue:Object = this._1659699869scheduleLabel;
        if (oldValue !== value)
        {
            this._1659699869scheduleLabel = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "scheduleLabel", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property nextscheduleLabel (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'nextscheduleLabel' moved to '_2117068150nextscheduleLabel'
	 */

    [Bindable(event="propertyChange")]
    public function get nextscheduleLabel():String
    {
        return this._2117068150nextscheduleLabel;
    }

    public function set nextscheduleLabel(value:String):void
    {
    	var oldValue:Object = this._2117068150nextscheduleLabel;
        if (oldValue !== value)
        {
            this._2117068150nextscheduleLabel = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "nextscheduleLabel", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property messageLabel (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'messageLabel' moved to '_1304200403messageLabel'
	 */

    [Bindable(event="propertyChange")]
    public function get messageLabel():String
    {
        return this._1304200403messageLabel;
    }

    public function set messageLabel(value:String):void
    {
    	var oldValue:Object = this._1304200403messageLabel;
        if (oldValue !== value)
        {
            this._1304200403messageLabel = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "messageLabel", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property workingNum (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'workingNum' moved to '_272929131workingNum'
	 */

    [Bindable(event="propertyChange")]
    public function get workingNum():String
    {
        return this._272929131workingNum;
    }

    public function set workingNum(value:String):void
    {
    	var oldValue:Object = this._272929131workingNum;
        if (oldValue !== value)
        {
            this._272929131workingNum = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workingNum", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property thermometerOutDoor (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'thermometerOutDoor' moved to '_138324822thermometerOutDoor'
	 */

    [Bindable(event="propertyChange")]
    public function get thermometerOutDoor():String
    {
        return this._138324822thermometerOutDoor;
    }

    public function set thermometerOutDoor(value:String):void
    {
    	var oldValue:Object = this._138324822thermometerOutDoor;
        if (oldValue !== value)
        {
            this._138324822thermometerOutDoor = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "thermometerOutDoor", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property hygrometerOutDoor (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'hygrometerOutDoor' moved to '_577825286hygrometerOutDoor'
	 */

    [Bindable(event="propertyChange")]
    public function get hygrometerOutDoor():String
    {
        return this._577825286hygrometerOutDoor;
    }

    public function set hygrometerOutDoor(value:String):void
    {
    	var oldValue:Object = this._577825286hygrometerOutDoor;
        if (oldValue !== value)
        {
            this._577825286hygrometerOutDoor = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hygrometerOutDoor", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property WBGTOutDoor (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'WBGTOutDoor' moved to '_356781052WBGTOutDoor'
	 */

    [Bindable(event="propertyChange")]
    public function get WBGTOutDoor():String
    {
        return this._356781052WBGTOutDoor;
    }

    public function set WBGTOutDoor(value:String):void
    {
    	var oldValue:Object = this._356781052WBGTOutDoor;
        if (oldValue !== value)
        {
            this._356781052WBGTOutDoor = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "WBGTOutDoor", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property anemometer (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'anemometer' moved to '_1967974833anemometer'
	 */

    [Bindable(event="propertyChange")]
    public function get anemometer():String
    {
        return this._1967974833anemometer;
    }

    public function set anemometer(value:String):void
    {
    	var oldValue:Object = this._1967974833anemometer;
        if (oldValue !== value)
        {
            this._1967974833anemometer = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "anemometer", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property WBGTAlertOutDoor (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'WBGTAlertOutDoor' moved to '_434973752WBGTAlertOutDoor'
	 */

    [Bindable(event="propertyChange")]
    public function get WBGTAlertOutDoor():String
    {
        return this._434973752WBGTAlertOutDoor;
    }

    public function set WBGTAlertOutDoor(value:String):void
    {
    	var oldValue:Object = this._434973752WBGTAlertOutDoor;
        if (oldValue !== value)
        {
            this._434973752WBGTAlertOutDoor = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "WBGTAlertOutDoor", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property WBGTAlertBg (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'WBGTAlertBg' moved to '_167072087WBGTAlertBg'
	 */

    [Bindable(event="propertyChange")]
    public function get WBGTAlertBg():Number
    {
        return this._167072087WBGTAlertBg;
    }

    public function set WBGTAlertBg(value:Number):void
    {
    	var oldValue:Object = this._167072087WBGTAlertBg;
        if (oldValue !== value)
        {
            this._167072087WBGTAlertBg = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "WBGTAlertBg", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property anemometerAlert (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'anemometerAlert' moved to '_1113594957anemometerAlert'
	 */

    [Bindable(event="propertyChange")]
    public function get anemometerAlert():String
    {
        return this._1113594957anemometerAlert;
    }

    public function set anemometerAlert(value:String):void
    {
    	var oldValue:Object = this._1113594957anemometerAlert;
        if (oldValue !== value)
        {
            this._1113594957anemometerAlert = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "anemometerAlert", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property anemometerAlertBg (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'anemometerAlertBg' moved to '_717899122anemometerAlertBg'
	 */

    [Bindable(event="propertyChange")]
    public function get anemometerAlertBg():Number
    {
        return this._717899122anemometerAlertBg;
    }

    public function set anemometerAlertBg(value:Number):void
    {
    	var oldValue:Object = this._717899122anemometerAlertBg;
        if (oldValue !== value)
        {
            this._717899122anemometerAlertBg = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "anemometerAlertBg", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property MeetingRoomLamp1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'MeetingRoomLamp1' moved to '_515700067MeetingRoomLamp1'
	 */

    [Bindable(event="propertyChange")]
    public function get MeetingRoomLamp1():String
    {
        return this._515700067MeetingRoomLamp1;
    }

    public function set MeetingRoomLamp1(value:String):void
    {
    	var oldValue:Object = this._515700067MeetingRoomLamp1;
        if (oldValue !== value)
        {
            this._515700067MeetingRoomLamp1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "MeetingRoomLamp1", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property MeetingRoomLamp2 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'MeetingRoomLamp2' moved to '_515700068MeetingRoomLamp2'
	 */

    [Bindable(event="propertyChange")]
    public function get MeetingRoomLamp2():String
    {
        return this._515700068MeetingRoomLamp2;
    }

    public function set MeetingRoomLamp2(value:String):void
    {
    	var oldValue:Object = this._515700068MeetingRoomLamp2;
        if (oldValue !== value)
        {
            this._515700068MeetingRoomLamp2 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "MeetingRoomLamp2", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property MeetingRoomLamp3 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'MeetingRoomLamp3' moved to '_515700069MeetingRoomLamp3'
	 */

    [Bindable(event="propertyChange")]
    public function get MeetingRoomLamp3():String
    {
        return this._515700069MeetingRoomLamp3;
    }

    public function set MeetingRoomLamp3(value:String):void
    {
    	var oldValue:Object = this._515700069MeetingRoomLamp3;
        if (oldValue !== value)
        {
            this._515700069MeetingRoomLamp3 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "MeetingRoomLamp3", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property MeetingRoomLamp4 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'MeetingRoomLamp4' moved to '_515700070MeetingRoomLamp4'
	 */

    [Bindable(event="propertyChange")]
    public function get MeetingRoomLamp4():String
    {
        return this._515700070MeetingRoomLamp4;
    }

    public function set MeetingRoomLamp4(value:String):void
    {
    	var oldValue:Object = this._515700070MeetingRoomLamp4;
        if (oldValue !== value)
        {
            this._515700070MeetingRoomLamp4 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "MeetingRoomLamp4", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property MeetingRoomLamp5 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'MeetingRoomLamp5' moved to '_515700071MeetingRoomLamp5'
	 */

    [Bindable(event="propertyChange")]
    public function get MeetingRoomLamp5():String
    {
        return this._515700071MeetingRoomLamp5;
    }

    public function set MeetingRoomLamp5(value:String):void
    {
    	var oldValue:Object = this._515700071MeetingRoomLamp5;
        if (oldValue !== value)
        {
            this._515700071MeetingRoomLamp5 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "MeetingRoomLamp5", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property emptyColor (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'emptyColor' moved to '_1085144554emptyColor'
	 */

    [Bindable(event="propertyChange")]
    public function get emptyColor():Number
    {
        return this._1085144554emptyColor;
    }

    public function set emptyColor(value:Number):void
    {
    	var oldValue:Object = this._1085144554emptyColor;
        if (oldValue !== value)
        {
            this._1085144554emptyColor = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "emptyColor", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property useColor (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'useColor' moved to '_309078500useColor'
	 */

    [Bindable(event="propertyChange")]
    public function get useColor():Number
    {
        return this._309078500useColor;
    }

    public function set useColor(value:Number):void
    {
    	var oldValue:Object = this._309078500useColor;
        if (oldValue !== value)
        {
            this._309078500useColor = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "useColor", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property wbgtInfo (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'wbgtInfo' moved to '_1075261894wbgtInfo'
	 */

    [Bindable(event="propertyChange")]
    public function get wbgtInfo():WarningInfo
    {
        return this._1075261894wbgtInfo;
    }

    public function set wbgtInfo(value:WarningInfo):void
    {
    	var oldValue:Object = this._1075261894wbgtInfo;
        if (oldValue !== value)
        {
            this._1075261894wbgtInfo = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "wbgtInfo", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property anemometerInfo (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'anemometerInfo' moved to '_867446685anemometerInfo'
	 */

    [Bindable(event="propertyChange")]
    public function get anemometerInfo():WarningInfo
    {
        return this._867446685anemometerInfo;
    }

    public function set anemometerInfo(value:WarningInfo):void
    {
    	var oldValue:Object = this._867446685anemometerInfo;
        if (oldValue !== value)
        {
            this._867446685anemometerInfo = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "anemometerInfo", oldValue, value));
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
