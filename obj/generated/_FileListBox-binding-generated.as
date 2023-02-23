


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
import spark.components.DataGroup;
import spark.components.ButtonBar;
import spark.components.Button;
import spark.components.Label;
import spark.components.Scroller;
import controller.documentroot.reportscreen.sidebar.FileListBox;

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
	 * generated bindable wrapper for property ctrlr (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlr' moved to '_94997351ctrlr'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlr():controller.documentroot.reportscreen.sidebar.FileListBox
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:controller.documentroot.reportscreen.sidebar.FileListBox):void
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
	 * generated bindable wrapper for property dateNext (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dateNext' moved to '_1792567233dateNext'
	 */

    [Bindable(event="propertyChange")]
    public function get dateNext():spark.components.Button
    {
        return this._1792567233dateNext;
    }

    public function set dateNext(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1792567233dateNext;
        if (oldValue !== value)
        {
            this._1792567233dateNext = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dateNext", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property datePrev (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'datePrev' moved to '_1792638721datePrev'
	 */

    [Bindable(event="propertyChange")]
    public function get datePrev():spark.components.Button
    {
        return this._1792638721datePrev;
    }

    public function set datePrev(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1792638721datePrev;
        if (oldValue !== value)
        {
            this._1792638721datePrev = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "datePrev", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property dateSelector (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dateSelector' moved to '_416040531dateSelector'
	 */

    [Bindable(event="propertyChange")]
    public function get dateSelector():spark.components.Group
    {
        return this._416040531dateSelector;
    }

    public function set dateSelector(value:spark.components.Group):void
    {
    	var oldValue:Object = this._416040531dateSelector;
        if (oldValue !== value)
        {
            this._416040531dateSelector = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dateSelector", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property dateTextMonth (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dateTextMonth' moved to '_649270597dateTextMonth'
	 */

    [Bindable(event="propertyChange")]
    public function get dateTextMonth():spark.components.Label
    {
        return this._649270597dateTextMonth;
    }

    public function set dateTextMonth(value:spark.components.Label):void
    {
    	var oldValue:Object = this._649270597dateTextMonth;
        if (oldValue !== value)
        {
            this._649270597dateTextMonth = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dateTextMonth", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property dateTextYear (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'dateTextYear' moved to '_1683859672dateTextYear'
	 */

    [Bindable(event="propertyChange")]
    public function get dateTextYear():spark.components.Label
    {
        return this._1683859672dateTextYear;
    }

    public function set dateTextYear(value:spark.components.Label):void
    {
    	var oldValue:Object = this._1683859672dateTextYear;
        if (oldValue !== value)
        {
            this._1683859672dateTextYear = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dateTextYear", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property emergencyTypeList (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'emergencyTypeList' moved to '_1221431209emergencyTypeList'
	 */

    [Bindable(event="propertyChange")]
    public function get emergencyTypeList():spark.components.DataGroup
    {
        return this._1221431209emergencyTypeList;
    }

    public function set emergencyTypeList(value:spark.components.DataGroup):void
    {
    	var oldValue:Object = this._1221431209emergencyTypeList;
        if (oldValue !== value)
        {
            this._1221431209emergencyTypeList = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "emergencyTypeList", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property fileList (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'fileList' moved to '_735773638fileList'
	 */

    [Bindable(event="propertyChange")]
    public function get fileList():spark.components.DataGroup
    {
        return this._735773638fileList;
    }

    public function set fileList(value:spark.components.DataGroup):void
    {
    	var oldValue:Object = this._735773638fileList;
        if (oldValue !== value)
        {
            this._735773638fileList = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "fileList", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property fileListScroller (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'fileListScroller' moved to '_1355545236fileListScroller'
	 */

    [Bindable(event="propertyChange")]
    public function get fileListScroller():spark.components.Scroller
    {
        return this._1355545236fileListScroller;
    }

    public function set fileListScroller(value:spark.components.Scroller):void
    {
    	var oldValue:Object = this._1355545236fileListScroller;
        if (oldValue !== value)
        {
            this._1355545236fileListScroller = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "fileListScroller", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property importZipBtn (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'importZipBtn' moved to '_1858920576importZipBtn'
	 */

    [Bindable(event="propertyChange")]
    public function get importZipBtn():spark.components.Button
    {
        return this._1858920576importZipBtn;
    }

    public function set importZipBtn(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1858920576importZipBtn;
        if (oldValue !== value)
        {
            this._1858920576importZipBtn = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "importZipBtn", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property openFileList (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'openFileList' moved to '_1752538276openFileList'
	 */

    [Bindable(event="propertyChange")]
    public function get openFileList():spark.components.DataGroup
    {
        return this._1752538276openFileList;
    }

    public function set openFileList(value:spark.components.DataGroup):void
    {
    	var oldValue:Object = this._1752538276openFileList;
        if (oldValue !== value)
        {
            this._1752538276openFileList = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "openFileList", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property openFileListScroller (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'openFileListScroller' moved to '_1093496578openFileListScroller'
	 */

    [Bindable(event="propertyChange")]
    public function get openFileListScroller():spark.components.Scroller
    {
        return this._1093496578openFileListScroller;
    }

    public function set openFileListScroller(value:spark.components.Scroller):void
    {
    	var oldValue:Object = this._1093496578openFileListScroller;
        if (oldValue !== value)
        {
            this._1093496578openFileListScroller = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "openFileListScroller", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property openFileMenu (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'openFileMenu' moved to '_1752564069openFileMenu'
	 */

    [Bindable(event="propertyChange")]
    public function get openFileMenu():spark.components.ButtonBar
    {
        return this._1752564069openFileMenu;
    }

    public function set openFileMenu(value:spark.components.ButtonBar):void
    {
    	var oldValue:Object = this._1752564069openFileMenu;
        if (oldValue !== value)
        {
            this._1752564069openFileMenu = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "openFileMenu", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property openFileText (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'openFileText' moved to '_1752772915openFileText'
	 */

    [Bindable(event="propertyChange")]
    public function get openFileText():spark.components.Label
    {
        return this._1752772915openFileText;
    }

    public function set openFileText(value:spark.components.Label):void
    {
    	var oldValue:Object = this._1752772915openFileText;
        if (oldValue !== value)
        {
            this._1752772915openFileText = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "openFileText", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property openFileViewStack (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'openFileViewStack' moved to '_729669987openFileViewStack'
	 */

    [Bindable(event="propertyChange")]
    public function get openFileViewStack():mx.containers.ViewStack
    {
        return this._729669987openFileViewStack;
    }

    public function set openFileViewStack(value:mx.containers.ViewStack):void
    {
    	var oldValue:Object = this._729669987openFileViewStack;
        if (oldValue !== value)
        {
            this._729669987openFileViewStack = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "openFileViewStack", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property reportTypeList (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'reportTypeList' moved to '_1855245388reportTypeList'
	 */

    [Bindable(event="propertyChange")]
    public function get reportTypeList():spark.components.DataGroup
    {
        return this._1855245388reportTypeList;
    }

    public function set reportTypeList(value:spark.components.DataGroup):void
    {
    	var oldValue:Object = this._1855245388reportTypeList;
        if (oldValue !== value)
        {
            this._1855245388reportTypeList = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "reportTypeList", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property saveFileMenu (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'saveFileMenu' moved to '_800147048saveFileMenu'
	 */

    [Bindable(event="propertyChange")]
    public function get saveFileMenu():spark.components.ButtonBar
    {
        return this._800147048saveFileMenu;
    }

    public function set saveFileMenu(value:spark.components.ButtonBar):void
    {
    	var oldValue:Object = this._800147048saveFileMenu;
        if (oldValue !== value)
        {
            this._800147048saveFileMenu = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "saveFileMenu", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property saveFileText (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'saveFileText' moved to '_799938202saveFileText'
	 */

    [Bindable(event="propertyChange")]
    public function get saveFileText():spark.components.Label
    {
        return this._799938202saveFileText;
    }

    public function set saveFileText(value:spark.components.Label):void
    {
    	var oldValue:Object = this._799938202saveFileText;
        if (oldValue !== value)
        {
            this._799938202saveFileText = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "saveFileText", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property saveFileViewStack (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'saveFileViewStack' moved to '_429683126saveFileViewStack'
	 */

    [Bindable(event="propertyChange")]
    public function get saveFileViewStack():mx.containers.ViewStack
    {
        return this._429683126saveFileViewStack;
    }

    public function set saveFileViewStack(value:mx.containers.ViewStack):void
    {
    	var oldValue:Object = this._429683126saveFileViewStack;
        if (oldValue !== value)
        {
            this._429683126saveFileViewStack = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "saveFileViewStack", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property templateFileText (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'templateFileText' moved to '_531716253templateFileText'
	 */

    [Bindable(event="propertyChange")]
    public function get templateFileText():spark.components.Label
    {
        return this._531716253templateFileText;
    }

    public function set templateFileText(value:spark.components.Label):void
    {
    	var oldValue:Object = this._531716253templateFileText;
        if (oldValue !== value)
        {
            this._531716253templateFileText = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "templateFileText", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property templateList (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'templateList' moved to '_976214984templateList'
	 */

    [Bindable(event="propertyChange")]
    public function get templateList():spark.components.DataGroup
    {
        return this._976214984templateList;
    }

    public function set templateList(value:spark.components.DataGroup):void
    {
    	var oldValue:Object = this._976214984templateList;
        if (oldValue !== value)
        {
            this._976214984templateList = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "templateList", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property templateListScroller (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'templateListScroller' moved to '_263830382templateListScroller'
	 */

    [Bindable(event="propertyChange")]
    public function get templateListScroller():spark.components.Scroller
    {
        return this._263830382templateListScroller;
    }

    public function set templateListScroller(value:spark.components.Scroller):void
    {
    	var oldValue:Object = this._263830382templateListScroller;
        if (oldValue !== value)
        {
            this._263830382templateListScroller = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "templateListScroller", oldValue, value));
        }
    }



}
