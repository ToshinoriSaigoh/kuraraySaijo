package {
import flash.display.DisplayObject;
import flash.utils.*;
import mx.core.IFlexModuleFactory;
import mx.styles.IStyleManager2;
import mx.events.Request;
import mx.styles.StyleManagerImpl;
import mx.managers.systemClasses.ChildManager;
import mx.core.TextFieldFactory; TextFieldFactory;
import flash.system.*
import spark.accessibility.ListBaseAccImpl;
import spark.accessibility.ButtonBarBaseAccImpl;
import mx.accessibility.UIComponentAccProps;
import spark.accessibility.ListAccImpl;
import mx.accessibility.ButtonAccImpl;
import spark.accessibility.TextBaseAccImpl;
import spark.accessibility.DropDownListBaseAccImpl;
import mx.accessibility.DateFieldAccImpl;
import spark.accessibility.ButtonBaseAccImpl;
import spark.accessibility.ToggleButtonAccImpl;
import spark.accessibility.SliderBaseAccImpl;
import spark.accessibility.RichEditableTextAccImpl;
import mx.accessibility.DateChooserAccImpl;
import mx.accessibility.ComboBaseAccImpl;
import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import mx.managers.SystemManagerGlobals;
import mx.resources.ResourceManager;
import mx.collections.ArrayCollection;
import mx.collections.ArrayList;
import mx.utils.ObjectProxy;
import mx.effects.EffectManager;
import mx.core.mx_internal;

[Mixin]
public class _Client_FlexInit
{
   public function _Client_FlexInit()
   {
       super();
   }
   public static function init(fbs:IFlexModuleFactory):void
   {
       new ChildManager(fbs);
       var styleManager:IStyleManager2;
       styleManager = new StyleManagerImpl(fbs);
       EffectManager.mx_internal::registerEffectTrigger("addedEffect", "added");
       EffectManager.mx_internal::registerEffectTrigger("closeEffect", "windowClose");
       EffectManager.mx_internal::registerEffectTrigger("creationCompleteEffect", "creationComplete");
       EffectManager.mx_internal::registerEffectTrigger("focusInEffect", "focusIn");
       EffectManager.mx_internal::registerEffectTrigger("focusOutEffect", "focusOut");
       EffectManager.mx_internal::registerEffectTrigger("hideEffect", "hide");
       EffectManager.mx_internal::registerEffectTrigger("minimizeEffect", "windowMinimize");
       EffectManager.mx_internal::registerEffectTrigger("mouseDownEffect", "mouseDown");
       EffectManager.mx_internal::registerEffectTrigger("mouseUpEffect", "mouseUp");
       EffectManager.mx_internal::registerEffectTrigger("moveEffect", "move");
       EffectManager.mx_internal::registerEffectTrigger("removedEffect", "removed");
       EffectManager.mx_internal::registerEffectTrigger("resizeEffect", "resize");
       EffectManager.mx_internal::registerEffectTrigger("rollOutEffect", "rollOut");
       EffectManager.mx_internal::registerEffectTrigger("rollOverEffect", "rollOver");
       EffectManager.mx_internal::registerEffectTrigger("showEffect", "show");
       EffectManager.mx_internal::registerEffectTrigger("unminimizeEffect", "windowUnminimize");
       // trace("Flex accessibility startup: " + Capabilities.hasAccessibility);
       if (Capabilities.hasAccessibility) {
          spark.accessibility.ListBaseAccImpl.enableAccessibility();
          spark.accessibility.ButtonBarBaseAccImpl.enableAccessibility();
          mx.accessibility.UIComponentAccProps.enableAccessibility();
          spark.accessibility.ListAccImpl.enableAccessibility();
          mx.accessibility.ButtonAccImpl.enableAccessibility();
          spark.accessibility.TextBaseAccImpl.enableAccessibility();
          spark.accessibility.DropDownListBaseAccImpl.enableAccessibility();
          mx.accessibility.DateFieldAccImpl.enableAccessibility();
          spark.accessibility.ButtonBaseAccImpl.enableAccessibility();
          spark.accessibility.ToggleButtonAccImpl.enableAccessibility();
          spark.accessibility.SliderBaseAccImpl.enableAccessibility();
          spark.accessibility.RichEditableTextAccImpl.enableAccessibility();
          mx.accessibility.DateChooserAccImpl.enableAccessibility();
          mx.accessibility.ComboBaseAccImpl.enableAccessibility();
       }
       // mx.collections.ArrayCollection
       try 
       { 
           if (flash.net.getClassByAlias("flex.messaging.io.ArrayCollection") != mx.collections.ArrayCollection) 
           { 
               flash.net.registerClassAlias("flex.messaging.io.ArrayCollection", mx.collections.ArrayCollection); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.collections.ArrayCollection","kuraraysaijo.view:Client","_Client_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("flex.messaging.io.ArrayCollection", mx.collections.ArrayCollection); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.collections.ArrayCollection","kuraraysaijo.view:Client","_Client_FlexInit"]));
           } 
       } 

       // mx.collections.ArrayList
       try 
       { 
           if (flash.net.getClassByAlias("flex.messaging.io.ArrayList") != mx.collections.ArrayList) 
           { 
               flash.net.registerClassAlias("flex.messaging.io.ArrayList", mx.collections.ArrayList); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.collections.ArrayList","kuraraysaijo.view:Client","_Client_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("flex.messaging.io.ArrayList", mx.collections.ArrayList); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.collections.ArrayList","kuraraysaijo.view:Client","_Client_FlexInit"]));
           } 
       } 

       // mx.utils.ObjectProxy
       try 
       { 
           if (flash.net.getClassByAlias("flex.messaging.io.ObjectProxy") != mx.utils.ObjectProxy) 
           { 
               flash.net.registerClassAlias("flex.messaging.io.ObjectProxy", mx.utils.ObjectProxy); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.utils.ObjectProxy","kuraraysaijo.view:Client","_Client_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("flex.messaging.io.ObjectProxy", mx.utils.ObjectProxy); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.utils.ObjectProxy","kuraraysaijo.view:Client","_Client_FlexInit"]));
           } 
       } 

       var styleNames:Array = ["paragraphStartIndent", "breakOpportunity", "kerning", "alternatingItemColors", "wordSpacing", "leading", "fontAntiAliasType", "selectionColor", "containerBreakBefore", "cffHinting", "contentBackgroundAlpha", "fontFamily", "digitCase", "containerBreakAfter", "textSelectedColor", "clearFloats", "paragraphEndIndent", "layoutDirection", "ligatureLevel", "disabledIconColor", "downColor", "dropShadowColor", "fontWeight", "interactionMode", "dominantBaseline", "textAlign", "accentColor", "justificationStyle", "fontSharpness", "todayColor", "whiteSpaceCollapse", "headerColors", "contentBackgroundColor", "textDecoration", "fontLookup", "fontStyle", "columnBreakAfter", "chromeColor", "digitWidth", "focusColor", "themeColor", "listAutoPadding", "blockProgression", "showPromptWhenFocused", "listStyleType", "fontSize", "textRollOverColor", "columnBreakBefore", "textAlignLast", "trackingRight", "fontGridFitType", "paragraphSpaceAfter", "showErrorSkin", "errorColor", "justificationRule", "color", "backgroundDisabledColor", "textShadowColor", "unfocusedTextSelectionColor", "paragraphSpaceBefore", "textIndent", "textAlpha", "locale", "baselineShift", "barColor", "fontThickness", "touchDelay", "textShadowAlpha", "renderingMode", "textJustify", "textRotation", "tabStops", "direction", "firstBaselineOffset", "lineThrough", "symbolColor", "focusedTextSelectionColor", "letterSpacing", "disabledColor", "alignmentBaseline", "trackingLeft", "modalTransparencyColor", "rollOverColor", "listStylePosition", "modalTransparencyBlur", "modalTransparencyDuration", "modalTransparency", "iconColor", "inactiveTextSelectionColor", "lineHeight", "leadingModel", "showErrorTip", "typographicCase"];

       for (var i:int = 0; i < styleNames.length; i++)
       {
          styleManager.registerInheritingStyle(styleNames[i]);
       }
   }
}  // FlexInit
}  // package
