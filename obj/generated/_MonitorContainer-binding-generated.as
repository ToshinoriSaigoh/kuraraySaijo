


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import kuraraysaijo.model.plugin.report.KuraraySaijoMonitorContainer;
import kuraraysaijo.model.plugin.report.monitorcontainer.WBGTAlert;
import spark.core.SpriteVisualElement;
import kuraraysaijo.model.plugin.report.monitorcontainer.AnemometerAlert;
import spark.components.Group;
import kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp;
import spark.components.VGroup;
import spark.components.Button;
import spark.components.Label;
import spark.components.TextArea;
import kuraraysaijo.model.plugin.report.monitorcontainer.OtherIcon;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property MeetingRoomLamp1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'MeetingRoomLamp1' moved to '_515700067MeetingRoomLamp1'
	 */

    [Bindable(event="propertyChange")]
    public function get MeetingRoomLamp1():kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp
    {
        return this._515700067MeetingRoomLamp1;
    }

    public function set MeetingRoomLamp1(value:kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp):void
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
    public function get MeetingRoomLamp2():kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp
    {
        return this._515700068MeetingRoomLamp2;
    }

    public function set MeetingRoomLamp2(value:kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp):void
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
    public function get MeetingRoomLamp3():kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp
    {
        return this._515700069MeetingRoomLamp3;
    }

    public function set MeetingRoomLamp3(value:kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp):void
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
    public function get MeetingRoomLamp4():kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp
    {
        return this._515700070MeetingRoomLamp4;
    }

    public function set MeetingRoomLamp4(value:kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp):void
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
    public function get MeetingRoomLamp5():kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp
    {
        return this._515700071MeetingRoomLamp5;
    }

    public function set MeetingRoomLamp5(value:kuraraysaijo.model.plugin.report.monitorcontainer.MeetingRoomLamp):void
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
	 * generated bindable wrapper for property WBGTAlertOutDoor (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'WBGTAlertOutDoor' moved to '_434973752WBGTAlertOutDoor'
	 */

    [Bindable(event="propertyChange")]
    public function get WBGTAlertOutDoor():kuraraysaijo.model.plugin.report.monitorcontainer.WBGTAlert
    {
        return this._434973752WBGTAlertOutDoor;
    }

    public function set WBGTAlertOutDoor(value:kuraraysaijo.model.plugin.report.monitorcontainer.WBGTAlert):void
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
	 * generated bindable wrapper for property WBGTOutDoor (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'WBGTOutDoor' moved to '_356781052WBGTOutDoor'
	 */

    [Bindable(event="propertyChange")]
    public function get WBGTOutDoor():spark.components.Label
    {
        return this._356781052WBGTOutDoor;
    }

    public function set WBGTOutDoor(value:spark.components.Label):void
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
	 * generated bindable wrapper for property absenceLabel1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'absenceLabel1' moved to '_589075366absenceLabel1'
	 */

    [Bindable(event="propertyChange")]
    public function get absenceLabel1():spark.components.Label
    {
        return this._589075366absenceLabel1;
    }

    public function set absenceLabel1(value:spark.components.Label):void
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
    public function get absenceLabel2():spark.components.Label
    {
        return this._589075365absenceLabel2;
    }

    public function set absenceLabel2(value:spark.components.Label):void
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
	 * generated bindable wrapper for property absenceOtherIcon (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'absenceOtherIcon' moved to '_1245185556absenceOtherIcon'
	 */

    [Bindable(event="propertyChange")]
    public function get absenceOtherIcon():kuraraysaijo.model.plugin.report.monitorcontainer.OtherIcon
    {
        return this._1245185556absenceOtherIcon;
    }

    public function set absenceOtherIcon(value:kuraraysaijo.model.plugin.report.monitorcontainer.OtherIcon):void
    {
    	var oldValue:Object = this._1245185556absenceOtherIcon;
        if (oldValue !== value)
        {
            this._1245185556absenceOtherIcon = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "absenceOtherIcon", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property anemometer (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'anemometer' moved to '_1967974833anemometer'
	 */

    [Bindable(event="propertyChange")]
    public function get anemometer():spark.components.Label
    {
        return this._1967974833anemometer;
    }

    public function set anemometer(value:spark.components.Label):void
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
	 * generated bindable wrapper for property anemometerAlert (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'anemometerAlert' moved to '_1113594957anemometerAlert'
	 */

    [Bindable(event="propertyChange")]
    public function get anemometerAlert():kuraraysaijo.model.plugin.report.monitorcontainer.AnemometerAlert
    {
        return this._1113594957anemometerAlert;
    }

    public function set anemometerAlert(value:kuraraysaijo.model.plugin.report.monitorcontainer.AnemometerAlert):void
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
	 * generated bindable wrapper for property background (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'background' moved to '_1332194002background'
	 */

    [Bindable(event="propertyChange")]
    public function get background():spark.core.SpriteVisualElement
    {
        return this._1332194002background;
    }

    public function set background(value:spark.core.SpriteVisualElement):void
    {
    	var oldValue:Object = this._1332194002background;
        if (oldValue !== value)
        {
            this._1332194002background = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "background", oldValue, value));
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
	 * generated bindable wrapper for property clock (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'clock' moved to '_94755854clock'
	 */

    [Bindable(event="propertyChange")]
    public function get clock():spark.components.VGroup
    {
        return this._94755854clock;
    }

    public function set clock(value:spark.components.VGroup):void
    {
    	var oldValue:Object = this._94755854clock;
        if (oldValue !== value)
        {
            this._94755854clock = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "clock", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property ctrlr (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlr' moved to '_94997351ctrlr'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlr():kuraraysaijo.model.plugin.report.KuraraySaijoMonitorContainer
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:kuraraysaijo.model.plugin.report.KuraraySaijoMonitorContainer):void
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
	 * generated bindable wrapper for property dust1Designing (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dust1Designing' moved to '_981573531dust1Designing'
	 */

    [Bindable(event="propertyChange")]
    public function get dust1Designing():spark.components.Label
    {
        return this._981573531dust1Designing;
    }

    public function set dust1Designing(value:spark.components.Label):void
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
	 * generated bindable wrapper for property dust1Electric (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dust1Electric' moved to '_1487862276dust1Electric'
	 */

    [Bindable(event="propertyChange")]
    public function get dust1Electric():spark.components.Label
    {
        return this._1487862276dust1Electric;
    }

    public function set dust1Electric(value:spark.components.Label):void
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
	 * generated bindable wrapper for property dust1Pipe (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dust1Pipe' moved to '_254010867dust1Pipe'
	 */

    [Bindable(event="propertyChange")]
    public function get dust1Pipe():spark.components.Label
    {
        return this._254010867dust1Pipe;
    }

    public function set dust1Pipe(value:spark.components.Label):void
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
	 * generated bindable wrapper for property dust2Designing (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dust2Designing' moved to '_1178087036dust2Designing'
	 */

    [Bindable(event="propertyChange")]
    public function get dust2Designing():spark.components.Label
    {
        return this._1178087036dust2Designing;
    }

    public function set dust2Designing(value:spark.components.Label):void
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
	 * generated bindable wrapper for property dust2Electric (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dust2Electric' moved to '_999650557dust2Electric'
	 */

    [Bindable(event="propertyChange")]
    public function get dust2Electric():spark.components.Label
    {
        return this._999650557dust2Electric;
    }

    public function set dust2Electric(value:spark.components.Label):void
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
	 * generated bindable wrapper for property dust2Pipe (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dust2Pipe' moved to '_253087346dust2Pipe'
	 */

    [Bindable(event="propertyChange")]
    public function get dust2Pipe():spark.components.Label
    {
        return this._253087346dust2Pipe;
    }

    public function set dust2Pipe(value:spark.components.Label):void
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
	 * generated bindable wrapper for property exerciseDesigning (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'exerciseDesigning' moved to '_443827820exerciseDesigning'
	 */

    [Bindable(event="propertyChange")]
    public function get exerciseDesigning():spark.components.Label
    {
        return this._443827820exerciseDesigning;
    }

    public function set exerciseDesigning(value:spark.components.Label):void
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
	 * generated bindable wrapper for property exerciseElectric (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'exerciseElectric' moved to '_1164786923exerciseElectric'
	 */

    [Bindable(event="propertyChange")]
    public function get exerciseElectric():spark.components.Label
    {
        return this._1164786923exerciseElectric;
    }

    public function set exerciseElectric(value:spark.components.Label):void
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
	 * generated bindable wrapper for property exercisePipe (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'exercisePipe' moved to '_466465882exercisePipe'
	 */

    [Bindable(event="propertyChange")]
    public function get exercisePipe():spark.components.Label
    {
        return this._466465882exercisePipe;
    }

    public function set exercisePipe(value:spark.components.Label):void
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
	 * generated bindable wrapper for property hygrometerOutDoor (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'hygrometerOutDoor' moved to '_577825286hygrometerOutDoor'
	 */

    [Bindable(event="propertyChange")]
    public function get hygrometerOutDoor():spark.components.Label
    {
        return this._577825286hygrometerOutDoor;
    }

    public function set hygrometerOutDoor(value:spark.components.Label):void
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
	 * generated bindable wrapper for property insertSchedule (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'insertSchedule' moved to '_625209456insertSchedule'
	 */

    [Bindable(event="propertyChange")]
    public function get insertSchedule():spark.components.Button
    {
        return this._625209456insertSchedule;
    }

    public function set insertSchedule(value:spark.components.Button):void
    {
    	var oldValue:Object = this._625209456insertSchedule;
        if (oldValue !== value)
        {
            this._625209456insertSchedule = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "insertSchedule", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property message (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'message' moved to '_954925063message'
	 */

    [Bindable(event="propertyChange")]
    public function get message():spark.components.TextArea
    {
        return this._954925063message;
    }

    public function set message(value:spark.components.TextArea):void
    {
    	var oldValue:Object = this._954925063message;
        if (oldValue !== value)
        {
            this._954925063message = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "message", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property messageLabel (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'messageLabel' moved to '_1304200403messageLabel'
	 */

    [Bindable(event="propertyChange")]
    public function get messageLabel():spark.components.Label
    {
        return this._1304200403messageLabel;
    }

    public function set messageLabel(value:spark.components.Label):void
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
	 * generated bindable wrapper for property monitorContainer (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'monitorContainer' moved to '_362353735monitorContainer'
	 */

    [Bindable(event="propertyChange")]
    public function get monitorContainer():spark.components.Group
    {
        return this._362353735monitorContainer;
    }

    public function set monitorContainer(value:spark.components.Group):void
    {
    	var oldValue:Object = this._362353735monitorContainer;
        if (oldValue !== value)
        {
            this._362353735monitorContainer = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "monitorContainer", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property morningDesigning (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'morningDesigning' moved to '_1484388864morningDesigning'
	 */

    [Bindable(event="propertyChange")]
    public function get morningDesigning():spark.components.Label
    {
        return this._1484388864morningDesigning;
    }

    public function set morningDesigning(value:spark.components.Label):void
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
	 * generated bindable wrapper for property morningElectric (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'morningElectric' moved to '_1778273537morningElectric'
	 */

    [Bindable(event="propertyChange")]
    public function get morningElectric():spark.components.Label
    {
        return this._1778273537morningElectric;
    }

    public function set morningElectric(value:spark.components.Label):void
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
	 * generated bindable wrapper for property morningPipe (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'morningPipe' moved to '_1852287890morningPipe'
	 */

    [Bindable(event="propertyChange")]
    public function get morningPipe():spark.components.Label
    {
        return this._1852287890morningPipe;
    }

    public function set morningPipe(value:spark.components.Label):void
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
	 * generated bindable wrapper for property nextschedule (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'nextschedule' moved to '_1805288822nextschedule'
	 */

    [Bindable(event="propertyChange")]
    public function get nextschedule():spark.components.TextArea
    {
        return this._1805288822nextschedule;
    }

    public function set nextschedule(value:spark.components.TextArea):void
    {
    	var oldValue:Object = this._1805288822nextschedule;
        if (oldValue !== value)
        {
            this._1805288822nextschedule = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "nextschedule", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property nextscheduleLabel (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'nextscheduleLabel' moved to '_2117068150nextscheduleLabel'
	 */

    [Bindable(event="propertyChange")]
    public function get nextscheduleLabel():spark.components.Label
    {
        return this._2117068150nextscheduleLabel;
    }

    public function set nextscheduleLabel(value:spark.components.Label):void
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
	 * generated bindable wrapper for property noAccidentAll (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'noAccidentAll' moved to '_1730832529noAccidentAll'
	 */

    [Bindable(event="propertyChange")]
    public function get noAccidentAll():spark.components.Label
    {
        return this._1730832529noAccidentAll;
    }

    public function set noAccidentAll(value:spark.components.Label):void
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
    public function get noAccidentDept():spark.components.Label
    {
        return this._2116283733noAccidentDept;
    }

    public function set noAccidentDept(value:spark.components.Label):void
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
	 * generated bindable wrapper for property patrol11 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'patrol11' moved to '_1244448108patrol11'
	 */

    [Bindable(event="propertyChange")]
    public function get patrol11():spark.components.Label
    {
        return this._1244448108patrol11;
    }

    public function set patrol11(value:spark.components.Label):void
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
    public function get patrol12():spark.components.Label
    {
        return this._1244448109patrol12;
    }

    public function set patrol12(value:spark.components.Label):void
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
    public function get patrol21():spark.components.Label
    {
        return this._1244448139patrol21;
    }

    public function set patrol21(value:spark.components.Label):void
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
    public function get patrol22():spark.components.Label
    {
        return this._1244448140patrol22;
    }

    public function set patrol22(value:spark.components.Label):void
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
	 * generated bindable wrapper for property schedule (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'schedule' moved to '_697920873schedule'
	 */

    [Bindable(event="propertyChange")]
    public function get schedule():spark.components.TextArea
    {
        return this._697920873schedule;
    }

    public function set schedule(value:spark.components.TextArea):void
    {
    	var oldValue:Object = this._697920873schedule;
        if (oldValue !== value)
        {
            this._697920873schedule = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "schedule", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property scheduleHead (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'scheduleHead' moved to '_1161802007scheduleHead'
	 */

    [Bindable(event="propertyChange")]
    public function get scheduleHead():spark.components.Label
    {
        return this._1161802007scheduleHead;
    }

    public function set scheduleHead(value:spark.components.Label):void
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
    public function get scheduleLabel():spark.components.Label
    {
        return this._1659699869scheduleLabel;
    }

    public function set scheduleLabel(value:spark.components.Label):void
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
	 * generated bindable wrapper for property thermometerOutDoor (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'thermometerOutDoor' moved to '_138324822thermometerOutDoor'
	 */

    [Bindable(event="propertyChange")]
    public function get thermometerOutDoor():spark.components.Label
    {
        return this._138324822thermometerOutDoor;
    }

    public function set thermometerOutDoor(value:spark.components.Label):void
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
	 * generated bindable wrapper for property trainerLabel (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'trainerLabel' moved to '_1924635455trainerLabel'
	 */

    [Bindable(event="propertyChange")]
    public function get trainerLabel():spark.components.Label
    {
        return this._1924635455trainerLabel;
    }

    public function set trainerLabel(value:spark.components.Label):void
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
	 * generated bindable wrapper for property tripLabel1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'tripLabel1' moved to '_16035774tripLabel1'
	 */

    [Bindable(event="propertyChange")]
    public function get tripLabel1():spark.components.Label
    {
        return this._16035774tripLabel1;
    }

    public function set tripLabel1(value:spark.components.Label):void
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
	 * generated bindable wrapper for property tripOtherIcon (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'tripOtherIcon' moved to '_1977265412tripOtherIcon'
	 */

    [Bindable(event="propertyChange")]
    public function get tripOtherIcon():kuraraysaijo.model.plugin.report.monitorcontainer.OtherIcon
    {
        return this._1977265412tripOtherIcon;
    }

    public function set tripOtherIcon(value:kuraraysaijo.model.plugin.report.monitorcontainer.OtherIcon):void
    {
    	var oldValue:Object = this._1977265412tripOtherIcon;
        if (oldValue !== value)
        {
            this._1977265412tripOtherIcon = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tripOtherIcon", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property workingLabel1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'workingLabel1' moved to '_534606258workingLabel1'
	 */

    [Bindable(event="propertyChange")]
    public function get workingLabel1():spark.components.Label
    {
        return this._534606258workingLabel1;
    }

    public function set workingLabel1(value:spark.components.Label):void
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
	 * generated bindable wrapper for property workingNum (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'workingNum' moved to '_272929131workingNum'
	 */

    [Bindable(event="propertyChange")]
    public function get workingNum():spark.components.Label
    {
        return this._272929131workingNum;
    }

    public function set workingNum(value:spark.components.Label):void
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
	 * generated bindable wrapper for property workingOtherIcon (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'workingOtherIcon' moved to '_2053627016workingOtherIcon'
	 */

    [Bindable(event="propertyChange")]
    public function get workingOtherIcon():kuraraysaijo.model.plugin.report.monitorcontainer.OtherIcon
    {
        return this._2053627016workingOtherIcon;
    }

    public function set workingOtherIcon(value:kuraraysaijo.model.plugin.report.monitorcontainer.OtherIcon):void
    {
    	var oldValue:Object = this._2053627016workingOtherIcon;
        if (oldValue !== value)
        {
            this._2053627016workingOtherIcon = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workingOtherIcon", oldValue, value));
        }
    }



}
