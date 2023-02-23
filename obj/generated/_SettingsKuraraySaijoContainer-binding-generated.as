


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.core.SpriteVisualElement;
import spark.components.Button;
import spark.components.Label;
import spark.components.Scroller;
import kuraraysaijo.controller.documentroot.reportscreen.sidebar.settingsbox.SettingsKuraraySaijoContainer;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property attendanceHead (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'attendanceHead' moved to '_1957918615attendanceHead'
	 */

    [Bindable(event="propertyChange")]
    public function get attendanceHead():spark.components.Label
    {
        return this._1957918615attendanceHead;
    }

    public function set attendanceHead(value:spark.components.Label):void
    {
    	var oldValue:Object = this._1957918615attendanceHead;
        if (oldValue !== value)
        {
            this._1957918615attendanceHead = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "attendanceHead", oldValue, value));
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
    public function get ctrlr():kuraraysaijo.controller.documentroot.reportscreen.sidebar.settingsbox.SettingsKuraraySaijoContainer
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:kuraraysaijo.controller.documentroot.reportscreen.sidebar.settingsbox.SettingsKuraraySaijoContainer):void
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
	 * generated bindable wrapper for property dutyHead (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dutyHead' moved to '_1913904682dutyHead'
	 */

    [Bindable(event="propertyChange")]
    public function get dutyHead():spark.components.Label
    {
        return this._1913904682dutyHead;
    }

    public function set dutyHead(value:spark.components.Label):void
    {
    	var oldValue:Object = this._1913904682dutyHead;
        if (oldValue !== value)
        {
            this._1913904682dutyHead = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dutyHead", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property importAttendanceBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'importAttendanceBtn' moved to '_2081644302importAttendanceBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get importAttendanceBtn():spark.components.Button
    {
        return this._2081644302importAttendanceBtn;
    }

    public function set importAttendanceBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._2081644302importAttendanceBtn;
        if (oldValue !== value)
        {
            this._2081644302importAttendanceBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "importAttendanceBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property importDustBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'importDustBtn' moved to '_505554661importDustBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get importDustBtn():spark.components.Button
    {
        return this._505554661importDustBtn;
    }

    public function set importDustBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._505554661importDustBtn;
        if (oldValue !== value)
        {
            this._505554661importDustBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "importDustBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property importExerciseBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'importExerciseBtn' moved to '_1495760769importExerciseBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get importExerciseBtn():spark.components.Button
    {
        return this._1495760769importExerciseBtn;
    }

    public function set importExerciseBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1495760769importExerciseBtn;
        if (oldValue !== value)
        {
            this._1495760769importExerciseBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "importExerciseBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property importHolidayBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'importHolidayBtn' moved to '_466199657importHolidayBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get importHolidayBtn():spark.components.Button
    {
        return this._466199657importHolidayBtn;
    }

    public function set importHolidayBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._466199657importHolidayBtn;
        if (oldValue !== value)
        {
            this._466199657importHolidayBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "importHolidayBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property importMorningBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'importMorningBtn' moved to '_1647725949importMorningBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get importMorningBtn():spark.components.Button
    {
        return this._1647725949importMorningBtn;
    }

    public function set importMorningBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1647725949importMorningBtn;
        if (oldValue !== value)
        {
            this._1647725949importMorningBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "importMorningBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property importPatrolBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'importPatrolBtn' moved to '_667166283importPatrolBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get importPatrolBtn():spark.components.Button
    {
        return this._667166283importPatrolBtn;
    }

    public function set importPatrolBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._667166283importPatrolBtn;
        if (oldValue !== value)
        {
            this._667166283importPatrolBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "importPatrolBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property importScheduleBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'importScheduleBtn' moved to '_2135964832importScheduleBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get importScheduleBtn():spark.components.Button
    {
        return this._2135964832importScheduleBtn;
    }

    public function set importScheduleBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._2135964832importScheduleBtn;
        if (oldValue !== value)
        {
            this._2135964832importScheduleBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "importScheduleBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property importTrainerBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'importTrainerBtn' moved to '_425658644importTrainerBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get importTrainerBtn():spark.components.Button
    {
        return this._425658644importTrainerBtn;
    }

    public function set importTrainerBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._425658644importTrainerBtn;
        if (oldValue !== value)
        {
            this._425658644importTrainerBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "importTrainerBtn", oldValue, value));
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
	 * generated bindable wrapper for property scroller (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'scroller' moved to '_402164678scroller'
	 */

    [Bindable(event="propertyChange")]
    public function get scroller():spark.components.Scroller
    {
        return this._402164678scroller;
    }

    public function set scroller(value:spark.components.Scroller):void
    {
    	var oldValue:Object = this._402164678scroller;
        if (oldValue !== value)
        {
            this._402164678scroller = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "scroller", oldValue, value));
        }
    }



}
