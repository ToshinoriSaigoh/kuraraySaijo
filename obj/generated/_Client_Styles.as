

package 
{

import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.styles.CSSCondition;
import mx.styles.CSSSelector;
import mx.styles.CSSStyleDeclaration;
import mx.styles.IStyleManager2;
import mx.utils.ObjectUtil;
import spark.skins.spark.FocusSkin;
import mx.skins.spark.ScrollBarThumbSkin;
import spark.skins.spark.ApplicationSkin;
import mx.skins.spark.DateChooserNextMonthSkin;
import spark.skins.spark.VScrollBarSkin;
import spark.skins.spark.WindowedApplicationSkin;
import mx.skins.spark.DateChooserRollOverIndicatorSkin;
import mx.skins.spark.DateChooserNextYearSkin;
import mx.skins.spark.DateChooserSelectionIndicatorSkin;
import spark.skins.spark.windowChrome.TitleBarSkin;
import mx.skins.spark.ScrollBarTrackSkin;
import mx.skins.spark.ButtonSkin;
import mx.core.UITextField;
import mx.skins.spark.TextInputBorderSkin;
import spark.skins.spark.DropDownListSkin;
import mx.skins.halo.DefaultDragImage;
import spark.skins.spark.SkinnableDataContainerSkin;
import spark.skins.spark.ErrorSkin;
import mx.skins.halo.HaloFocusRect;
import spark.skins.spark.SkinnableContainerSkin;
import spark.skins.spark.DefaultButtonSkin;
import spark.skins.spark.HSliderSkin;
import mx.skins.spark.BorderSkin;
import mx.skins.halo.ToolTipBorder;
import spark.skins.spark.TextAreaSkin;
import mx.skins.spark.ContainerBorderSkin;
import mx.skins.spark.ScrollBarDownButtonSkin;
import spark.skins.spark.ButtonBarSkin;
import mx.skins.spark.DateChooserTodayIndicatorSkin;
import spark.skins.spark.HScrollBarSkin;
import spark.components.supportClasses.ListItemDragProxy;
import spark.skins.spark.ToggleButtonSkin;
import mx.skins.spark.DefaultButtonSkin;
import spark.skins.spark.ButtonSkin;
import mx.skins.halo.BusyCursor;
import mx.skins.spark.DateChooserPrevMonthSkin;
import mx.skins.spark.ScrollBarUpButtonSkin;
import mx.skins.spark.DateChooserPrevYearSkin;
import spark.skins.spark.ListDropIndicator;
import spark.skins.spark.ScrollerSkin;
import spark.skins.spark.ListSkin;
[ExcludeClass]

public class _Client_Styles
{
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='win_restore_over.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_restore_over.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_restore_over.png', _line='282')]
    private static var _embed_css_win_restore_over_png__933523429_1154503749:Class;
    [Embed(symbol='mx.skins.cursor.BusyCursor', _file='F:/FlexSDK/32.0.0.116/frameworks/libs/framework.swc$defaults.css', original='Assets.swf', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/framework.swc$Assets.swf', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/framework.swc$Assets.swf', _line='200')]
    private static var _embed_css_Assets_swf__16341394_mx_skins_cursor_BusyCursor_617880427:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='win_close_over.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_close_over.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_close_over.png', _line='173')]
    private static var _embed_css_win_close_over_png__858890575_1858305931:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='win_max_up.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_max_up.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_max_up.png', _line='253')]
    private static var _embed_css_win_max_up_png__2133131444_1461605498:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='win_restore_down.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_restore_down.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_restore_down.png', _line='283')]
    private static var _embed_css_win_restore_down_png__35528471_49111987:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/mx/mx.swc$defaults.css', original='assets/CalendarIcon.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/framework.swc$assets/CalendarIcon.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/framework.swc$assets/CalendarIcon.png', _line='476')]
    private static var _embed_css_assets_CalendarIcon_png__703211929_1441430240:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='win_max_dis.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_max_dis.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_max_dis.png', _line='256')]
    private static var _embed_css_win_max_dis_png_251096211_502176221:Class;
    [Embed(symbol='mx.skins.cursor.DragCopy', _file='F:/FlexSDK/32.0.0.116/frameworks/libs/mx/mx.swc$defaults.css', original='Assets.swf', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$Assets.swf', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$Assets.swf', _line='521')]
    private static var _embed_css_Assets_swf_1698368815_mx_skins_cursor_DragCopy_736453077:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='mac_min_dis.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_min_dis.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_min_dis.png', _line='132')]
    private static var _embed_css_mac_min_dis_png_359982196_478924242:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='win_min_up.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_min_up.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_min_up.png', _line='267')]
    private static var _embed_css_win_min_up_png_338867870_1307173816:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='win_close_up.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_close_up.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_close_up.png', _line='174')]
    private static var _embed_css_win_close_up_png_1164817784_770828194:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='win_restore_up.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_restore_up.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_restore_up.png', _line='281')]
    private static var _embed_css_win_restore_up_png_244070754_1249777380:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='mac_min_down.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_min_down.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_min_down.png', _line='133')]
    private static var _embed_css_mac_min_down_png__523741038_1163917332:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='mac_close_down.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_close_down.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_close_down.png', _line='104')]
    private static var _embed_css_mac_close_down_png_504258988_435950490:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='win_min_over.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_min_over.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_min_over.png', _line='268')]
    private static var _embed_css_win_min_over_png__27808169_1924915551:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='win_close_down.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_close_down.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_close_down.png', _line='172')]
    private static var _embed_css_win_close_down_png_39104383_1728275559:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='mac_close_over.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_close_over.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_close_over.png', _line='105')]
    private static var _embed_css_mac_close_over_png__393735970_1148395016:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='win_min_dis.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_min_dis.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_min_dis.png', _line='270')]
    private static var _embed_css_win_min_dis_png__426336383_682818965:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='win_min_down.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_min_down.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_min_down.png', _line='269')]
    private static var _embed_css_win_min_down_png_870186789_876499761:Class;
    [Embed(symbol='mx.skins.cursor.DragMove', _file='F:/FlexSDK/32.0.0.116/frameworks/libs/mx/mx.swc$defaults.css', original='Assets.swf', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$Assets.swf', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$Assets.swf', _line='524')]
    private static var _embed_css_Assets_swf_1698368815_mx_skins_cursor_DragMove_736740657:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='mac_max_over.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_max_over.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_max_over.png', _line='119')]
    private static var _embed_css_mac_max_over_png__1896162062_2091549644:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='win_max_down.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_max_down.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_max_down.png', _line='255')]
    private static var _embed_css_win_max_down_png_395760723_460940115:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='gripper_up.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$gripper_up.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$gripper_up.png', _line='79')]
    private static var _embed_css_gripper_up_png_1090012674_1755788348:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='mac_min_over.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_min_over.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_min_over.png', _line='134')]
    private static var _embed_css_mac_min_over_png__1421735996_1753706734:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='mac_max_up.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_max_up.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_max_up.png', _line='120')]
    private static var _embed_css_mac_max_up_png__445198343_1008580387:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='win_max_over.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_max_over.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$win_max_over.png', _line='254')]
    private static var _embed_css_win_max_over_png__502234235_1040710481:Class;
    [Embed(symbol='mx.skins.cursor.DragReject', _file='F:/FlexSDK/32.0.0.116/frameworks/libs/mx/mx.swc$defaults.css', original='Assets.swf', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$Assets.swf', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$Assets.swf', _line='525')]
    private static var _embed_css_Assets_swf_1698368815_mx_skins_cursor_DragReject_750799457:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='mac_max_down.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_max_down.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_max_down.png', _line='118')]
    private static var _embed_css_mac_max_down_png__998167104_1346003206:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='mac_min_up.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_min_up.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_min_up.png', _line='135')]
    private static var _embed_css_mac_min_up_png_2026800971_2136673387:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='mac_close_up.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_close_up.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_close_up.png', _line='106')]
    private static var _embed_css_mac_close_up_png__229110043_1900903823:Class;
    [Embed(_file='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$defaults.css', original='mac_max_dis.png', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_max_dis.png', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$mac_max_dis.png', _line='117')]
    private static var _embed_css_mac_max_dis_png_1037414790_1804350560:Class;
    [Embed(symbol='mx.skins.cursor.DragLink', _file='F:/FlexSDK/32.0.0.116/frameworks/libs/mx/mx.swc$defaults.css', original='Assets.swf', _resolvedSource='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$Assets.swf', _pathsep='true', source='F:/FlexSDK/32.0.0.116/frameworks/libs/air/airframework.swc$Assets.swf', _line='523')]
    private static var _embed_css_Assets_swf_1698368815_mx_skins_cursor_DragLink_736715082:Class;
    public static function init(fbs:IFlexModuleFactory):void
    {
        var styleManager:IStyleManager2 = fbs.getImplementation("mx.styles::IStyleManager2") as IStyleManager2;
        

        var conditions:Array = null;
        var condition:CSSCondition = null;
        var selector:CSSSelector = null;
        var style:CSSStyleDeclaration;
        var effects:Array;
        
        var mergedStyle:CSSStyleDeclaration;

        
        //
        // spark.components.windowClasses.TitleBar
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.windowClasses.TitleBar", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.windowClasses.TitleBar");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.skinClass = spark.skins.spark.windowChrome.TitleBarSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.Window
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.Window", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Window");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.backgroundColor = 0xffffff;
                this.resizeAffordanceWidth = 6;
                this.backgroundAlpha = 1;
                this.skinClass = spark.skins.spark.WindowedApplicationSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // global
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("global", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("global");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.paragraphStartIndent = 0;
                this.shadowDistance = 2;
                this.breakOpportunity = "auto";
                this.kerning = "default";
                this.selectionDuration = 250;
                this.leading = 2;
                this.paddingRight = 0;
                this.rollOverOpenDelay = 200;
                this.liveDragging = true;
                this.slideDuration = 300;
                this.iconPlacement = "left";
                this.textFieldClass = mx.core.UITextField;
                this.layoutDirection = "ltr";
                this.borderStyle = "inset";
                this.ligatureLevel = "common";
                this.repeatDelay = 500;
                this.dropShadowColor = 0x000000;
                this.shadowColor = 0xeeeeee;
                this.verticalAlign = "top";
                this.interactionMode = "mouse";
                this.dominantBaseline = "auto";
                this.focusAlpha = 0.55;
                this.fontSharpness = 0;
                this.justificationStyle = "auto";
                this.whiteSpaceCollapse = "collapse";
                this.textDecoration = "none";
                this.fontStyle = "normal";
                this.shadowDirection = "center";
                this.version = "4.0.0";
                this.horizontalScrollPolicy = "auto";
                this.digitWidth = "default";
                this.indicatorGap = 14;
                this.lineBreak = "toFit";
                this.borderCapColor = 0x919999;
                this.focusColor = 0x70b2ee;
                this.themeColor = 0x70b2ee;
                this.fontSize = 12;
                this.textAlignLast = "start";
                this.paddingLeft = 0;
                this.selectionDisabledColor = 0xdddddd;
                this.trackingRight = 0;
                this.smoothScrolling = true;
                this.showErrorSkin = true;
                this.useRollOver = true;
                this.unfocusedTextSelectionColor = 0xe8e8e8;
                this.backgroundAlpha = 1.0;
                this.baselineShift = 0;
                this.textAlpha = 1.0;
                this.verticalGap = 6;
                this.closeDuration = 50;
                this.disabledAlpha = 0.5;
                this.fillColor = 0xffffff;
                this.roundedBottomCorners = true;
                this.highlightAlphas = [0.3, 0];
                this.horizontalAlign = "left";
                this.verticalGridLines = true;
                this.textRotation = "auto";
                this.dropShadowVisible = false;
                this.backgroundSize = "auto";
                this.horizontalGridLines = false;
                this.tabStops = null;
                this.softKeyboardEffectDuration = 150;
                this.firstBaselineOffset = "auto";
                this.focusRoundedCorners = "tl tr bl br";
                this.lineThrough = false;
                this.focusSkin = mx.skins.halo.HaloFocusRect;
                this.focusedTextSelectionColor = 0xa8c6ee;
                this.symbolColor = 0x000000;
                this.borderAlpha = 1.0;
                this.filled = true;
                this.openDuration = 1;
                this.disabledColor = 0xaab3b3;
                this.alignmentBaseline = "useDominantBaseline";
                this.modalTransparencyColor = 0xdddddd;
                this.embedFonts = false;
                this.modalTransparencyDuration = 100;
                this.modalTransparency = 0.5;
                this.backgroundImageFillMode = "scale";
                this.lineHeight = "120%";
                this.typographicCase = "default";
                this.borderColor = 0x696969;
                this.fontAntiAliasType = "advanced";
                this.selectionColor = 0xa8c6ee;
                this.cffHinting = "horizontalStem";
                this.contentBackgroundAlpha = 1;
                this.cornerRadius = 2;
                this.borderThickness = 1;
                this.fontFamily = "Arial";
                this.indentation = 17;
                this.paddingBottom = 0;
                this.digitCase = "default";
                this.repeatInterval = 35;
                this.textSelectedColor = 0;
                this.paragraphEndIndent = 0;
                this.disabledIconColor = 0x999999;
                this.fontWeight = "normal";
                this.borderVisible = true;
                this.focusBlendMode = "normal";
                this.textAlign = "start";
                this.accentColor = 0x0099ff;
                this.shadowCapColor = 0xd5dddd;
                this.contentBackgroundColor = 0xffffff;
                this.fontLookup = "embeddedCFF";
                this.chromeColor = 0xcccccc;
                this.columnGap = 20;
                this.focusThickness = 2;
                this.verticalGridLineColor = 0xd5dddd;
                this.blockProgression = "tb";
                this.textRollOverColor = 0;
                this.fillAlphas = [0.6, 0.4, 0.75, 0.65];
                this.horizontalGridLineColor = 0xf7f7f7;
                this.strokeWidth = 1;
                this.fontGridFitType = "pixel";
                this.errorColor = 0xfe0000;
                this.paragraphSpaceAfter = 0;
                this.justificationRule = "auto";
                this.borderSides = "left top right bottom";
                this.color = 0x000000;
                this.buttonColor = 0x6f7777;
                this.fillColors = [0xffffff, 0xcccccc, 0xffffff, 0xeeeeee];
                this.paragraphSpaceBefore = 0;
                this.locale = "en";
                this.textIndent = 0;
                this.fontThickness = 0;
                this.renderingMode = "cff";
                this.textJustify = "interWord";
                this.fullScreenHideControlsDelay = 3000;
                this.columnWidth = "auto";
                this.paddingTop = 0;
                this.direction = "ltr";
                this.fixedThumbSize = false;
                this.caretColor = 0x0167ff;
                this.letterSpacing = 0;
                this.borderWeight = 1;
                this.columnCount = "auto";
                this.bevel = true;
                this.verticalScrollPolicy = "auto";
                this.trackingLeft = 0;
                this.horizontalGap = 8;
                this.rollOverColor = 0xcedbef;
                this.modalTransparencyBlur = 3;
                this.stroked = false;
                this.iconColor = 0x111111;
                this.inactiveTextSelectionColor = 0xe8e8e8;
                this.leadingModel = "auto";
                this.showErrorTip = true;
                this.autoThumbVisibility = true;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .errorTip
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "errorTip");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".errorTip");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.borderColor = 0xce2929;
                this.paddingBottom = 4;
                this.color = 0xffffff;
                this.paddingRight = 4;
                this.fontSize = 10;
                this.paddingTop = 4;
                this.borderStyle = "errorTipRight";
                this.shadowColor = 0x000000;
                this.paddingLeft = 4;
                this.fontWeight = "bold";
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .headerDragProxyStyle
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "headerDragProxyStyle");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".headerDragProxyStyle");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.fontWeight = "bold";
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .dateFieldPopup
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "dateFieldPopup");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".dateFieldPopup");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.borderThickness = 1;
                this.backgroundColor = 0xffffff;
                this.dropShadowVisible = true;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .swatchPanelTextField
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "swatchPanelTextField");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".swatchPanelTextField");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.highlightColor = 0xc4cccc;
                this.backgroundColor = 0xffffff;
                this.borderColor = 0xd5dddd;
                this.borderCapColor = 0x919999;
                this.buttonColor = 0x6f7777;
                this.shadowCapColor = 0xd5dddd;
                this.paddingRight = 5;
                this.borderStyle = "inset";
                this.paddingLeft = 5;
                this.shadowColor = 0xd5dddd;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .todayStyle
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "todayStyle");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".todayStyle");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.color = 0;
                this.textAlign = "center";
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .weekDayStyle
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "weekDayStyle");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".weekDayStyle");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.textAlign = "center";
                this.fontWeight = "bold";
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .windowStatus
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "windowStatus");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".windowStatus");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.color = 0x666666;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .windowStyles
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "windowStyles");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".windowStyles");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.fontWeight = "bold";
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .gripperSkin
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "gripperSkin");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".gripperSkin");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.downSkin = _embed_css_gripper_up_png_1090012674_1755788348;
                this.upSkin = _embed_css_gripper_up_png_1090012674_1755788348;
                this.overSkin = _embed_css_gripper_up_png_1090012674_1755788348;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .macCloseButton
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "macCloseButton");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".macCloseButton");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.downSkin = _embed_css_mac_close_down_png_504258988_435950490;
                this.upSkin = _embed_css_mac_close_up_png__229110043_1900903823;
                this.overSkin = _embed_css_mac_close_over_png__393735970_1148395016;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .macMaxButton
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "macMaxButton");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".macMaxButton");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.downSkin = _embed_css_mac_max_down_png__998167104_1346003206;
                this.upSkin = _embed_css_mac_max_up_png__445198343_1008580387;
                this.overSkin = _embed_css_mac_max_over_png__1896162062_2091549644;
                this.disabledSkin = _embed_css_mac_max_dis_png_1037414790_1804350560;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .macMinButton
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "macMinButton");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".macMinButton");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.downSkin = _embed_css_mac_min_down_png__523741038_1163917332;
                this.upSkin = _embed_css_mac_min_up_png_2026800971_2136673387;
                this.alpha = 0.5;
                this.overSkin = _embed_css_mac_min_over_png__1421735996_1753706734;
                this.disabledSkin = _embed_css_mac_min_dis_png_359982196_478924242;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .statusTextStyle
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "statusTextStyle");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".statusTextStyle");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.color = 0x585858;
                this.alpha = 0.6;
                this.fontSize = 10;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .titleTextStyle
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "titleTextStyle");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".titleTextStyle");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.color = 0x585858;
                this.alpha = 0.6;
                this.fontSize = 9;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .winCloseButton
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "winCloseButton");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".winCloseButton");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.downSkin = _embed_css_win_close_down_png_39104383_1728275559;
                this.upSkin = _embed_css_win_close_up_png_1164817784_770828194;
                this.overSkin = _embed_css_win_close_over_png__858890575_1858305931;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .winMaxButton
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "winMaxButton");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".winMaxButton");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.upSkin = _embed_css_win_max_up_png__2133131444_1461605498;
                this.downSkin = _embed_css_win_max_down_png_395760723_460940115;
                this.overSkin = _embed_css_win_max_over_png__502234235_1040710481;
                this.disabledSkin = _embed_css_win_max_dis_png_251096211_502176221;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .winMinButton
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "winMinButton");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".winMinButton");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.upSkin = _embed_css_win_min_up_png_338867870_1307173816;
                this.downSkin = _embed_css_win_min_down_png_870186789_876499761;
                this.overSkin = _embed_css_win_min_over_png__27808169_1924915551;
                this.disabledSkin = _embed_css_win_min_dis_png__426336383_682818965;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // .winRestoreButton
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "winRestoreButton");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration(".winRestoreButton");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.upSkin = _embed_css_win_restore_up_png_244070754_1249777380;
                this.downSkin = _embed_css_win_restore_down_png__35528471_49111987;
                this.overSkin = _embed_css_win_restore_over_png__933523429_1154503749;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // mx.managers.CursorManager
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.managers.CursorManager", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("mx.managers.CursorManager");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.busyCursor = mx.skins.halo.BusyCursor;
                this.busyCursorBackground = _embed_css_Assets_swf__16341394_mx_skins_cursor_BusyCursor_617880427;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // mx.managers.DragManager
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.managers.DragManager", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("mx.managers.DragManager");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.linkCursor = _embed_css_Assets_swf_1698368815_mx_skins_cursor_DragLink_736715082;
                this.rejectCursor = _embed_css_Assets_swf_1698368815_mx_skins_cursor_DragReject_750799457;
                this.copyCursor = _embed_css_Assets_swf_1698368815_mx_skins_cursor_DragCopy_736453077;
                this.moveCursor = _embed_css_Assets_swf_1698368815_mx_skins_cursor_DragMove_736740657;
                this.defaultDragImageSkin = mx.skins.halo.DefaultDragImage;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // mx.controls.ToolTip
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.ToolTip", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.ToolTip");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.backgroundColor = 0xffffcc;
                this.borderColor = 0x919999;
                this.paddingBottom = 2;
                this.paddingRight = 4;
                this.backgroundAlpha = 0.95;
                this.fontSize = 10;
                this.paddingTop = 2;
                this.borderSkin = mx.skins.halo.ToolTipBorder;
                this.borderStyle = "toolTip";
                this.paddingLeft = 4;
                this.cornerRadius = 2;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.Application
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.Application", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Application");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.backgroundColor = 0xffffff;
                this.skinClass = spark.skins.spark.ApplicationSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.Button
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.Button", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Button");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.skinClass = spark.skins.spark.ButtonSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // spark.components.Button.emphasized
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "emphasized");
        conditions.push(condition); 
        selector = new CSSSelector("spark.components.Button", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Button.emphasized");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.skinClass = spark.skins.spark.DefaultButtonSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.ButtonBar
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.ButtonBar", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.ButtonBar");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.skinClass = spark.skins.spark.ButtonBarSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.DropDownList
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.DropDownList", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.DropDownList");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.dropShadowVisible = true;
                this.skinClass = spark.skins.spark.DropDownListSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.HScrollBar
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.HScrollBar", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.HScrollBar");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.skinClass = spark.skins.spark.HScrollBarSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.HSlider
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.HSlider", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.HSlider");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.skinClass = spark.skins.spark.HSliderSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.List
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.List", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.List");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.dropIndicatorSkin = spark.skins.spark.ListDropIndicator;
                this.skinClass = spark.skins.spark.ListSkin;
                this.dragIndicatorClass = spark.components.supportClasses.ListItemDragProxy;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.RichEditableText
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.RichEditableText", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.RichEditableText");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.layoutDirection = "ltr";
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.Scroller
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.Scroller", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Scroller");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.skinClass = spark.skins.spark.ScrollerSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.SkinnableDataContainer
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.SkinnableDataContainer", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.SkinnableDataContainer");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.skinClass = spark.skins.spark.SkinnableDataContainerSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.supportClasses.SkinnableComponent
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.supportClasses.SkinnableComponent", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.supportClasses.SkinnableComponent");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.errorSkin = spark.skins.spark.ErrorSkin;
                this.focusSkin = spark.skins.spark.FocusSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.SkinnableContainer
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.SkinnableContainer", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.SkinnableContainer");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.skinClass = spark.skins.spark.SkinnableContainerSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.supportClasses.SkinnableTextBase:normalWithPrompt
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("pseudo", "normalWithPrompt");
        conditions.push(condition); 
        selector = new CSSSelector("spark.components.supportClasses.SkinnableTextBase", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.supportClasses.SkinnableTextBase:normalWithPrompt");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.color = 0xbababa;
                this.fontStyle = "italic";
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }

        //
        // spark.components.supportClasses.SkinnableTextBase:disabledWithPrompt
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("pseudo", "disabledWithPrompt");
        conditions.push(condition); 
        selector = new CSSSelector("spark.components.supportClasses.SkinnableTextBase", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.supportClasses.SkinnableTextBase:disabledWithPrompt");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.color = 0xbababa;
                this.fontStyle = "italic";
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.supportClasses.TextBase
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.supportClasses.TextBase", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.supportClasses.TextBase");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.layoutDirection = "ltr";
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.TextArea
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.TextArea", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.TextArea");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.paddingBottom = 3;
                this.paddingRight = 3;
                this.skinClass = spark.skins.spark.TextAreaSkin;
                this.paddingTop = 5;
                this.paddingLeft = 3;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.ToggleButton
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.ToggleButton", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.ToggleButton");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.skinClass = spark.skins.spark.ToggleButtonSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // spark.components.VScrollBar
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("spark.components.VScrollBar", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.VScrollBar");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.skinClass = spark.skins.spark.VScrollBarSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // mx.core.Application
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.core.Application", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("mx.core.Application");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.backgroundColor = 0xffffff;
                this.paddingBottom = 24;
                this.horizontalAlign = "center";
                this.paddingRight = 24;
                this.paddingTop = 24;
                this.paddingLeft = 24;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // mx.controls.Button
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.Button", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.Button");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.horizontalGap = 2;
                this.textAlign = "center";
                this.paddingRight = 6;
                this.skin = mx.skins.spark.ButtonSkin;
                this.labelVerticalOffset = 1;
                this.verticalGap = 2;
                this.paddingLeft = 6;
                this.emphasizedSkin = mx.skins.spark.DefaultButtonSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // mx.controls.CalendarLayout
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.CalendarLayout", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.CalendarLayout");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.horizontalGap = 7;
                this.paddingBottom = 10;
                this.textAlign = "center";
                this.todayColor = 0x818181;
                this.paddingRight = 6;
                this.paddingTop = 6;
                this.verticalGap = 6;
                this.paddingLeft = 6;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // mx.controls.ComboBase
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.ComboBase", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.ComboBase");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.borderSkin = mx.skins.spark.BorderSkin;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // mx.core.Container
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.core.Container", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("mx.core.Container");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.borderSkin = mx.skins.spark.ContainerBorderSkin;
                this.borderStyle = "none";
                this.cornerRadius = 0;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // mx.controls.DateChooser
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.DateChooser", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.DateChooser");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.todayStyleName = "todayStyle";
                this.prevMonthSkin = mx.skins.spark.DateChooserPrevMonthSkin;
                this.todayIndicatorSkin = mx.skins.spark.DateChooserTodayIndicatorSkin;
                this.rollOverIndicatorSkin = mx.skins.spark.DateChooserRollOverIndicatorSkin;
                this.todayColor = 0xc6d0db;
                this.prevYearSkin = mx.skins.spark.DateChooserPrevYearSkin;
                this.borderSkin = mx.skins.spark.BorderSkin;
                this.nextMonthSkin = mx.skins.spark.DateChooserNextMonthSkin;
                this.selectionIndicatorSkin = mx.skins.spark.DateChooserSelectionIndicatorSkin;
                this.nextYearSkin = mx.skins.spark.DateChooserNextYearSkin;
                this.cornerRadius = 0;
                this.weekDayStyleName = "weekDayStyle";
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // mx.controls.DateField
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.DateField", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.DateField");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.downSkin = _embed_css_assets_CalendarIcon_png__703211929_1441430240;
                this.upSkin = _embed_css_assets_CalendarIcon_png__703211929_1441430240;
                this.overSkin = _embed_css_assets_CalendarIcon_png__703211929_1441430240;
                this.dateChooserStyleName = "dateFieldPopup";
                this.disabledSkin = _embed_css_assets_CalendarIcon_png__703211929_1441430240;
                this.cornerRadius = 0;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // mx.controls.scrollClasses.ScrollBar
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.scrollClasses.ScrollBar", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.scrollClasses.ScrollBar");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.thumbSkin = mx.skins.spark.ScrollBarThumbSkin;
                this.paddingBottom = 0;
                this.thumbOffset = 0;
                this.paddingRight = 0;
                this.trackSkin = mx.skins.spark.ScrollBarTrackSkin;
                this.downArrowSkin = mx.skins.spark.ScrollBarDownButtonSkin;
                this.upArrowSkin = mx.skins.spark.ScrollBarUpButtonSkin;
                this.paddingTop = 0;
                this.paddingLeft = 0;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // mx.controls.HScrollBar.textAreaVScrollBarStyle
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "textAreaVScrollBarStyle");
        conditions.push(condition); 
        selector = new CSSSelector("mx.controls.HScrollBar", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.HScrollBar.textAreaVScrollBarStyle");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // mx.controls.VScrollBar.textAreaHScrollBarStyle
        //
        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "textAreaHScrollBarStyle");
        conditions.push(condition); 
        selector = new CSSSelector("mx.controls.VScrollBar", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.VScrollBar.textAreaHScrollBarStyle");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }



        
        //
        // mx.controls.TextInput
        //
        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.TextInput", conditions, selector);
        mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.TextInput");
        style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);

        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.paddingRight = 2;
                this.paddingTop = 2;
                this.borderSkin = mx.skins.spark.TextInputBorderSkin;
                this.paddingLeft = 2;
            };
        }



        if (mergedStyle != null && 
            (mergedStyle.defaultFactory == null ||
            ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
        {
            styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
        }


    }
}

}
