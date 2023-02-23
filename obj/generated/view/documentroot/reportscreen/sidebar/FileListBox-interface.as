

package view.documentroot.reportscreen.sidebar
{
import controller.documentroot.reportscreen.sidebar.FileListBox;
import flash.accessibility.*;
import flash.data.*;
import flash.debugger.*;
import flash.desktop.*;
import flash.display.*;
import flash.errors.*;
import flash.events.*;
import flash.external.*;
import flash.filesystem.*;
import flash.geom.*;
import flash.html.*;
import flash.html.script.*;
import flash.media.*;
import flash.net.*;
import flash.printing.*;
import flash.profiler.*;
import flash.system.*;
import flash.text.*;
import flash.ui.*;
import flash.utils.*;
import flash.xml.*;
import mx.binding.*;
import mx.containers.ViewStack;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromClass;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IDeferredInstance;
import mx.core.IFactory;
import mx.core.IFlexModuleFactory;
import mx.core.IPropertyChangeNotifier;
import mx.core.mx_internal;
import mx.filters.*;
import mx.styles.*;
import spark.components.Button;
import spark.components.ButtonBar;
import spark.components.DataGroup;
import spark.components.Group;
import spark.components.Label;
import spark.components.NavigatorContent;
import spark.components.Scroller;
import spark.core.SpriteVisualElement;
import view.documentroot.reportscreen.sidebar.FileListBoxInnerClass0;
import view.documentroot.reportscreen.sidebar.FileListBoxInnerClass1;
import spark.primitives.Rect;
import spark.components.NavigatorContent;
import spark.components.Group;
import mx.core.IFactory;
import spark.components.VGroup;
import spark.components.Label;
import spark.layouts.BasicLayout;
import spark.components.HGroup;
import mx.graphics.SolidColor;
import spark.layouts.VerticalLayout;

public class FileListBox extends spark.components.NavigatorContent
{
	public function FileListBox() {}

	[Bindable]
	public var ctrlr : controller.documentroot.reportscreen.sidebar.FileListBox;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;
	[Bindable]
	public var saveFileMenu : spark.components.ButtonBar;
	[Bindable]
	public var saveFileViewStack : mx.containers.ViewStack;
	[Bindable]
	public var dateSelector : spark.components.Group;
	[Bindable]
	public var datePrev : spark.components.Button;
	[Bindable]
	public var dateTextYear : spark.components.Label;
	[Bindable]
	public var dateTextMonth : spark.components.Label;
	[Bindable]
	public var dateNext : spark.components.Button;
	[Bindable]
	public var saveFileText : spark.components.Label;
	[Bindable]
	public var fileListScroller : spark.components.Scroller;
	[Bindable]
	public var fileList : spark.components.DataGroup;
	[Bindable]
	public var templateFileText : spark.components.Label;
	[Bindable]
	public var templateListScroller : spark.components.Scroller;
	[Bindable]
	public var templateList : spark.components.DataGroup;
	[Bindable]
	public var openFileMenu : spark.components.ButtonBar;
	[Bindable]
	public var closeBtn : spark.components.Button;
	[Bindable]
	public var openFileViewStack : mx.containers.ViewStack;
	[Bindable]
	public var importZipBtn : spark.components.Button;
	[Bindable]
	public var openFileText : spark.components.Label;
	[Bindable]
	public var openFileListScroller : spark.components.Scroller;
	[Bindable]
	public var openFileList : spark.components.DataGroup;
	[Bindable]
	public var reportTypeList : spark.components.DataGroup;
	[Bindable]
	public var emergencyTypeList : spark.components.DataGroup;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
