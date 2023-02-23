


import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import view.documentroot.reportscreen.sidebar.pager.CtrlBox;
import flash.media.*;
import flash.text.*;
import flash.external.*;
import flash.geom.*;
import flash.debugger.*;
import flash.html.script.*;
import spark.components.HGroup;
import flash.display.*;
import flash.xml.*;
import spark.components.Label;
import flash.ui.*;
import mx.binding.*;
import flash.utils.*;
import controller.documentroot.reportscreen.sidebar.pager.PageBtn;
import flash.html.*;
import mx.graphics.SolidColor;
import spark.primitives.Rect;
import flash.accessibility.*;
import flash.printing.*;
import flash.desktop.*;
import mx.styles.*;
import view.documentroot.reportscreen.sidebar.pager.*;
import flash.errors.*;
import flash.net.*;
import flash.system.*;
import flash.events.*;
import mx.filters.*;
import flash.data.*;
import flash.filesystem.*;
import flash.profiler.*;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property _Skin_PageBtn_Rect1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_Skin_PageBtn_Rect1' moved to '_546887832_Skin_PageBtn_Rect1'
	 */

    [Bindable(event="propertyChange")]
    public function get _Skin_PageBtn_Rect1():spark.primitives.Rect
    {
        return this._546887832_Skin_PageBtn_Rect1;
    }

    public function set _Skin_PageBtn_Rect1(value:spark.primitives.Rect):void
    {
    	var oldValue:Object = this._546887832_Skin_PageBtn_Rect1;
        if (oldValue !== value)
        {
            this._546887832_Skin_PageBtn_Rect1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Skin_PageBtn_Rect1", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property _Skin_PageBtn_SolidColor1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var '_Skin_PageBtn_SolidColor1' moved to '_615934652_Skin_PageBtn_SolidColor1'
	 */

    [Bindable(event="propertyChange")]
    public function get _Skin_PageBtn_SolidColor1():mx.graphics.SolidColor
    {
        return this._615934652_Skin_PageBtn_SolidColor1;
    }

    public function set _Skin_PageBtn_SolidColor1(value:mx.graphics.SolidColor):void
    {
    	var oldValue:Object = this._615934652_Skin_PageBtn_SolidColor1;
        if (oldValue !== value)
        {
            this._615934652_Skin_PageBtn_SolidColor1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Skin_PageBtn_SolidColor1", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property ctrlBox (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ctrlBox' moved to '_1098098528ctrlBox'
	 */

    [Bindable(event="propertyChange")]
    public function get ctrlBox():view.documentroot.reportscreen.sidebar.pager.CtrlBox
    {
        return this._1098098528ctrlBox;
    }

    public function set ctrlBox(value:view.documentroot.reportscreen.sidebar.pager.CtrlBox):void
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
    public function get ctrlr():controller.documentroot.reportscreen.sidebar.pager.PageBtn
    {
        return this._94997351ctrlr;
    }

    public function set ctrlr(value:controller.documentroot.reportscreen.sidebar.pager.PageBtn):void
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
	 * generated bindable wrapper for property itemGroup (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'itemGroup' moved to '_2131590956itemGroup'
	 */

    [Bindable(event="propertyChange")]
    public function get itemGroup():spark.components.HGroup
    {
        return this._2131590956itemGroup;
    }

    public function set itemGroup(value:spark.components.HGroup):void
    {
    	var oldValue:Object = this._2131590956itemGroup;
        if (oldValue !== value)
        {
            this._2131590956itemGroup = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "itemGroup", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property label (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'label' moved to '_102727412label'
	 */

    [Bindable(event="propertyChange")]
    public function get label():spark.components.Label
    {
        return this._102727412label;
    }

    public function set label(value:spark.components.Label):void
    {
    	var oldValue:Object = this._102727412label;
        if (oldValue !== value)
        {
            this._102727412label = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "label", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property _label (private)
	 * - generated setter
	 * - generated getter
	 * - original private var '_label' moved to '_1472470539_label'
	 */

    [Bindable(event="propertyChange")]
    private function get _label():String
    {
        return this._1472470539_label;
    }

    private function set _label(value:String):void
    {
    	var oldValue:Object = this._1472470539_label;
        if (oldValue !== value)
        {
            this._1472470539_label = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_label", oldValue, value));
        }
    }



}
