


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import mx.containers.ViewStack;
import spark.core.SpriteVisualElement;
import spark.components.Group;
import spark.components.NavigatorContent;
import kuraraysaijo.controller.documentroot.reportscreen.SideBar;
import spark.components.Button;
import spark.components.VGroup;
import view.documentroot.reportscreen.sidebar.FileListBox;
import kuraraysaijo.view.documentroot.reportscreen.sidebar.SettingsBox;

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
	 * generated bindable wrapper for property calendarBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'calendarBtn' moved to '_404249150calendarBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get calendarBtn():spark.components.Button
    {
        return this._404249150calendarBtn;
    }

    public function set calendarBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._404249150calendarBtn;
        if (oldValue !== value)
        {
            this._404249150calendarBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "calendarBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property changeModeBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'changeModeBtn' moved to '_247874537changeModeBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get changeModeBtn():spark.components.Button
    {
        return this._247874537changeModeBtn;
    }

    public function set changeModeBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._247874537changeModeBtn;
        if (oldValue !== value)
        {
            this._247874537changeModeBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "changeModeBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property closeAppBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'closeAppBtn' moved to '_346112877closeAppBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get closeAppBtn():spark.components.Button
    {
        return this._346112877closeAppBtn;
    }

    public function set closeAppBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._346112877closeAppBtn;
        if (oldValue !== value)
        {
            this._346112877closeAppBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "closeAppBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property ctrlr (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlr' moved to '_94997351ctrlr'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlr():kuraraysaijo.controller.documentroot.reportscreen.SideBar
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:kuraraysaijo.controller.documentroot.reportscreen.SideBar):void
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
	 * generated bindable wrapper for property fileTool (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'fileTool' moved to '_735529676fileTool'
	 */

    [Bindable(event="propertyChange")]
    public function get fileTool():view.documentroot.reportscreen.sidebar.FileListBox
    {
        return this._735529676fileTool;
    }

    public function set fileTool(value:view.documentroot.reportscreen.sidebar.FileListBox):void
    {
    	var oldValue:Object = this._735529676fileTool;
        if (oldValue !== value)
        {
            this._735529676fileTool = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "fileTool", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property mainToolBox (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'mainToolBox' moved to '_2025163494mainToolBox'
	 */

    [Bindable(event="propertyChange")]
    public function get mainToolBox():spark.components.Group
    {
        return this._2025163494mainToolBox;
    }

    public function set mainToolBox(value:spark.components.Group):void
    {
    	var oldValue:Object = this._2025163494mainToolBox;
        if (oldValue !== value)
        {
            this._2025163494mainToolBox = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "mainToolBox", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property mainToolGroup (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'mainToolGroup' moved to '_557230578mainToolGroup'
	 */

    [Bindable(event="propertyChange")]
    public function get mainToolGroup():spark.components.VGroup
    {
        return this._557230578mainToolGroup;
    }

    public function set mainToolGroup(value:spark.components.VGroup):void
    {
    	var oldValue:Object = this._557230578mainToolGroup;
        if (oldValue !== value)
        {
            this._557230578mainToolGroup = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "mainToolGroup", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property menuTop (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'menuTop' moved to '_950354806menuTop'
	 */

    [Bindable(event="propertyChange")]
    public function get menuTop():spark.components.VGroup
    {
        return this._950354806menuTop;
    }

    public function set menuTop(value:spark.components.VGroup):void
    {
    	var oldValue:Object = this._950354806menuTop;
        if (oldValue !== value)
        {
            this._950354806menuTop = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "menuTop", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property none (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'none' moved to '_3387192none'
	 */

    [Bindable(event="propertyChange")]
    public function get none():spark.components.NavigatorContent
    {
        return this._3387192none;
    }

    public function set none(value:spark.components.NavigatorContent):void
    {
    	var oldValue:Object = this._3387192none;
        if (oldValue !== value)
        {
            this._3387192none = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "none", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property pagerViewStack (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'pagerViewStack' moved to '_383995296pagerViewStack'
	 */

    [Bindable(event="propertyChange")]
    public function get pagerViewStack():mx.containers.ViewStack
    {
        return this._383995296pagerViewStack;
    }

    public function set pagerViewStack(value:mx.containers.ViewStack):void
    {
    	var oldValue:Object = this._383995296pagerViewStack;
        if (oldValue !== value)
        {
            this._383995296pagerViewStack = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "pagerViewStack", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property settings (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'settings' moved to '_1434631203settings'
	 */

    [Bindable(event="propertyChange")]
    public function get settings():kuraraysaijo.view.documentroot.reportscreen.sidebar.SettingsBox
    {
        return this._1434631203settings;
    }

    public function set settings(value:kuraraysaijo.view.documentroot.reportscreen.sidebar.SettingsBox):void
    {
    	var oldValue:Object = this._1434631203settings;
        if (oldValue !== value)
        {
            this._1434631203settings = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "settings", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property settingsBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'settingsBtn' moved to '_121326791settingsBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get settingsBtn():spark.components.Button
    {
        return this._121326791settingsBtn;
    }

    public function set settingsBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._121326791settingsBtn;
        if (oldValue !== value)
        {
            this._121326791settingsBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "settingsBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property subToolBox (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'subToolBox' moved to '_1673225907subToolBox'
	 */

    [Bindable(event="propertyChange")]
    public function get subToolBox():spark.components.Group
    {
        return this._1673225907subToolBox;
    }

    public function set subToolBox(value:spark.components.Group):void
    {
    	var oldValue:Object = this._1673225907subToolBox;
        if (oldValue !== value)
        {
            this._1673225907subToolBox = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "subToolBox", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property toggleSideBarBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'toggleSideBarBtn' moved to '_315402252toggleSideBarBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get toggleSideBarBtn():spark.components.Button
    {
        return this._315402252toggleSideBarBtn;
    }

    public function set toggleSideBarBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._315402252toggleSideBarBtn;
        if (oldValue !== value)
        {
            this._315402252toggleSideBarBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "toggleSideBarBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property toolBoxContainer (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'toolBoxContainer' moved to '_654531758toolBoxContainer'
	 */

    [Bindable(event="propertyChange")]
    public function get toolBoxContainer():mx.containers.ViewStack
    {
        return this._654531758toolBoxContainer;
    }

    public function set toolBoxContainer(value:mx.containers.ViewStack):void
    {
    	var oldValue:Object = this._654531758toolBoxContainer;
        if (oldValue !== value)
        {
            this._654531758toolBoxContainer = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "toolBoxContainer", oldValue, value));
        }
    }



}
