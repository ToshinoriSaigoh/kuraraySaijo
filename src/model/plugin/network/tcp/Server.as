package model.plugin.network.tcp
{
	import common.*;
	import flash.events.Event;
	import flash.net.Socket;
	import flash.net.ServerSocket;
	import flash.events.ServerSocketConnectEvent;
	import flash.events.ProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;

	public class Server extends Plug
	{
		private var _port: uint;
		private var _server: ServerSocket;
		private var _sockets: Object;

		private var _optionFnc: Function;

		//コンストラクタ
		public function Server(f: Function)
		{
			super();
			_sockets = {};
			_optionFnc = f;
		}

		//待ち受け開始
		public function listen(port: uint): Boolean
		{
			if(_server != null) return false;
			try
			{
				_server = new ServerSocket();
				_server.addEventListener(ServerSocketConnectEvent.CONNECT, connected, false, 0, true);
				_server.bind(port);
				_server.listen();
				_port = port;
			}
			catch(err: Error)
			{
				Log.trace(err.message);
				close();
			}
			return (_server != null);
		}

		private function connected(evt: ServerSocketConnectEvent): void
		{
			var socket: Socket = evt.socket;
			var key: String = socket.remoteAddress;
			Log.trace("server connected " + socket.remoteAddress);
			socket.addEventListener(Event.CLOSE, closed, false, 0, true);
			socket.addEventListener(ProgressEvent.SOCKET_DATA, received, false, 0, true);
			socket.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler, false, 0, true);
			socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler, false, 0, true);
			_sockets[key] = socket;

			CommonUtils.delayRunNoData(500, run);
			function run(): void
			{
				send(socket, getOption());
				closeSocket(socket);
				_sockets[socket.remoteAddress] = socket = null;
			}
		}

		private function closed(evt: Event): void
		{
			var socket: Socket = evt.target as Socket;
			Log.trace("server closed. " + socket.remoteAddress);
		}

		private function received(evt: ProgressEvent): void
		{
			var socket: Socket = evt.target as Socket;
			var message: String = socket.readUTFBytes(socket.bytesAvailable);
			Log.trace(socket.remoteAddress + " " + message);
		}

		private function ioErrorHandler(evt: IOErrorEvent): void
		{
			Log.trace(evt.text);
		}

		private function securityErrorHandler(evt: SecurityErrorEvent): void
		{
			Log.trace(evt.text);
		}

		public function send(socket: Socket, message: String): void
		{
			if(socket != null && socket.connected && CommonUtils.isEmptyString(message) == false)
			{
				socket.writeUTFBytes(message);
				socket.flush();
			}
		}

		public function closeSocket(socket: Socket): void
		{
			if(socket != null)
			{
				socket.removeEventListener(Event.CLOSE, closed);
				socket.removeEventListener(ProgressEvent.SOCKET_DATA, received);
				socket.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
				socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
				socket.flush();
				socket.close();
			}
		}

		public function close(): Boolean
		{
			var result: Boolean = false;
			var key: String;
			var keyList: Array;
			var i: uint;
			var socket: Socket;
			try
			{
				if( _sockets != null )
				{
					keyList = [];
					for( key in _sockets )
					{
						keyList.push(key);
					}

					for( i = 0; i < keyList.length; i++ )
					{
						socket = _sockets[keyList[i]] as Socket;
						closeSocket(socket);
						_sockets[key] = socket = null;
					}
				}
				_sockets = {};

				_server.removeEventListener(ServerSocketConnectEvent.CONNECT, connected);
				_server.close();
				_server = null;
				result = true;
			}
			catch(err: Error)
			{
				Log.trace(err.message);
				result = false;
			}
			return result;
		}



		private function getOption(): String
		{
			return _optionFnc.call();
		}
	}
}