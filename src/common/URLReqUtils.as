package common
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLVariables;
	import flash.net.FileReference;
	import flash.utils.ByteArray;

	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;

	public class URLReqUtils
	{
		public static const COMPLETE:String       = 'complete';
		public static const EXCEPTION:String      = 'exception';
		public static const PROGRESS:String       = 'progress';
		public static const HTTP_STATUS:String    = 'http status';
		public static const IO_ERROR:String       = 'io error';
		public static const SECURITY_ERROR:String = 'security error';
		public static const ERROR:String          = 'error';

		// URLリクエスト
		public static function request(req:URLRequest,eventFnc:Function,df:String=URLLoaderDataFormat.TEXT):void
		{
			var urlLoader:URLLoader;

			if( req == null )
			{
				callEvent(ERROR,null);
				return;
			}

			urlLoader = new URLLoader();
			urlLoader.dataFormat = df;
			urlLoader.addEventListener(Event.COMPLETE, compHandler);
			urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			urlLoader.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			try
			{
				urlLoader.load(req);
			}
			catch (error:Error)
			{
				callEvent(EXCEPTION,error);
			}

			// 完了
			function compHandler(e:Event):void
			{
				callEvent(COMPLETE,e);
			}

			// HTTPステータス
			function httpStatusHandler(e:HTTPStatusEvent):void
			{
				callEvent(HTTP_STATUS,e);
			}

			// プログレスイベント
			function progressHandler(e:ProgressEvent):void
			{
				callEvent(PROGRESS,e);
			}

			// IOエラー
			function ioErrorHandler(e:Event):void
			{
				callEvent(IO_ERROR,e);
			}

			// セキュリティエラー
			function securityErrorHandler(e:SecurityErrorEvent):void
			{
				callEvent(SECURITY_ERROR,e);
			}

			// イベント通知
			function callEvent(res:String,param:Object):void
			{
				if( eventFnc != null )
				{
					eventFnc.call(null,res,param);
				}
			}
		}

		// ProgressEventパーセント取得
		public static function getPercent(e:ProgressEvent):uint
		{
			if( e != null )
			{
				return Math.floor(e.target.bytesLoaded / e.target.bytesTotal * 100);
			}
			return 0;
		}
	}
}