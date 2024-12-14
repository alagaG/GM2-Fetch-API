/// @function
function WEB()
	constructor {
	static __ = {}
	__.queue = new LinkedQueue()
	__.pending = {}
	
	/// @param {struct.Request} _req
	/// @return {struct.Promise}
	static prepare = function(_req) {
		var _promise = new Promise(_req)
		WEB.__.queue.enqueue(_promise)
		return _promise
	}
	
	/// @param {struct.Packet} _packet
	static onPacketReceived = function(_packet) {
		var _pending = WEB.__.pending
		var _promise = _pending[$ _packet.id]
		if (is_undefined(_promise)) return undefined
		
		var _res = _promise.response()
		_res.update(_packet)
		if (not _res.hasPendingResult()) {
			_promise.invokeCallbacks()
			struct_remove(_pending, _promise)
		}
	}
	
	/// @function
	/// @param {id.Object} _context
	static consume = function(_context) {
		if (not object_exists(_context)) throw new InvalidSelfException()
		
		with(_context) {
			var _queue = WEB.__.queue
			var _pending = WEB.__.pending
			while (not _queue.isEmpty()) {
				var _promise = _queue.dequeue()
				var _req = _promise.request()
				var _id = _req.send()
				_pending[$ _id] = _promise
			}
		}
	}

	/// @param {real} _id
	/// @return {bool}
	static isPending = function(_id) {
		return not is_undefined(WEB.__.pending[$ _id]) and struct_exists(WEB.__.pending, _id)
	}
	
	/// @param {real} _id
	/// @return {bool}
	static isWaiting = function(_id) {
		return is_undefined(WEB.__.pending[$ _id]) and struct_exists(WEB.__.pending, _id)
	}

}
new WEB()