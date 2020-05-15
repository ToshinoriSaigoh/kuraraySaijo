package model.plugin.network.tcp
{
	import common.*;
	import flash.events.Event;
	import flash.net.Socket;
	import flash.events.ProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;

	public class Client extends Plug
	{
		private var _socket: Socket;
		private var _host: String;
		private var _port: uint;

		private var _optionFnc: Function;

		//コンストラクタ
		public function Client(f: Function)
		{
			super();
			_optionFnc = f;
		}

		//接続
		public function connect(host: String, port: uint): Boolean
		{
			if(_socket != null) return false;
			try
			{
				_socket = new Socket();
				_socket.addEventListener(Event.CONNECT, connected, false, 0, true);
				_socket.connect(host, port);
				_host = host;
				_port = port;
			}
			catch(err: Error)
			{
				Log.trace(err.message);
				close();
			}
			return (_socket != null);
		}

		private function connected(evt: Event): void
		{
			Log.trace("client connected.");
			_socket.removeEventListener(Event.CONNECT, connected);
			_socket.addEventListener(Event.CLOSE, closed, false, 0, true);
			_socket.addEventListener(ProgressEvent.SOCKET_DATA, received, false, 0, true);
			_socket.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler, false, 0, true);
			_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler, false, 0, true);
		}

		private function closed(evt: Event): void
		{
			Log.trace("client closed.");
			if(_socket != null) close();
		}

		private function received(evt: ProgressEvent): void
		{
			var message: String = _socket.readUTFBytes(_socket.bytesAvailable);
			Log.trace(message);
			_optionFnc.call(null, message);
		}

		private function ioErrorHandler(evt: IOErrorEvent): void
		{
			Log.trace(evt.text);
		}

		private function securityErrorHandler(evt: SecurityErrorEvent): void
		{
			Log.trace(evt.text);
		}

		public function send(message: String): void
		{
			if(_socket != null && CommonUtils.isEmptyString(message) == false)
			{
				_socket.writeUTFBytes(message);
				_socket.flush();
			}
		}

		public function close(): Boolean
		{
			var result: Boolean = false;
			if(_socket == null) return result;
			try
			{
				_socket.removeEventListener(Event.CONNECT, connected);
				_socket.removeEventListener(Event.CLOSE, closed);
				_socket.removeEventListener(ProgressEvent.SOCKET_DATA, received);
				_socket.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
				_socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
				_socket.flush();
				_socket.close();
				_socket = null;
				result = true;
			}
			catch(err: Error)
			{
				Log.trace(err.message);
				result = false;
			}
			return result;
		}
	}
}