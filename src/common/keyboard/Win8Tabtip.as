package common.keyboard
{
	import flash.system.Capabilities;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.net.FileFilter;
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.events.ProgressEvent;
	import flash.events.NativeProcessExitEvent;
	import flash.utils.ByteArray;
	import common.*;

	public class Win8Tabtip
	{
		public static var windowsDir: String = "C: \\Windows";
		public static function checkWindowsDir( cmpFnc: Function ): void
		{
			var result: String;
			var nativeProcess: NativeProcess;
			var info: NativeProcessStartupInfo;
			var exefile: File;
			var os: String;
			os = Capabilities.os;
			if( os.indexOf( "Windows" ) >= 0 )
			{
				if ( NativeProcess.isSupported )
				{
					exefile = File.applicationDirectory.resolvePath( "winsystemdir.exe" );
					if( exefile.exists )
					{
						info = new NativeProcessStartupInfo();
						info.executable = exefile;
						nativeProcess = new NativeProcess();
						nativeProcess.addEventListener( ProgressEvent.STANDARD_OUTPUT_DATA, outputDataHandler );
						nativeProcess.addEventListener( ProgressEvent.STANDARD_INPUT_PROGRESS, inputProgressHandler );
						nativeProcess.addEventListener( ProgressEvent.STANDARD_ERROR_DATA, errorHandler );
						nativeProcess.addEventListener( NativeProcessExitEvent.EXIT, exitHandler );
						nativeProcess.start( info );
					}
				}
			}

			//標準出力時のイベント
			function outputDataHandler ( event: ProgressEvent ): void
			{
				var txt: String;
				var bytes: ByteArray;
				bytes = new ByteArray();
				nativeProcess.standardOutput.readBytes( bytes, 0, nativeProcess.standardOutput.bytesAvailable );
				if( bytes.length > 0 )
				{
					txt = bytes.readMultiByte( bytes.length, "shift-jis" );
				}

				if( txt != null )
				{
					if( result == null )
					{
						result = new String();
					}
					result += txt;
				}
			}

			//標準入力時のイベント
			function inputProgressHandler( e: ProgressEvent ): void
			{
			}

			//エラー時のイベント
			function errorHandler( e: ProgressEvent ): void
			{
			}

			//NativeProcess終了時のイベント
			function exitHandler( e: NativeProcessExitEvent ): void
			{
				result = CommonUtils.stripReturnCode( result );
				result = CommonUtils.trimSpaceAndTabString( result );
				windowsDir = result;
				if( cmpFnc != null )
				{
					cmpFnc.call( null, result );
				}
			}
		}

		public static function checkMode( cmpFnc: Function ): void
		{
			var result: String;
			var nativeProcess: NativeProcess;
			var info: NativeProcessStartupInfo;
			var exefile: File;
			var batfile: File;
			var os: String;
			os = Capabilities.os;
			if( os.indexOf( "Windows" ) >= 0 )
			{
				if ( NativeProcess.isSupported )
				{
					exefile = new File( windowsDir + "\\SYSTEM32\\cmd.exe" );
					batfile = File.applicationDirectory.resolvePath( "tabletmode.bat" );
					if( exefile.exists )
					{
						var args: Vector.<String> = new Vector.<String>();
						args.push( "/c" );
						args.push( batfile.nativePath );

						info = new NativeProcessStartupInfo();
						info.executable = exefile;
						info.arguments = args;
						nativeProcess = new NativeProcess();
						nativeProcess.addEventListener( ProgressEvent.STANDARD_OUTPUT_DATA, outputDataHandler );
						nativeProcess.addEventListener( ProgressEvent.STANDARD_INPUT_PROGRESS, inputProgressHandler );
						nativeProcess.addEventListener( ProgressEvent.STANDARD_ERROR_DATA, errorHandler );
						nativeProcess.addEventListener( NativeProcessExitEvent.EXIT, exitHandler );
						nativeProcess.start( info );
						return;
					}
				}
			}
			if( cmpFnc != null )
			{
				cmpFnc.call( null, false );
			}

			//標準出力時のイベント
			function outputDataHandler ( event: ProgressEvent ): void
			{
				var txt: String;
				var bytes: ByteArray;
				bytes = new ByteArray();
				nativeProcess.standardOutput.readBytes( bytes, 0, nativeProcess.standardOutput.bytesAvailable );
				if( bytes.length > 0 )
				{
					txt = bytes.readMultiByte( bytes.length, "shift-jis" );
				}

				if( txt != null )
				{
					if( result == null )
					{
						result = new String();
					}
					result += txt;
				}
			}

			//標準入力時のイベント
			function inputProgressHandler( e: ProgressEvent ): void
			{
			}

			//エラー時のイベント
			function errorHandler( e: ProgressEvent ): void
			{
			}

			//NativeProcess終了時のイベント
			function exitHandler( e: NativeProcessExitEvent ): void
			{
				var flag: Boolean = false;
				var value: uint;
				result = CommonUtils.stripReturnCode( result );
				result = CommonUtils.trimSpaceAndTabString( result );
				if( CommonUtils.isEmptyString( result ) == false )
				{
					value = uint( result );
					if( value != 0 ) flag = true;
				}
				if( cmpFnc != null )
				{
					cmpFnc.call( null, flag );
				}
			}
		}

		public static function kick(): void
		{
			var nativeProcess: NativeProcess;
			var info: NativeProcessStartupInfo;
			var exefile: File;
			var os: String;
			os = Capabilities.os;
			if( os.indexOf( "Windows" ) >= 0 )
			{
				if ( NativeProcess.isSupported )
				{
					exefile = File.applicationDirectory.resolvePath( "tabtipOpen.exe" );
					if( exefile.exists )
					{
						info = new NativeProcessStartupInfo();
						info.executable = exefile;
						nativeProcess = new NativeProcess();
						nativeProcess.addEventListener( ProgressEvent.STANDARD_OUTPUT_DATA, outputDataHandler );
						nativeProcess.addEventListener( ProgressEvent.STANDARD_INPUT_PROGRESS, inputProgressHandler );
						nativeProcess.addEventListener( ProgressEvent.STANDARD_ERROR_DATA, errorHandler );
						nativeProcess.addEventListener( NativeProcessExitEvent.EXIT, exitHandler );
						nativeProcess.start( info );
					}
				}
			}

			//標準出力時のイベント
			function outputDataHandler ( event: ProgressEvent ): void
			{
			}

			//標準入力時のイベント
			function inputProgressHandler( e: ProgressEvent ): void
			{
			}

			//エラー時のイベント
			function errorHandler( e: ProgressEvent ): void
			{
			}

			//NativeProcess終了時のイベント
			function exitHandler( e: NativeProcessExitEvent ): void
			{
				 //Log.debug( Win8Tabtip, "EXIT CODE = " + e.exitCode);
			}
		}
	}
}
