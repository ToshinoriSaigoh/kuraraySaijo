

/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    view.documentroot.reportscreen.sidebar
 *  Class:      FileListBox
 *  Source:     F:\git\KuraraySaijo\src\view\documentroot\reportscreen\sidebar\FileListBox.mxml
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2023.02.23 11:36:05 JST
 */

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
import mx.graphics.SolidColor;
import mx.styles.*;
import spark.components.Button;
import spark.components.ButtonBar;
import spark.components.DataGroup;
import spark.components.Group;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.NavigatorContent;
import spark.components.Scroller;
import spark.components.VGroup;
import spark.core.SpriteVisualElement;
import spark.layouts.BasicLayout;
import spark.layouts.VerticalLayout;
import spark.primitives.Rect;
import view.documentroot.reportscreen.sidebar.FileListBoxInnerClass0;
import view.documentroot.reportscreen.sidebar.FileListBoxInnerClass1;
import view.documentroot.reportscreen.sidebar.filelistbox.FileItem;
import view.documentroot.reportscreen.sidebar.filelistbox.OpenFileItem;
import view.documentroot.reportscreen.sidebar.filelistbox.Skin_CloseBtn;
import view.documentroot.reportscreen.sidebar.filelistbox.Skin_ImportZipBtn;
import view.documentroot.reportscreen.sidebar.filelistbox.Skin_OpenButtonBar;
import view.documentroot.reportscreen.sidebar.filelistbox.Skin_VScroller;
import view.utils.button.Skin_NextBtn;
import view.utils.button.Skin_PrevBtn;



//  begin class def
public class FileListBox
    extends spark.components.NavigatorContent
{

    //  instance variables
    [Bindable]
	/**
 * @private
 **/
    public var body : spark.core.SpriteVisualElement;

    [Bindable]
	/**
 * @private
 **/
    public var closeBtn : spark.components.Button;

    [Bindable]
	/**
 * @private
 **/
    public var ctrlr : controller.documentroot.reportscreen.sidebar.FileListBox;

    [Bindable]
	/**
 * @private
 **/
    public var dateNext : spark.components.Button;

    [Bindable]
	/**
 * @private
 **/
    public var datePrev : spark.components.Button;

    [Bindable]
	/**
 * @private
 **/
    public var dateSelector : spark.components.Group;

    [Bindable]
	/**
 * @private
 **/
    public var dateTextMonth : spark.components.Label;

    [Bindable]
	/**
 * @private
 **/
    public var dateTextYear : spark.components.Label;

    [Bindable]
	/**
 * @private
 **/
    public var emergencyTypeList : spark.components.DataGroup;

    [Bindable]
	/**
 * @private
 **/
    public var fileList : spark.components.DataGroup;

    [Bindable]
	/**
 * @private
 **/
    public var fileListScroller : spark.components.Scroller;

    [Bindable]
	/**
 * @private
 **/
    public var importZipBtn : spark.components.Button;

    [Bindable]
	/**
 * @private
 **/
    public var openFileList : spark.components.DataGroup;

    [Bindable]
	/**
 * @private
 **/
    public var openFileListScroller : spark.components.Scroller;

    [Bindable]
	/**
 * @private
 **/
    public var openFileMenu : spark.components.ButtonBar;

    [Bindable]
	/**
 * @private
 **/
    public var openFileText : spark.components.Label;

    [Bindable]
	/**
 * @private
 **/
    public var openFileViewStack : mx.containers.ViewStack;

    [Bindable]
	/**
 * @private
 **/
    public var reportTypeList : spark.components.DataGroup;

    [Bindable]
	/**
 * @private
 **/
    public var saveFileMenu : spark.components.ButtonBar;

    [Bindable]
	/**
 * @private
 **/
    public var saveFileText : spark.components.Label;

    [Bindable]
	/**
 * @private
 **/
    public var saveFileViewStack : mx.containers.ViewStack;

    [Bindable]
	/**
 * @private
 **/
    public var templateFileText : spark.components.Label;

    [Bindable]
	/**
 * @private
 **/
    public var templateList : spark.components.DataGroup;

    [Bindable]
	/**
 * @private
 **/
    public var templateListScroller : spark.components.Scroller;


    //  type-import dummies



    //  constructor (Flex display object)
    /**
     * @private
     **/
    public function FileListBox()
    {
        super();

        mx_internal::_document = this;




        // layer initializers

       
        // properties
        this.percentHeight = 100.0;
        this.mxmlContentFactory = new mx.core.DeferredInstanceFromFunction(_FileListBox_Array1_c);
        _FileListBox_FileListBox1_i();


        // events












    }

    /**
     * @private
     **/ 
    private var __moduleFactoryInitialized:Boolean = false;

    /**
     * @private
     * Override the module factory so we can defer setting style declarations
     * until a module factory is set. Without the correct module factory set
     * the style declaration will end up in the wrong style manager.
     **/ 
    override public function set moduleFactory(factory:IFlexModuleFactory):void
    {
        super.moduleFactory = factory;
        
        if (__moduleFactoryInitialized)
            return;

        __moduleFactoryInitialized = true;


        // our style settings



                         
    }
 
    //  initialize()
    /**
     * @private
     **/
    override public function initialize():void
    {


        super.initialize();
    }


    //  scripts
    //  end scripts


    //  supporting function definitions for properties, events, styles, effects
private function _FileListBox_FileListBox1_i() : controller.documentroot.reportscreen.sidebar.FileListBox
{
	var temp : controller.documentroot.reportscreen.sidebar.FileListBox = new controller.documentroot.reportscreen.sidebar.FileListBox();
	temp.initialized(this, "ctrlr")
	ctrlr = temp;
	mx.binding.BindingManager.executeBindings(this, "ctrlr", ctrlr);
	return temp;
}

private function _FileListBox_Array1_c() : Array
{
	var temp : Array = [_FileListBox_SpriteVisualElement1_i(), _FileListBox_Group1_c()];
	return temp;
}

private function _FileListBox_SpriteVisualElement1_i() : spark.core.SpriteVisualElement
{
	var temp : spark.core.SpriteVisualElement = new spark.core.SpriteVisualElement();
	temp.initialized(this, "body")
	body = temp;
	mx.binding.BindingManager.executeBindings(this, "body", body);
	return temp;
}

private function _FileListBox_Group1_c() : spark.components.Group
{
	var temp : spark.components.Group = new spark.components.Group();
	temp.percentWidth = 100.0;
	temp.percentHeight = 100.0;
	temp.layout = _FileListBox_BasicLayout1_c();
	temp.mxmlContent = [_FileListBox_Rect1_c(), _FileListBox_HGroup1_c()];
	if (!temp.document) temp.document = this;
	return temp;
}

private function _FileListBox_BasicLayout1_c() : spark.layouts.BasicLayout
{
	var temp : spark.layouts.BasicLayout = new spark.layouts.BasicLayout();
	return temp;
}

private function _FileListBox_Rect1_c() : spark.primitives.Rect
{
	var temp : spark.primitives.Rect = new spark.primitives.Rect();
	temp.percentWidth = 100.0;
	temp.percentHeight = 100.0;
	temp.alpha = 0;
	temp.fill = _FileListBox_SolidColor1_c();
	temp.initialized(this, null)
	return temp;
}

private function _FileListBox_SolidColor1_c() : mx.graphics.SolidColor
{
	var temp : mx.graphics.SolidColor = new mx.graphics.SolidColor();
	temp.color = 0;
	return temp;
}

private function _FileListBox_HGroup1_c() : spark.components.HGroup
{
	var temp : spark.components.HGroup = new spark.components.HGroup();
	temp.percentWidth = 100.0;
	temp.percentHeight = 100.0;
	temp.gap = 0;
	temp.mxmlContent = [_FileListBox_VGroup1_c(), _FileListBox_VGroup2_c()];
	if (!temp.document) temp.document = this;
	return temp;
}

private function _FileListBox_VGroup1_c() : spark.components.VGroup
{
	var temp : spark.components.VGroup = new spark.components.VGroup();
	temp.width = 400;
	temp.percentHeight = 100.0;
	temp.bottom = 2;
	temp.gap = 4;
	temp.mxmlContent = [_FileListBox_ButtonBar1_i(), _FileListBox_ViewStack1_i()];
	if (!temp.document) temp.document = this;
	return temp;
}

private function _FileListBox_ButtonBar1_i() : spark.components.ButtonBar
{
	var temp : spark.components.ButtonBar = new spark.components.ButtonBar();
	temp.requireSelection = true;
	temp.width = 352;
	temp.height = 44;
	temp.setStyle("skinClass", view.documentroot.reportscreen.sidebar.filelistbox.Skin_OpenButtonBar);
	temp.id = "saveFileMenu";
	if (!temp.document) temp.document = this;
	saveFileMenu = temp;
	mx.binding.BindingManager.executeBindings(this, "saveFileMenu", saveFileMenu);
	return temp;
}

private function _FileListBox_ViewStack1_i() : mx.containers.ViewStack
{
	var temp : mx.containers.ViewStack = new mx.containers.ViewStack();
	temp.top = 0;
	temp.bottom = 4;
	temp.percentWidth = 100.0;
	temp.percentHeight = 100.0;
	temp.creationPolicy = "all";
	temp.id = "saveFileViewStack";
	if (!temp.document) temp.document = this;
	temp.mx_internal::_documentDescriptor = 
		new mx.core.UIComponentDescriptor({
		  type: mx.containers.ViewStack
		  ,
		  id: "saveFileViewStack"
		  ,
		  propertiesFactory: function():Object { return {
		    childDescriptors: [
		      new mx.core.UIComponentDescriptor({
		        type: spark.components.NavigatorContent
		        ,
		        propertiesFactory: function():Object { return {
		          mxmlContentFactory: new mx.core.DeferredInstanceFromFunction(_FileListBox_Array5_c)
		        }}
		      })
		    ,
		      new mx.core.UIComponentDescriptor({
		        type: spark.components.NavigatorContent
		        ,
		        propertiesFactory: function():Object { return {
		          mxmlContentFactory: new mx.core.DeferredInstanceFromFunction(_FileListBox_Array7_c)
		        }}
		      })
		    ]
		  }}
		})
	;
	temp.mx_internal::_documentDescriptor.document = this;
	saveFileViewStack = temp;
	mx.binding.BindingManager.executeBindings(this, "saveFileViewStack", saveFileViewStack);
	return temp;
}

private function _FileListBox_Array5_c() : Array
{
	var temp : Array = [_FileListBox_Group2_i(), _FileListBox_Label4_i(), _FileListBox_Scroller1_i()];
	return temp;
}

private function _FileListBox_Group2_i() : spark.components.Group
{
	var temp : spark.components.Group = new spark.components.Group();
	temp.percentWidth = 100.0;
	temp.height = 44;
	temp.mxmlContent = [_FileListBox_Button1_i(), _FileListBox_Label1_i(), _FileListBox_Label2_c(), _FileListBox_Label3_i(), _FileListBox_Button2_i()];
	temp.id = "dateSelector";
	if (!temp.document) temp.document = this;
	dateSelector = temp;
	mx.binding.BindingManager.executeBindings(this, "dateSelector", dateSelector);
	return temp;
}

private function _FileListBox_Button1_i() : spark.components.Button
{
	var temp : spark.components.Button = new spark.components.Button();
	temp.name = "datePrev";
	temp.width = 44;
	temp.height = 44;
	temp.left = 0;
	temp.mouseChildren = false;
	temp.setStyle("skinClass", view.utils.button.Skin_PrevBtn);
	temp.id = "datePrev";
	if (!temp.document) temp.document = this;
	datePrev = temp;
	mx.binding.BindingManager.executeBindings(this, "datePrev", datePrev);
	return temp;
}

private function _FileListBox_Label1_i() : spark.components.Label
{
	var temp : spark.components.Label = new spark.components.Label();
	temp.styleName = "textLarge";
	temp.width = 104;
	temp.height = 44;
	temp.left = 64;
	temp.setStyle("textAlign", "right");
	temp.setStyle("verticalAlign", "middle");
	temp.id = "dateTextYear";
	if (!temp.document) temp.document = this;
	dateTextYear = temp;
	mx.binding.BindingManager.executeBindings(this, "dateTextYear", dateTextYear);
	return temp;
}

private function _FileListBox_Label2_c() : spark.components.Label
{
	var temp : spark.components.Label = new spark.components.Label();
	temp.text = "/";
	temp.width = 32;
	temp.height = 44;
	temp.left = 168;
	temp.setStyle("textAlign", "center");
	temp.setStyle("verticalAlign", "middle");
	if (!temp.document) temp.document = this;
	return temp;
}

private function _FileListBox_Label3_i() : spark.components.Label
{
	var temp : spark.components.Label = new spark.components.Label();
	temp.styleName = "textLarge";
	temp.width = 64;
	temp.height = 44;
	temp.left = 200;
	temp.setStyle("textAlign", "left");
	temp.setStyle("verticalAlign", "middle");
	temp.id = "dateTextMonth";
	if (!temp.document) temp.document = this;
	dateTextMonth = temp;
	mx.binding.BindingManager.executeBindings(this, "dateTextMonth", dateTextMonth);
	return temp;
}

private function _FileListBox_Button2_i() : spark.components.Button
{
	var temp : spark.components.Button = new spark.components.Button();
	temp.name = "dateNext";
	temp.width = 44;
	temp.height = 44;
	temp.right = 50;
	temp.mouseChildren = false;
	temp.setStyle("skinClass", view.utils.button.Skin_NextBtn);
	temp.id = "dateNext";
	if (!temp.document) temp.document = this;
	dateNext = temp;
	mx.binding.BindingManager.executeBindings(this, "dateNext", dateNext);
	return temp;
}

private function _FileListBox_Label4_i() : spark.components.Label
{
	var temp : spark.components.Label = new spark.components.Label();
	temp.top = 48;
	temp.width = 292;
	temp.height = 30;
	temp.styleName = "textSmall";
	temp.setStyle("textAlign", "center");
	temp.setStyle("verticalAlign", "middle");
	temp.id = "saveFileText";
	if (!temp.document) temp.document = this;
	saveFileText = temp;
	mx.binding.BindingManager.executeBindings(this, "saveFileText", saveFileText);
	return temp;
}

private function _FileListBox_Scroller1_i() : spark.components.Scroller
{
	var temp : spark.components.Scroller = new spark.components.Scroller();
	temp.percentWidth = 100.0;
	temp.top = 78;
	temp.right = 2;
	temp.bottom = 2;
	temp.viewport = _FileListBox_DataGroup1_i();
	temp.setStyle("verticalScrollPolicy", "on");
	temp.setStyle("skinClass", view.documentroot.reportscreen.sidebar.filelistbox.Skin_VScroller);
	temp.id = "fileListScroller";
	if (!temp.document) temp.document = this;
	fileListScroller = temp;
	mx.binding.BindingManager.executeBindings(this, "fileListScroller", fileListScroller);
	return temp;
}

private function _FileListBox_DataGroup1_i() : spark.components.DataGroup
{
	var temp : spark.components.DataGroup = new spark.components.DataGroup();
	temp.name = "fileList";
	temp.percentHeight = 100.0;
	temp.itemRenderer = _FileListBox_ClassFactory1_c();
	temp.layout = _FileListBox_VerticalLayout1_c();
	temp.id = "fileList";
	if (!temp.document) temp.document = this;
	fileList = temp;
	mx.binding.BindingManager.executeBindings(this, "fileList", fileList);
	return temp;
}

private function _FileListBox_ClassFactory1_c() : mx.core.ClassFactory
{
	var temp : mx.core.ClassFactory = new mx.core.ClassFactory();
	temp.generator = view.documentroot.reportscreen.sidebar.filelistbox.FileItem;
	return temp;
}

private function _FileListBox_VerticalLayout1_c() : spark.layouts.VerticalLayout
{
	var temp : spark.layouts.VerticalLayout = new spark.layouts.VerticalLayout();
	temp.gap = 2;
	return temp;
}

private function _FileListBox_Array7_c() : Array
{
	var temp : Array = [_FileListBox_Label5_i(), _FileListBox_Scroller2_i()];
	return temp;
}

private function _FileListBox_Label5_i() : spark.components.Label
{
	var temp : spark.components.Label = new spark.components.Label();
	temp.top = 0;
	temp.percentWidth = 100.0;
	temp.height = 30;
	temp.styleName = "textSmall";
	temp.setStyle("textAlign", "center");
	temp.setStyle("verticalAlign", "middle");
	temp.id = "templateFileText";
	if (!temp.document) temp.document = this;
	templateFileText = temp;
	mx.binding.BindingManager.executeBindings(this, "templateFileText", templateFileText);
	return temp;
}

private function _FileListBox_Scroller2_i() : spark.components.Scroller
{
	var temp : spark.components.Scroller = new spark.components.Scroller();
	temp.top = 30;
	temp.right = 2;
	temp.bottom = 2;
	temp.viewport = _FileListBox_DataGroup2_i();
	temp.setStyle("verticalScrollPolicy", "on");
	temp.setStyle("skinClass", view.documentroot.reportscreen.sidebar.filelistbox.Skin_VScroller);
	temp.id = "templateListScroller";
	if (!temp.document) temp.document = this;
	templateListScroller = temp;
	mx.binding.BindingManager.executeBindings(this, "templateListScroller", templateListScroller);
	return temp;
}

private function _FileListBox_DataGroup2_i() : spark.components.DataGroup
{
	var temp : spark.components.DataGroup = new spark.components.DataGroup();
	temp.name = "templateList";
	temp.percentHeight = 100.0;
	temp.itemRenderer = _FileListBox_ClassFactory2_c();
	temp.layout = _FileListBox_VerticalLayout2_c();
	temp.id = "templateList";
	if (!temp.document) temp.document = this;
	templateList = temp;
	mx.binding.BindingManager.executeBindings(this, "templateList", templateList);
	return temp;
}

private function _FileListBox_ClassFactory2_c() : mx.core.ClassFactory
{
	var temp : mx.core.ClassFactory = new mx.core.ClassFactory();
	temp.generator = view.documentroot.reportscreen.sidebar.filelistbox.FileItem;
	return temp;
}

private function _FileListBox_VerticalLayout2_c() : spark.layouts.VerticalLayout
{
	var temp : spark.layouts.VerticalLayout = new spark.layouts.VerticalLayout();
	temp.gap = 2;
	return temp;
}

private function _FileListBox_VGroup2_c() : spark.components.VGroup
{
	var temp : spark.components.VGroup = new spark.components.VGroup();
	temp.width = 400;
	temp.percentHeight = 100.0;
	temp.gap = 4;
	temp.mxmlContent = [_FileListBox_HGroup2_c(), _FileListBox_ViewStack2_i()];
	if (!temp.document) temp.document = this;
	return temp;
}

private function _FileListBox_HGroup2_c() : spark.components.HGroup
{
	var temp : spark.components.HGroup = new spark.components.HGroup();
	temp.gap = 0;
	temp.mxmlContent = [_FileListBox_ButtonBar2_i(), _FileListBox_Button3_i()];
	if (!temp.document) temp.document = this;
	return temp;
}

private function _FileListBox_ButtonBar2_i() : spark.components.ButtonBar
{
	var temp : spark.components.ButtonBar = new spark.components.ButtonBar();
	temp.requireSelection = true;
	temp.width = 352;
	temp.height = 44;
	temp.setStyle("skinClass", view.documentroot.reportscreen.sidebar.filelistbox.Skin_OpenButtonBar);
	temp.id = "openFileMenu";
	if (!temp.document) temp.document = this;
	openFileMenu = temp;
	mx.binding.BindingManager.executeBindings(this, "openFileMenu", openFileMenu);
	return temp;
}

private function _FileListBox_Button3_i() : spark.components.Button
{
	var temp : spark.components.Button = new spark.components.Button();
	temp.name = "closeBtn";
	temp.width = 44;
	temp.height = 44;
	temp.setStyle("skinClass", view.documentroot.reportscreen.sidebar.filelistbox.Skin_CloseBtn);
	temp.id = "closeBtn";
	if (!temp.document) temp.document = this;
	closeBtn = temp;
	mx.binding.BindingManager.executeBindings(this, "closeBtn", closeBtn);
	return temp;
}

private function _FileListBox_ViewStack2_i() : mx.containers.ViewStack
{
	var temp : mx.containers.ViewStack = new mx.containers.ViewStack();
	temp.top = 0;
	temp.right = 2;
	temp.bottom = 4;
	temp.percentWidth = 100.0;
	temp.percentHeight = 100.0;
	temp.creationPolicy = "all";
	temp.id = "openFileViewStack";
	if (!temp.document) temp.document = this;
	temp.mx_internal::_documentDescriptor = 
		new mx.core.UIComponentDescriptor({
		  type: mx.containers.ViewStack
		  ,
		  id: "openFileViewStack"
		  ,
		  propertiesFactory: function():Object { return {
		    childDescriptors: [
		      new mx.core.UIComponentDescriptor({
		        type: spark.components.NavigatorContent
		        ,
		        propertiesFactory: function():Object { return {
		          mxmlContentFactory: new mx.core.DeferredInstanceFromFunction(_FileListBox_Array10_c)
		        }}
		      })
		    ,
		      new mx.core.UIComponentDescriptor({
		        type: spark.components.NavigatorContent
		        ,
		        propertiesFactory: function():Object { return {
		          mxmlContentFactory: new mx.core.DeferredInstanceFromFunction(_FileListBox_Array12_c)
		        }}
		      })
		    ,
		      new mx.core.UIComponentDescriptor({
		        type: spark.components.NavigatorContent
		        ,
		        propertiesFactory: function():Object { return {
		          mxmlContentFactory: new mx.core.DeferredInstanceFromFunction(_FileListBox_Array13_c)
		        }}
		      })
		    ]
		  }}
		})
	;
	temp.mx_internal::_documentDescriptor.document = this;
	openFileViewStack = temp;
	mx.binding.BindingManager.executeBindings(this, "openFileViewStack", openFileViewStack);
	return temp;
}

private function _FileListBox_Array10_c() : Array
{
	var temp : Array = [_FileListBox_HGroup3_c(), _FileListBox_Scroller3_i()];
	return temp;
}

private function _FileListBox_HGroup3_c() : spark.components.HGroup
{
	var temp : spark.components.HGroup = new spark.components.HGroup();
	temp.gap = 4;
	temp.height = 44;
	temp.mxmlContent = [_FileListBox_Button4_i(), _FileListBox_Label6_i()];
	if (!temp.document) temp.document = this;
	return temp;
}

private function _FileListBox_Button4_i() : spark.components.Button
{
	var temp : spark.components.Button = new spark.components.Button();
	temp.name = "importZipBtn";
	temp.width = 44;
	temp.height = 44;
	temp.setStyle("skinClass", view.documentroot.reportscreen.sidebar.filelistbox.Skin_ImportZipBtn);
	temp.id = "importZipBtn";
	if (!temp.document) temp.document = this;
	importZipBtn = temp;
	mx.binding.BindingManager.executeBindings(this, "importZipBtn", importZipBtn);
	return temp;
}

private function _FileListBox_Label6_i() : spark.components.Label
{
	var temp : spark.components.Label = new spark.components.Label();
	temp.top = 0;
	temp.width = 244;
	temp.height = 44;
	temp.styleName = "textSmall";
	temp.setStyle("textAlign", "center");
	temp.setStyle("verticalAlign", "middle");
	temp.id = "openFileText";
	if (!temp.document) temp.document = this;
	openFileText = temp;
	mx.binding.BindingManager.executeBindings(this, "openFileText", openFileText);
	return temp;
}

private function _FileListBox_Scroller3_i() : spark.components.Scroller
{
	var temp : spark.components.Scroller = new spark.components.Scroller();
	temp.percentWidth = 100.0;
	temp.right = 2;
	temp.top = 48;
	temp.bottom = 2;
	temp.viewport = _FileListBox_DataGroup3_i();
	temp.setStyle("verticalScrollPolicy", "on");
	temp.setStyle("skinClass", view.documentroot.reportscreen.sidebar.filelistbox.Skin_VScroller);
	temp.id = "openFileListScroller";
	if (!temp.document) temp.document = this;
	openFileListScroller = temp;
	mx.binding.BindingManager.executeBindings(this, "openFileListScroller", openFileListScroller);
	return temp;
}

private function _FileListBox_DataGroup3_i() : spark.components.DataGroup
{
	var temp : spark.components.DataGroup = new spark.components.DataGroup();
	temp.name = "openFileList";
	temp.percentHeight = 100.0;
	temp.itemRenderer = _FileListBox_ClassFactory3_c();
	temp.layout = _FileListBox_VerticalLayout3_c();
	temp.id = "openFileList";
	if (!temp.document) temp.document = this;
	openFileList = temp;
	mx.binding.BindingManager.executeBindings(this, "openFileList", openFileList);
	return temp;
}

private function _FileListBox_ClassFactory3_c() : mx.core.ClassFactory
{
	var temp : mx.core.ClassFactory = new mx.core.ClassFactory();
	temp.generator = view.documentroot.reportscreen.sidebar.filelistbox.OpenFileItem;
	return temp;
}

private function _FileListBox_VerticalLayout3_c() : spark.layouts.VerticalLayout
{
	var temp : spark.layouts.VerticalLayout = new spark.layouts.VerticalLayout();
	temp.gap = 2;
	return temp;
}

private function _FileListBox_Array12_c() : Array
{
	var temp : Array = [_FileListBox_DataGroup4_i()];
	return temp;
}

private function _FileListBox_DataGroup4_i() : spark.components.DataGroup
{
	var temp : spark.components.DataGroup = new spark.components.DataGroup();
	temp.name = "reportTypeList";
	temp.right = 0;
	temp.top = 0;
	temp.bottom = 0;
	temp.percentWidth = 100.0;
	temp.percentHeight = 100.0;
	temp.layout = _FileListBox_VerticalLayout4_c();
	temp.itemRenderer = _FileListBox_ClassFactory4_c();
	temp.id = "reportTypeList";
	if (!temp.document) temp.document = this;
	reportTypeList = temp;
	mx.binding.BindingManager.executeBindings(this, "reportTypeList", reportTypeList);
	return temp;
}

private function _FileListBox_VerticalLayout4_c() : spark.layouts.VerticalLayout
{
	var temp : spark.layouts.VerticalLayout = new spark.layouts.VerticalLayout();
	temp.gap = 2;
	return temp;
}

private function _FileListBox_ClassFactory4_c() : mx.core.ClassFactory
{
	var temp : mx.core.ClassFactory = new mx.core.ClassFactory();
	temp.generator = view.documentroot.reportscreen.sidebar.FileListBoxInnerClass0;
	temp.properties = {outerDocument: this};
	return temp;
}

private function _FileListBox_Array13_c() : Array
{
	var temp : Array = [_FileListBox_DataGroup5_i()];
	return temp;
}

private function _FileListBox_DataGroup5_i() : spark.components.DataGroup
{
	var temp : spark.components.DataGroup = new spark.components.DataGroup();
	temp.name = "emergencyTypeList";
	temp.right = 0;
	temp.top = 0;
	temp.bottom = 0;
	temp.percentWidth = 100.0;
	temp.percentHeight = 100.0;
	temp.layout = _FileListBox_VerticalLayout5_c();
	temp.itemRenderer = _FileListBox_ClassFactory5_c();
	temp.id = "emergencyTypeList";
	if (!temp.document) temp.document = this;
	emergencyTypeList = temp;
	mx.binding.BindingManager.executeBindings(this, "emergencyTypeList", emergencyTypeList);
	return temp;
}

private function _FileListBox_VerticalLayout5_c() : spark.layouts.VerticalLayout
{
	var temp : spark.layouts.VerticalLayout = new spark.layouts.VerticalLayout();
	temp.gap = 2;
	return temp;
}

private function _FileListBox_ClassFactory5_c() : mx.core.ClassFactory
{
	var temp : mx.core.ClassFactory = new mx.core.ClassFactory();
	temp.generator = view.documentroot.reportscreen.sidebar.FileListBoxInnerClass1;
	temp.properties = {outerDocument: this};
	return temp;
}





    //  embed carrier vars
    //  end embed carrier vars


//  end class def
}

//  end package def
}