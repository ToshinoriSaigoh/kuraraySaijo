


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.components.DropDownList;
import spark.core.SpriteVisualElement;
import controller.documentroot.reportscreen.palletcontainer.TimelinePallet;
import spark.components.HSlider;
import spark.components.Group;
import spark.components.Button;
import spark.components.Label;
import spark.components.HGroup;

class BindableProperty
{
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
	 * generated bindable wrapper for property closeBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'closeBtn' moved to '_1092797764closeBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get closeBtn():spark.components.Button
    {
        return this._1092797764closeBtn;
    }

    public function set closeBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1092797764closeBtn;
        if (oldValue !== value)
        {
            this._1092797764closeBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "closeBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property contents (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'contents' moved to '_567321830contents'
	 */

    [Bindable(event="propertyChange")]
    public function get contents():spark.components.HGroup
    {
        return this._567321830contents;
    }

    public function set contents(value:spark.components.HGroup):void
    {
    	var oldValue:Object = this._567321830contents;
        if (oldValue !== value)
        {
            this._567321830contents = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "contents", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property contentsCenter (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'contentsCenter' moved to '_310847473contentsCenter'
	 */

    [Bindable(event="propertyChange")]
    public function get contentsCenter():spark.components.Group
    {
        return this._310847473contentsCenter;
    }

    public function set contentsCenter(value:spark.components.Group):void
    {
    	var oldValue:Object = this._310847473contentsCenter;
        if (oldValue !== value)
        {
            this._310847473contentsCenter = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "contentsCenter", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property ctrlBox (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlBox' moved to '_1098098528ctrlBox'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlBox():spark.components.HGroup
    {
        return this._1098098528ctrlBox;
    }

    public function set ctrlBox(value:spark.components.HGroup):void
    {
    	var oldValue:Object = this._1098098528ctrlBox;
        if (oldValue !== value)
        {
            this._1098098528ctrlBox = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ctrlBox", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property ctrlr (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlr' moved to '_94997351ctrlr'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlr():controller.documentroot.reportscreen.palletcontainer.TimelinePallet
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:controller.documentroot.reportscreen.palletcontainer.TimelinePallet):void
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
	 * generated bindable wrapper for property dateTimeBox (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dateTimeBox' moved to '_118887376dateTimeBox'
	 */

    [Bindable(event="propertyChange")]
    public function get dateTimeBox():spark.components.Group
    {
        return this._118887376dateTimeBox;
    }

    public function set dateTimeBox(value:spark.components.Group):void
    {
    	var oldValue:Object = this._118887376dateTimeBox;
        if (oldValue !== value)
        {
            this._118887376dateTimeBox = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dateTimeBox", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property nextBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'nextBtn' moved to '_1847046761nextBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get nextBtn():spark.components.Button
    {
        return this._1847046761nextBtn;
    }

    public function set nextBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1847046761nextBtn;
        if (oldValue !== value)
        {
            this._1847046761nextBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "nextBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property nowDate (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'nowDate' moved to '_2131014564nowDate'
	 */

    [Bindable(event="propertyChange")]
    public function get nowDate():spark.components.Label
    {
        return this._2131014564nowDate;
    }

    public function set nowDate(value:spark.components.Label):void
    {
    	var oldValue:Object = this._2131014564nowDate;
        if (oldValue !== value)
        {
            this._2131014564nowDate = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "nowDate", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property nowTime (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'nowTime' moved to '_2131498691nowTime'
	 */

    [Bindable(event="propertyChange")]
    public function get nowTime():spark.components.Label
    {
        return this._2131498691nowTime;
    }

    public function set nowTime(value:spark.components.Label):void
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
	 * generated bindable wrapper for property pauseBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'pauseBtn' moved to '_1273664646pauseBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get pauseBtn():spark.components.Button
    {
        return this._1273664646pauseBtn;
    }

    public function set pauseBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1273664646pauseBtn;
        if (oldValue !== value)
        {
            this._1273664646pauseBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "pauseBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property playBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'playBtn' moved to '_493601144playBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get playBtn():spark.components.Button
    {
        return this._493601144playBtn;
    }

    public function set playBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._493601144playBtn;
        if (oldValue !== value)
        {
            this._493601144playBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "playBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property prevBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'prevBtn' moved to '_318221527prevBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get prevBtn():spark.components.Button
    {
        return this._318221527prevBtn;
    }

    public function set prevBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._318221527prevBtn;
        if (oldValue !== value)
        {
            this._318221527prevBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "prevBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property selectTimeBox (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'selectTimeBox' moved to '_590499038selectTimeBox'
	 */

    [Bindable(event="propertyChange")]
    public function get selectTimeBox():spark.components.DropDownList
    {
        return this._590499038selectTimeBox;
    }

    public function set selectTimeBox(value:spark.components.DropDownList):void
    {
    	var oldValue:Object = this._590499038selectTimeBox;
        if (oldValue !== value)
        {
            this._590499038selectTimeBox = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "selectTimeBox", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property timelineSlider (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'timelineSlider' moved to '_629425282timelineSlider'
	 */

    [Bindable(event="propertyChange")]
    public function get timelineSlider():spark.components.HSlider
    {
        return this._629425282timelineSlider;
    }

    public function set timelineSlider(value:spark.components.HSlider):void
    {
    	var oldValue:Object = this._629425282timelineSlider;
        if (oldValue !== value)
        {
            this._629425282timelineSlider = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "timelineSlider", oldValue, value));
        }
    }



}
