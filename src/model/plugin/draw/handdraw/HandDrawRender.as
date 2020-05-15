package model.plugin.draw.handdraw
{
	import model.plugin.*;
	import model.plugin.draw.*;
	import model.plugin.draw.edittool.EditBox;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.BlendMode;
	import flash.display.CapsStyle;
	import flash.events.Event;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	public class HandDrawRender
	{
		private static var _now: uint;
		private static var _capsStyle: String;
		private static var _tweenArr: Array = [];
		public static function ready(drawPanel: Object, bufferVal: Object, completeFunc: Function = null): void
		{
			if(bufferVal.operation == "new")
			{
				if(!drawPanel.drawLayers.hasOwnProperty(bufferVal.layer)) return;
				var targetSprite: Sprite;
				if(bufferVal.div != null)
				{
					if(Draw.drawList[drawPanel.report.vcName].hasOwnProperty(bufferVal.div))
					{
						targetSprite = Draw.drawList[drawPanel.report.vcName][bufferVal.div].box;
					}
					else
					{
						//targetSprite = drawPanel.drawLayers[bufferVal.layer].body;
						if(completeFunc != null) completeFunc.call();
						return;
					}
				}
				else
				{
					targetSprite = drawPanel.drawLayers[bufferVal.layer].body;
				}


				var stroke: HandDrawStroke = new HandDrawStroke(bufferVal.option.penType, bufferVal.option.lineType, bufferVal.stroke[0]);
				stroke.name = bufferVal.id;
				stroke.visible = false;
				stroke.mouseEnabled = true;
				stroke.target = targetSprite;
				targetSprite.addChild(stroke);
				if(bufferVal.option.penType == "eraser")
				{
					targetSprite.blendMode = BlendMode.LAYER;
					stroke.blendMode = BlendMode.ERASE;
				}
				Draw.drawList[drawPanel.report.vcName][bufferVal.id] = stroke;
			}
			if(completeFunc != null) completeFunc.call();
		}

		public static function rendering(reportID: String, piece: Object): void
		{
			if(reportID == null || piece == null)return;//m2ok
			if(Draw.drawList.hasOwnProperty(reportID) == false) return;//m2ok
			if(Draw.drawList[reportID].hasOwnProperty(piece.id) == false) return;//m2ok
			var stroke: HandDrawStroke = Draw.drawList[reportID][piece.id];
			if(stroke == null) return;//m2ok

			if(piece.hasOwnProperty("visible"))
			{
				stroke.visible = piece.visible;
			}
			else if(stroke.lineType == "straightLine")
			{
				stroke.visible = true;
				stroke.alpha = 1.0;
				stroke.clear();
				stroke.lineStyle(stroke.thick, stroke.lineColor, stroke.lineAlpha, false, "normal");
				stroke.moveTo(stroke.startX, stroke.startY);
				stroke.lineTo(piece.x, piece.y);
				if(piece.laser)
				{
					__laser();
				}
			}
			else
			{
				if(piece.hasOwnProperty("thick") || piece.hasOwnProperty("color") || piece.hasOwnProperty("alpha"))
				{
					stroke.visible = true;
					stroke.alpha = 1.0;
					stroke.clear();
					stroke.lineStyle(piece.thick, piece.color, stroke.lineAlpha, false, "normal");
					stroke.moveTo(piece.x, piece.y);
				}
				else
				{
					stroke.lineTo(piece.x, piece.y);
				}
				if(piece.laser)
				{
					__laser();
				}
			}

			function __laser(): void
			{
				var penTime: uint = Number(Config.get("config", "tools", "penTime"));
				var tween: Tween = new Tween(stroke as MovieClip, "alpha", Regular.easeOut, 1, 0, penTime, true);
				_tweenArr.push(tween);
				tween.addEventListener(TweenEvent.MOTION_FINISH, __finishHandler);
				/*
				if((Draw.activeDrawPanel.caller.playState == "play" || Draw.activeDrawPanel.caller.playState == "rec"))
				{
					//var transitionManager: TransitionManager = new TransitionManager(stroke as MovieClip);
					//transitionManager.startTransition({
					//	type: Fade,
					//	direction: Transition.OUT,
					//	duration: 2,
					//	easing: None.easeNone
					//});

					new Tween(stroke as MovieClip, "alpha", Regular.easeOut, 1, 0, 2.0, true);
				}
				else
				{
					_tween = stroke.visible = false;
				}
					*/
			}
			function __finishHandler(evt: TweenEvent): void
			{
				evt.target.removeEventListener(TweenEvent.MOTION_FINISH, __finishHandler);
				var myIndex: Number = _tweenArr.indexOf(evt.target);
				if(myIndex > -1)
				{
					_tweenArr.splice(myIndex, 1);
				}
			}
		}
	}
}
