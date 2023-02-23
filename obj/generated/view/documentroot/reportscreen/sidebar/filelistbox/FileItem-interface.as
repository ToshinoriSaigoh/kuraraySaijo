

package view.documentroot.reportscreen.sidebar.filelistbox
{
import controller.documentroot.reportscreen.sidebar.filelistbox.FileItem;
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
import spark.components.Group;
import spark.components.Label;
import spark.components.ToggleButton;
import spark.components.supportClasses.ItemRenderer;
import spark.core.SpriteVisualElement;
import view.utils.DataTypeMark;
import spark.components.supportClasses.ItemRenderer;
import mx.states.State;
import spark.components.VGroup;
import spark.components.HGroup;

public class FileItem extends spark.components.supportClasses.ItemRenderer
{
	public function FileItem() {}

	[Bindable]
	public var ctrlr : controller.documentroot.reportscreen.sidebar.filelistbox.FileItem;
	[Bindable]
	public var body : spark.core.SpriteVisualElement;
	[Bindable]
	public var fileItem : spark.components.Group;
	[Bindable]
	public var toggleBtn : spark.components.ToggleButton;
	[Bindable]
	public var type : spark.components.Label;
	[Bindable]
	public var fileName : spark.components.Label;
	[Bindable]
	public var date : spark.components.Label;
	[Bindable]
	public var dataTypeMark : view.utils.DataTypeMark;
	[Bindable]
	public var deleteFileBtn : spark.components.Button;
	[Bindable]
	public var playFileBtn : spark.components.Button;
	[Bindable]
	public var openFileBtn : spark.components.Button;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
